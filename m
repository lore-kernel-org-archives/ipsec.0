Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405141;
	b=JBGtPxhOOChjnWGQwAMMABWKrwLQMFEtz5AIKkA0KrnwpG0EcRIF0FeK470ECFuAfaVW
	 IwV2qouz1cFVKhgp8fAbM0G3UbNPZqLapUqokmx4L7SaHFThbW63a0b1ScQfDxSZhd7qo
	 jQg4HQ5EmZGlcKrho7yfjiwB+U3fxpQUWg8t4M207D/sWQLXPOvSOjmQkiPaJSmC9V12/
	 W9XI/eCCn3RbGJYPM1WlH4X6W3EPw0W87rBvzsRbAsJh3Z9gzc3/HsnFn/rTKS6sCmki1
	 e+8Tue4kUIxYDVFCtugWX7Oc1WFKd4YFXQSCb79YWYhB44bEWlGAyjZP8NCVznGhtXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405141;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UhdycD3E4TQHSpgQx1RGrt8ODptzt/z2eEdDTelW+XE=;
	b=07FCOqYh7M8vOj9IPWLQVtPWPFfzxESiU1dDGZIWjnSbI/Fo15+OQP+bzemO4zfq6nFH
	 ezE6VJEMLeAF2wVmpPPnNgoClNxSgCvmDYq3yXooMg0MsKBNyu5Lsoc7AxqXAph52XPI8
	 8Gb+m1oS0UxFCk2Ut2psApUzExastJ/BKDrgNsmq1rHmBtDsNqmySFLIbOuby8B/aZsL7
	 xSrd6+raSQ2osaKY4i4pUdnYWU4lgg7BtgZ8E2wHzfLnPZLt1i4uN+TDbYvlp+boItinn
	 Lrg2g9tBFJoWz49waWgnr2lxT+8HTHd1eo+KlY8nvCTN4qKINFW+fUKizNxAgkTZiLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EgZTIO76;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7CE606A31A;
	Mon, 23 Nov 2026 03:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EgZTIO76
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75CEE1F000C6;
	Mon, 23 Nov 2026 03:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795405140;
	bh=UhdycD3E4TQHSpgQx1RGrt8ODptzt/z2eEdDTelW+XE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EgZTIO762Khh+MWbss2i4AIu+aiSB8x9Re7+Q5cfwPJUb2xco6B9X3kyu+Zy4jAs6
	 EAIM0FfF5mCkR+EdI5qiOlSNyHH6AhJaRAScSr+uSKqMLj9H04TLp1Sg6n8NVZPJCw
	 paY7voFNvHsBZ/YjoR3+uBx3KyKeiw0oBtLmItwJn4qoV7alHbX7XiYqCX9HHkwJqV
	 y3Vbotm/ThgPMPfze28g9rmeSXzxVu8Y5E6VsDBXDxYiwaKtnUdIx8aV2Wi6XgH8F+
	 AK4VxSkSc4NrCPEdL99vC7uC9mrQckPafzBdxLkoppIRbigU/CE8tT3A7SBjSPgXhD
	 HYRXTIHNZE1Xw==
Subject: Re: [BUG] xfrm: a socket policy cloned for a TCP child leaks when
 cloning the second policy fails
From: netdev-bot+sashiko@kernel.org
To: kyuwoncho18@gmail.com
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 edumazet@kernel.org, kuniyu@google.com, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, ast@kernel.org, josef@toxicpanda.com,
 netdev@vger.kernel.org, ipsec@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 03:38:58 +0000
Message-ID: <179540513898.3135.13913410077710347458@kernel.org>
In-Reply-To: <179505710269.3511679.8893709762919027206@gmail.com>
References: <179505710269.3511679.8893709762919027206@gmail.com>
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

Critical: 0 · High: 1 · Medium: 0 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new rollback loop in __xfrm_sk_clone_policy()
  (net/xfrm/xfrm_policy.c:2463-2469) checks the parent's slot,…
- [Low] The commit message is the raw MIME bug-report email, not a
  changelog.
- [Low] The commit message says a partial clone 'leaves the same mix, a
  new sk_policy[0] next to the parent's sk_policy[1]'.

--

xfrm: a socket policy cloned for a TCP child leaks when cloning the second policy fails

This patch adds a rollback loop to __xfrm_sk_clone_policy(). When a later
clone_policy() call fails, the loop deletes the policies already cloned into
the child socket. The goal is to stop a socket policy leaking on
net->xfrm.policy_all, which triggers a warning in xfrm_policy_fini() when the
network namespace is torn down.

> --===============7878978291613295449==
> Content-Type: text/plain; charset="us-ascii"
> Content-Transfer-Encoding: 7bit
>
> Hi Steffen, Herbert,

[Severity: Low]
This isn't a bug, but the commit message is the raw MIME bug report, not
a changelog. It contains:

- MIME boundary lines and Content-Type headers
- the cover letter greeting and sign-off
- the full repro.c
- a base64 gzip of the kernel config
- an mbox-escaped ">>From 84f048c2..." line before the actual patch
  description

