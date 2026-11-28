Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858585;
	b=N4bwSCuqwqpX7rirybIY2XT9zAjz/a3ZuAjHbti5r+WVlQu8wjGPjxhmILMZL6CqZXgr
	 MziTukCiSTfTPfYjIdatTlR1gkOgI0x6jlq6QHU3S+JFadVLRR2XbPJyUDN/RB3ZuyjhO
	 McukYiQPhBip7XM1EhjPBTY+Wrfeh7cfpwvIWKR6hXVBL+qhaO5WB17A7iJbBO2W0f2uB
	 XL9P6BWTQSzFU61sxmIpsN1HU13A3vlWUyVXFX/epjeL0sKWG/uTX4DFPRgWIEyL3wJGZ
	 HlZKmAErjBEc9p3i3P1gZIdPotA/Hbw12KuRpjxwl/pKF1IJIcEdiPFd4PUeM7rx7cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858585;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5JniJf8Ax7BNNR4S3q+B4C5imeatJRVSpHhz/GWQ5Q0=;
	b=MePOSWnbU3fbikQLZO6FPztj+GTN+b+R+NJi9Znn1lfh1dLEBBKqcEtvXfIbM6dLzMVp
	 /yY6+96ElXKYV9T7Zj5YtFvF+SGiSldkIut8ucGOMXAk2zGOJeDq0hFDuiwVwL/t6bcxh
	 eKstZsa2OddvvHUxDCjIYdXUJpchKqWgrZvljl1kwg7qcUT0w/K72aKdN4fj7BGIw09hl
	 BAQ7QsTvilbPT1kLkyhoWkBYtCNFvqk9apkwJa/ZnejhillELFMDmZ5CBVc8uNIH84XFm
	 u9rBkcFqUIg0DIpV4eEfdi6AQmqR4C2fe6p6yyLtipu9xIwj7Q5ogcHZiypAXKtGxIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CGVw6ZfB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9554B606A31C;
	Sat, 28 Nov 2026 09:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CGVw6ZfB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643381F000C1;
	Sat, 28 Nov 2026 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795858585;
	bh=5JniJf8Ax7BNNR4S3q+B4C5imeatJRVSpHhz/GWQ5Q0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CGVw6ZfBv+6FT53Y59tjpqNcX0JfKdKXv9Yd4CkX0T3aI3N/zEKZdP6tOHuKGD+fn
	 P4fvObFNCcrO0XTqPfg36cSfvMp5YwNNB6qvOTmiXEAPozr95aLErcwveCn6hvRYhZ
	 Xz1F+N/LOEiIM5XCH++Y7fE0KE4DyTl2aOSPEgr7BteS+piY2mwUzDF6P1yQu+5Mvg
	 6+WTqa9hHX+tmBN6JYhiLlYlvxyxPG920QiMQ4tBOfVjjWATuMD/U6qjas3l3JM4nZ
	 g+N0KxMaEqr7eoGeI4c1qy7n3mB5MmKScbvxcpbwrjQoVOeCoAAGBurqSMEpHPPout
	 BeYnoISg2NCIA==
Subject:
 Re: [PATCH net 1/2] ipv4: route: fix use-after-free in ip_route_output_flow()
From: netdev-bot+sashiko@kernel.org
To: n0ps1edzz@gmail.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 kuniyu@amazon.com, steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, willemb@google.com, liuhangbin@gmail.com,
 ipsec@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Sat, 28 Nov 2026 09:36:23 +0000
Message-ID: <179585858395.3135.17395458916030659399@kernel.org>
In-Reply-To: <71e47f31ab9eac91c07bc3b9535c87ef3723b961.1795769101.git.n0ps1edzz@gmail.com>
References: <71e47f31ab9eac91c07bc3b9535c87ef3723b961.1795769101.git.n0ps1edzz@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix does not work as submitted, because the RCU grace period
  it depends on is missing.
- [High] The fix leaves the same use-after-free in the code that runs
  right after it on the same UDP send path.
- [Low] ipv4: route: Fixes trailer cites wrong commit for
  ip_route_output_flow()

--

ipv4: route: fix use-after-free in ip_route_output_flow()

The patch changes how ip_route_output_flow() reads the output device. It
now reads it through dst_dev_rcu() inside an RCU read-side critical
section, not as a plain rt->dst.dev->ifindex load. The commit message
says this depends on a separate fix that makes netdev_run_todo() wait
for RCU readers after flushing routes.

> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index cd69242afab07..b16a9d05f2217 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -2982,7 +2982,9 @@ struct rtable *ip_route_output_flow(struct net *net, struct flowi4 *flp4,
>  		return rt;
>  
>  	if (flp4->flowi4_proto) {
> -		flp4->flowi4_oif = rt->dst.dev->ifindex;
> +		rcu_read_lock();
> +		flp4->flowi4_oif = dst_dev_rcu(&rt->dst)->ifindex;
> +		rcu_read_unlock();

[Severity: Low]
Is 95c47f9cf5e0 the right commit for the Fixes tag? When that commit
landed, ip_route_output_flow() did not read rt->dst.dev at all.
ip_route_output_key_hash_rcu() filled in the output interface with
fl4->flowi4_oif = dev_out->ifindex, and ip_route_output_key_hash()
still held rcu_read_lock() at that point.

Commit 2fbc6e89b2f1 ("ipv4: Update exception handling for multipath
routes via same device") removed that assignment. It came back in
commit 874fb9e2ca94 ("ipv4: Restore flowi4_oif update before call to
xfrm_lookup_route"). That commit added the flp4->flowi4_oif =
rt->dst.dev->ifindex load to ip_route_output_flow(), which runs after
__ip_route_output_key() has already dropped the RCU read lock. That is
the line this patch changes.

The Fixes tag decides which stable branches pick this up. Pointing at
the 2017 commit could send the patch to trees where this line does not
exist.

Should the tag name 874fb9e2ca94 instead? If the teardown window also
depends on ca6854799069 and f12d2907992d, should those be listed too?

[Severity: High]
Does this rcu_read_lock() section protect the old net_device in this
tree? It only helps if the code that frees the device waits for a grace
period after rt->dst.dev_rcu is switched to blackhole_netdev. I could
not find such a wait.

unregister_netdevice_many_notify() sets dev->dismantle before the
NETDEV_UNREGISTER notifiers run. So rt_flush_dev(dev), called from
fib_netdev_event(), returns early:

net/ipv4/route.c:rt_flush_dev() {
	if (dev && dev->dismantle)
		return;
	...
}

The flush that does the work happens later, in netdev_run_todo(), after
its only rcu_barrier():

net/core/dev.c:netdev_run_todo() {
	...
	/* Wait for rcu callbacks to finish before next phase */
	if (!list_empty(&list))
		rcu_barrier();
	...
	if (!list_empty(&list)) {
		rt_flush_dev(NULL);
		rt6_uncached_list_flush_dev(NULL);
	}
	...
}

rt_flush_dev(NULL) publishes blackhole_netdev and drops the old device
reference right away:

	rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
	netdev_ref_replace(rt_dev, blackhole_netdev,
			   &rt->dst.dev_tracker, GFP_ATOMIC);

If that was the last extra reference, netdev_wait_allrefs_any() takes
its fast path without any RCU wait:

	list_for_each_entry(dev, list, todo_list)
		if (netdev_refcnt_read(dev) == 1)
			return dev;

The device then reaches netdev_release() in net/core/net-sysfs.c, which
frees it synchronously:

	/* no need to wait for rcu grace period:
	 * device is dead and about to be freed.
	 */
	kfree(rcu_access_pointer(dev->ifalias));
	kvfree(dev);

Wouldn't this interleaving still produce the KASAN report?

CPU0                                  CPU1
ip_route_output_flow()
  rcu_read_lock()
  dev = dst_dev_rcu(&rt->dst)
                                      netdev_run_todo()
                                        rt_flush_dev(NULL)
                                        netdev_wait_allrefs_any()
                                        ...
                                        netdev_release()
                                          kvfree(dev)
  dev->ifindex   <-- freed
  rcu_read_unlock()

The commit message says:

    This requires netdev_run_todo() to wait for RCU readers
    after flushing routes; that fix is a prerequisite of this patch.

That change does not seem to be in the tree or in this series, and the
message gives no commit ID or link for it. The other patch in the
series, "xfrm: fix use-after-free in xfrm_lookup_with_ifid()", only
touches net/xfrm/xfrm_policy.c and relies on the same missing wait.

Could the prerequisite be added to this series or named explicitly? One
option is a synchronize_net() after the rt_flush_dev(NULL) /
rt6_uncached_list_flush_dev(NULL) block and before
netdev_wait_allrefs_any().

About the Fixes tag: commit ca6854799069 ("ipv4: Batch rt_flush_dev() in
netdev_run_todo().") and commit f12d2907992d ("ipv6: Batch
rt6_uncached_list_flush_dev() in netdev_run_todo().") moved the flush
into netdev_run_todo(), after the rcu_barrier(). Before that, it ran from
the notifier, ahead of a synchronize_net(). Those commits look like the
likely origin of the window, but the Fixes tag only names 95c47f9cf5e0.

With Cc: stable and no dependency note, would a stable backport of this
patch alone change anything?

>  		rt = dst_rtable(xfrm_lookup_route(net, &rt->dst,
>  						  flowi4_to_flowi(flp4),
>  						  sk, 0));

[Severity: High]
If a referenced rtable does not keep rt->dst.dev alive, isn't the same
race still open on this send path right after ip_route_output_flow()
returns?

udp_sendmsg() passes the same rt to ip_make_skb() without
rcu_read_lock(). That path then reads the device through the plain
pointer:

udp_sendmsg()
  ip_route_output_flow()
  ip_make_skb()
    ip_setup_cork()
      cork->fragsize = ip_sk_use_pmtu(sk) ?
		 dst4_mtu(&rt->dst) : READ_ONCE(rt->dst.dev->mtu);
    __ip_append_data()
      hh_len = LL_RESERVED_SPACE(rt->dst.dev);
      ... rt->dst.dev->features ...

__ip_append_data() also reads rt->dst.dev->features in several other
places. raw_send_hdrinc() in net/ipv4/raw.c follows the same pattern:

	if (length > rt->dst.dev->mtu) {
	...
	hlen = LL_RESERVED_SPACE(rt->dst.dev);
	tlen = rt->dst.dev->needed_tailroom;

These loads run after the ifindex read and are not inside any RCU
section. Even with the prerequisite grace period in place, can the
"UDP sends raced with dummy-device teardown" reproducer still reach a
freed net_device here?

Should these sites get the same RCU treatment? Or should teardown keep
the device alive while dst references to it still exist?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795769101.git.n0ps1edzz%40gmail.com
