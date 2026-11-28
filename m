Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858587;
	b=qaC6qu31aNN0YPttU9bsXZTv/Hdc6Oy/uMbQ3oQA4yDZdfk+06FsCipYUBF1PNXNDJGy
	 METkjfwUThRXiRFAkZYQNi+R/xoPj79xASblNLmxGj3ccflyZ54KOXfYbWs8sHdrrJcId
	 WMlK6ltjJxGhVw47m6D8o4QoKwse78BHF0wlv3/UQuakhpw4BUK5hPGKY4wrd2fx+xgWx
	 +tfaH1qWuo/jqDnrTUssOAGB45lxIa2YjXLJ2B3xSBNH2jntMygPptxyQXHPXf8bQMJea
	 TuXZjRgpTAb8YHvbdBHtP4pDpYqMe78rGPAe9W1I9awPaWOU2zcW4yJCFzUTCqVlfgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858587;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DVKtRB77pjKumLl0InNIzwfOdZ0b+h+a09XoRP57V3Q=;
	b=s/SW89tSixlQ/AgAsUblyHL6wPKQmkU1o0LhdSDt08rSAGrLwhKZjsW1759bExErEBSx
	 pRKFVGNQMuVidZYhWo5dWmUQL2Ae9AM/jI7iV3nfI+9RaiF6kF5l48kqmeXQi50G74i11
	 x7td9pMLo4epIS29hXrLZmWQHl3oiTyHunsPQSOnMNnshNxT1bmW/qUcD3TfwEdPkfj17
	 otCx7zPa+fKEqX5spMrJsQtistABrDMgyHXuSuW8GENZbCO1pFu8dvyOGjgvU2h89rKge
	 zOUzGOopc/bDjQ6KU1ZaYV0zd4g/IaTdixbt7MVOwrKixFJmUT1QMaf0OBf+SpCbB1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e099H928;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5123B606A32C;
	Sat, 28 Nov 2026 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e099H928
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C832F1F00898;
	Sat, 28 Nov 2026 09:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795858586;
	bh=DVKtRB77pjKumLl0InNIzwfOdZ0b+h+a09XoRP57V3Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e099H928jPFmoT7jqR3wrxa76wXy7PWyyLoc1j71uvisiJy1MxuLKx5ntf9l0Ng/C
	 ckk/zIKeZR1qpgbA4JpysmKonK8ggAHz4JYG39A1B/hYLH20czOt0S01Z47Ywqs7RC
	 0WeJHg/RgAGFapL2FQx18xgcwR4LND/DvlSOyac99Oj9M7h6e6A36e5jiz6bGzZNDM
	 tPP6JeFPhl5giT8zlJHg26QAdDU5HxhjIoxFtw4sRNb8ivuqDymvUAhr9qtFBwaklU
	 94i/fEo8+8lMJApsv+zE72vlGjbny23XsEgkhKzST+TCJkAkrYmjVJsJiQb0y/oESc
	 uz3XmqRt4R//g==
Subject:
 Re: [PATCH net 2/2] xfrm: fix use-after-free in xfrm_lookup_with_ifid()
From: netdev-bot+sashiko@kernel.org
To: n0ps1edzz@gmail.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 kuniyu@amazon.com, steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, willemb@google.com, liuhangbin@gmail.com,
 ipsec@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Sat, 28 Nov 2026 09:36:25 +0000
Message-ID: <179585858536.3135.14235570619606863005@kernel.org>
In-Reply-To: <624bf99e815ca1a98d13ef06684c86148166fe9b.1795769101.git.n0ps1edzz@gmail.com>
References: <624bf99e815ca1a98d13ef06684c86148166fe9b.1795769101.git.n0ps1edzz@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch does not fix the use-after-free it claims to fix.

--

xfrm: fix use-after-free in xfrm_lookup_with_ifid()

This patch changes the no-policy path of xfrm_lookup_with_ifid(). It now
reads the device of dst_orig through dst_dev_rcu() inside an RCU read-side
critical section, instead of dereferencing dst_orig->dev directly. The
commit message says this depends on a netdev_run_todo() change that waits
for RCU readers.