The commit subject is the bug report subject. The patch's own subject,
"xfrm: free the policies already cloned when a socket clone fails", only
appears inside the attachment.

Could this be resent as an inline patch with its own subject and
description? The reproducer and config could go below the --- line, or be
linked.

[ ... ]

> Socket policies are only freed by xfrm_sk_free_policy() from
> inet_csk_destroy_sock() and sk_common_release(), so nothing frees the
> clone of sk_policy[0].

[Severity: Low]
This list leaves out mptcp (net/mptcp/protocol.c) and tcp_v4_send_reset().
tcp_v4_send_reset() already frees partial clones itself:

net/ipv4/tcp_ipv4.c:tcp_v4_send_reset() {
    ...
		xfrm_sk_clone_policy(ctl_sk, sk);
    ...
	xfrm_sk_free_policy(ctl_sk);
    ...
}

With this patch, partial clones for that caller are also freed inside the
callee. Should the changelog mention that?

[ ... ]

> A partial clone leaves
> the same mix, a new sk_policy[0] next to the parent's sk_policy[1], so
> it is not covered there.

Is this accurate? xfrm_sk_clone_policy() clears the child's slots before
it calls __xfrm_sk_clone_policy():

include/net/xfrm.h:xfrm_sk_clone_policy() {
	if (!sk_fullsock(osk))
		return 0;
	sk->sk_policy[0] = NULL;
	sk->sk_policy[1] = NULL;
	...
}

So after a failure at i == 1, the child holds its own clone in slot 0 and
NULL in slot 1, not the parent's pointer.

The parent's pointers survive in newsk only on the !is_charged path in
sk_clone(). On that path xfrm_sk_clone_policy() is never called, because of
short-circuit evaluation:

	if (unlikely(!is_charged || xfrm_sk_clone_policy(newsk, sk))) {

> diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
> index cea6842e6454d..c6d5c7582af73 100644
> --- a/net/xfrm/xfrm_policy.c
> +++ b/net/xfrm/xfrm_policy.c
> @@ -2460,6 +2460,13 @@ int __xfrm_sk_clone_policy(struct sock *sk, const struct sock *osk)
>  			rcu_assign_pointer(sk->sk_policy[i], np);
>  		}
>  	}
> +	while (unlikely(ret) && i--) {
> +		np = rcu_dereference(sk->sk_policy[i]);
> +		if (rcu_access_pointer(osk->sk_policy[i])) {
> +			RCU_INIT_POINTER(sk->sk_policy[i], NULL);
> +			xfrm_policy_delete(np, XFRM_POLICY_MAX + i);
> +		}
> +	}

[Severity: High]
Should this test np instead of reading osk->sk_policy[i] a second time?

The parent slot is read once in the clone loop with
rcu_dereference(osk->sk_policy[i]) and again here. Nothing keeps the two
reads equal.

The listener is not locked on this path. tcp_v4_rcv()->tcp_check_req()
runs on the listener without bh_lock_sock(), and tcp_v4_send_reset() clones
from sk into ctl_sk. Meanwhile, setsockopt(IP_XFRM_POLICY) can change the
parent slots through do_ip_setsockopt()->xfrm_user_policy()->
xfrm_sk_policy_insert(), which only holds net->xfrm.xfrm_policy_lock.

Could this pass NULL to xfrm_policy_delete()? Suppose the listener has only
sk_policy[1] set:

clone loop, i == 0:  osk->sk_policy[0] == NULL, child slot 0 stays NULL
clone loop, i == 1:  clone_policy() fails, ret = -ENOMEM
                     concurrent setsockopt installs a dir 0 policy
cleanup, i == 0:     np == NULL, osk->sk_policy[0] != NULL
                     xfrm_policy_delete(NULL, XFRM_POLICY_MAX)

xfrm_policy_delete() dereferences pol straight away:

	struct net *net = xp_net(pol);

	spin_lock_bh(&net->xfrm.xfrm_policy_lock);

On the sk_clone() path, this would oops in softirq context.

The opposite ordering seems to leave the original leak in place. Suppose
both parent slots are set: slot 0 is cloned and linked on
net->xfrm.policy_all, and the slot 1 clone fails. A concurrent setsockopt
with a NULL optval and optlen of 0 then clears both parent slots in
xfrm_user_policy():

	if (sockptr_is_null(optval) && !optlen) {
		xfrm_sk_policy_insert(sk, XFRM_POLICY_IN, NULL);
		xfrm_sk_policy_insert(sk, XFRM_POLICY_OUT, NULL);

The cleanup sees osk->sk_policy[0] == NULL and skips the real clone.
sk_clone() then takes its free path, and the xfrm_policy_fini() warning can
still fire.

xfrm_sk_clone_policy() already sets the child slots to NULL before cloning.
Would checking "if (np)" on the child pointer avoid both cases?

>  	rcu_read_unlock();
>  	return ret;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179505710269.3511679.8893709762919027206%40gmail.com