Link: https://lore.kernel.org/netdev/20260908224901.1591334-1-kuba@kernel.org/

> diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
> index cea6842e6454d..eafd090e3aebc 100644
> --- a/net/xfrm/xfrm_policy.c
> +++ b/net/xfrm/xfrm_policy.c

[ ... ]

> @@ -3312,7 +3314,12 @@ struct dst_entry *xfrm_lookup_with_ifid(struct net *net,
>  	return dst;
>  
>  nopol:
> -	if ((!dst_orig->dev || !(dst_orig->dev->flags & IFF_LOOPBACK)) &&
> +	rcu_read_lock();
> +	dev = dst_dev_rcu(dst_orig);
> +	is_loopback = dev && (dev->flags & IFF_LOOPBACK);
> +	rcu_read_unlock();

[Severity: High]
In this tree, does this RCU section close the race?

The commit message says:

  This requires netdev_run_todo() to wait for RCU readers after flushing
  routes; that fix is a prerequisite of this patch.

That change isn't in this tree. Neither this patch nor the earlier
"ipv4: route: fix use-after-free in ip_route_output_flow()" touches
net/core/. The only rcu_barrier() in netdev_run_todo() still runs before
the route flush, and nothing waits for readers after the flush:

net/core/dev.c:netdev_run_todo() {
    ...
	if (!list_empty(&list))
		rcu_barrier();
    ...
	if (!list_empty(&list)) {
		rt_flush_dev(NULL);
		rt6_uncached_list_flush_dev(NULL);
	}

	cnt = 0;
	while (!list_empty(&list)) {
		struct net *net;

		dev = netdev_wait_allrefs_any(&list);
    ...
}

rt_flush_dev() and rt6_uncached_list_flush_dev() call
rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev). They then drop the
old device reference at once through netdev_ref_replace().

netdev_wait_allrefs_any() returns immediately when netdev_refcnt_read(dev)
is 1. The device is then released through kobject_put() and
netdev_release(), which calls kvfree(dev) without waiting for an RCU grace
period.

The only grace period on the free path is the synchronize_net() in
netdev_napi_exit(). It is skipped when napi_list is empty, which is the
case for the dummy device used in the reproducer.

If dst_orig is an uncached output route, can this sequence still happen?

CPU A
xfrm_lookup_with_ifid()
    rcu_read_lock();
    dev = dst_dev_rcu(dst_orig);
    <preempted under CONFIG_PREEMPT_RCU>

CPU B
netdev_run_todo()
    rt_flush_dev(NULL)
        rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
        netdev_ref_replace(...);
    netdev_wait_allrefs_any()        <-- refcnt is 1, returns at once
    kobject_put(&dev->dev.kobj)
        netdev_release()
            kvfree(dev);

CPU A
    is_loopback = dev && (dev->flags & IFF_LOOPBACK);   <-- freed dev

As far as I can tell, this makes the window smaller but doesn't close it.
That would need a synchronize_rcu() or synchronize_net() in
netdev_run_todo() after the flush and before the devices are freed.

The commit message doesn't give a SHA, Link or Depends-on for the
prerequisite, and the patch is tagged Cc: stable with Fixes: 2d151d39073a.
Could the prerequisite be named explicitly, or sent in the same series as
this patch? Otherwise a stable backport could pick up this patch without
it.

The commit message also names dst_dev_put() as the writer:

  dst_dev_put() can replace a dst's device with the blackhole device and
  drop the reference to the original device.

The dst_dev_put() calls made from NETDEV_UNREGISTER notifiers are followed
by synchronize_net() in unregister_netdevice_many_notify(). The pointer
swap with no grace period after it seems to be the rt_flush_dev(NULL) and
rt6_uncached_list_flush_dev(NULL) calls in netdev_run_todo(). Would it be
more accurate to describe those calls instead?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795769101.git.n0ps1edzz%40gmail.com
