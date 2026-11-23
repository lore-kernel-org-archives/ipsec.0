Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430564;
	b=0/w8oamm8QbRQ6wR3f2V2OgcqfN2hybZMZpE+WMbH0DZwZE9/6i4tZGnRawYYRIqHxsV
	 XSvZ5Ayj7FJbclMlPbOgUrYr4mrn6FDe0sfr4iqcdr/DKbHtFKqmCQTZl9Nk9d6bj5noY
	 1fD83l4Sls6vscHrgq+zGIs8Q9mv94k8MZ6w96TRmbdEiP6uGwjiXN04E7spx840ma5gh
	 Ip6bXaDec8taleFtQWl6a/oAWmZqW4ySrKlteOG5CkwMejSz/sYiFJMOK/Ythdt5WL8Te
	 oiRC+EivPajziAjiaZ5Rr8rWreTiDOWf8Jll8+l1lA30U/j7Z0x9ckAFsVZb2RYUZVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cwt87uUsOrwu5RSttuWdxqXXfcvorQyjbx6LQp+7f0U=;
	b=vLDKnzSgB7feC0NGjz8pZygZszGW/iFwAuRcz7zJuc7lXOGMJ5bN8Lt7s5/vaLNZyCRZ
	 VAXMgikSCkHqvYyrYv/fbQ4hW6pviZHE9f988slttixccWi+rABmTefV3RRIJOnak4JVn
	 BI4R9STAv8ojMMmaUKRlU+jGd+UKpZEeWOCT0ZtYseuJGs01UO6VT42/dcVDeSizyS1VX
	 ElJKykFTzWS0E6ybmOLUPuag19A6xbhJ3+t/KevdFNiZSHsNcqz/slkkrUa52oTQVeVxU
	 2XXdzjUYDL4OFQnVv8DZyMg2IcXN39mte7QV9CZ43jf41G4ZrLZriTspoan3DNcsi3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=cFwTSLt2;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723C0606A333
	for <ipsec@lists.linux.dev>; Mon, 23 Nov 2026 10:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 723C0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=cFwTSLt2
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a60f90a924so1095121b3a.3
        for <ipsec@lists.linux.dev>; Mon, 23 Nov 2026 02:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795430563; x=1796035363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwt87uUsOrwu5RSttuWdxqXXfcvorQyjbx6LQp+7f0U=;
        b=cFwTSLt2QTlutcQ15kIpWfCxx4jwOq+XzsJIoBtolGLZw2IEXRQzBj0bCKlr5ouUzR
         C/PxS6G1tQAtwk6deyAtWJKgUilsKXnGTOOozRaCk/5AjsJH9GYZsXOSpml3OBs/RWyn
         UWrHzSwEsUSu3MnyQTN8BhAbqGQRXuMyW1nsz9wx4t0hnDaxJlApgE8a5rxehUgttNqa
         pfsvVFotkoWWjPcsg7yMMKfExn1XGD6/xabnDou7NSAhjDyn+cZ2ChkOIqkB4LnGVidF
         4ws8YYO+jaAZiKlhTvBGDSnN7+o9o1EiOgQnlfN8iT0QIwdx8kcgw1xJhjVQ9/qZpzPs
         0zIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430563; x=1796035363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwt87uUsOrwu5RSttuWdxqXXfcvorQyjbx6LQp+7f0U=;
        b=Zn8jqXXuIWq31sNW/XCFcBTUGwm3MowdMULb7+J4f/4ImbafEg5vp3ngfKTDs4NDew
         1/LTOdNSKMn2VVeAgsR17gW5IOqDwSI5WlrMUd0F3dR0zYbXbBjvYa0e+Y7b60oSnw1c
         JKd00DzBw/1XdIBto/gdQmqo9rgNXnbfSBX/OrLutmdygfVQMqxv9b5TwvZHPXvR/udG
         mtO18UcdEaKzsLO17uj9kz3upnH08ovT1pvhXNKF3aZeG6ewcdASFwqVRNSU8YDx17cF
         vfPwPOkFEf0sHirJaoM+hRBpXPyY7KF7QmVwJxsJBt7u0+rxeM+m4iK0+ZiMgvnyXMb7
         fMXw==
X-Forwarded-Encrypted: i=1; AL+hErF+7gkGw3BYB1bjXwSCrle++V+9UOav3NXcScMs7NOuKj0KFsRqbmmEaMBi6P6769BK3K+oyg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9GV15K4XYlDfQO/sHx4wvn726Ydz6Fq2wJAKrKDI+Sq2JxtCFh
	s1iVx7vGv5TmXBCDP2D22/iAkDPvxtaNVQ/XrWsJZCxBweAAV6tc721qHyav32la+Jk=
X-Gm-Gg: AZFdTZejAmXaEu6AJvS61OL3oWYtuUIgP7wvCtIK6XqA9gcaI7rMfMm6Cs03fibN7Jo
	sibKM93UHqLb+Wdpgpk11RmRCCbKONnMR5WWDLR17RvIHq9MND+4EwQp+lO+RpZAVjQ3Yo7hQq5
	R2OEjMyAMfUYgS4P047bKwxaqo/71YIpIitGnt62CN4MvvudnF56mi65e05xJL1rCGJCgot3VaZ
	K76mhj+COgxlQgzVNQPiQrfsKwQYmz2bQsVvzIkNPC1hpYD/EBVGNM+UKEUqD8R8NdJK1bNalMw
	LYmV8c3V3878aehtnRCoy4fo1pAbUg5226JrHWw5PVgost5rnPGjY4dtAch4S1wZGRYrLZya2lc
	fK51RzaxCIw0yMtiMw/pmItJ8Ox1ZoyZRVXehQUOmm0dN22Y8R1PKgQyEa4oLIGDter4nN2vu1X
	0RPI/W3I9bJFrhMx3yXxoq7OP3KkKcS8sQkA8VEmvlnK0b/qxQxntR0A0H94mS69/hYXZGIDjEW
	zwWykxjhOihDneUpPh9ebncce8qrJ9go0Xd9u7V+x8bLlRGuZsMaNqlXoGkvfbRt443bp/OqMFq
	3j7e35yp1hmQbvz7uW77hq4BQH43w1JUZG/t
X-Received: by 2002:a05:6a20:4308:b0:3eb:b2ce:7b4f with SMTP id adf61e73a8af0-4014c34fdfemr11751808637.68.1795430562727;
        Mon, 23 Nov 2026 02:42:42 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde84cd5ed8sm2283731a12.10.2026.11.23.02.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:42 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>,
	stable@vger.kernel.org
Subject: [PATCH ipsec v2] xfrm: use the frame's own socket in the too big checks
Date: Mon, 23 Nov 2026 17:42:36 +0700
Message-ID: <20261123104236.4179425-1-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__xfrm6_output() decides how to report a too big frame by looking at
its sk argument, but xfrm_local_error() reports to skb->sk and
dereferences it unchecked.  The two differ for a UDP tunnel: vxlan,
geneve and other udp_tunnel6_xmit_skb() users pass the tunnel socket as
sk, while a frame they forward has no skb->sk.  When such a frame takes
an IPv6 tunnel mode xfrm bundle and exceeds its MTU, xfrm_local_error()
oopses:

  Oops: general protection fault, probably for non-canonical address
  0xdffffc0000000002: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: 0010:xfrm_local_error+0x92/0x190
  Call Trace:
   <IRQ>
   xfrm6_output+0x599/0xae0
   udp_tunnel6_xmit_skb+0x713/0xd90
   vxlan_xmit_one+0x1ebc/0x3490
   vxlan_xmit+0x1369/0x6540
   dev_hard_start_xmit+0xe3/0x5b0
   __dev_queue_xmit+0x18e7/0x3550
   ip6_output+0x360/0xec0
   ip6_forward+0x1573/0x35c0

Commit 1620c88887b1 ("xfrm: Fix the usage of skb->sk") changed both the
IPV6_DONTFRAG test and the local error test from skb->sk to sk.  Test
skb_to_full_sk(skb) in both, as xfrm6_tunnel_check_size() does.

A frame without a socket then goes to ip6_fragment(), which sends an
ICMPv6 Packet Too Big, also when the tunnel socket sets IPV6_DONTFRAG,
where it was dropped silently.  For callers that pass a NULL sk, such as
ip6_tunnel, the error goes to skb->sk again, as before 1620c88887b1, and
a request or timewait socket that vrf passes as sk is no longer read as
a full socket.

Fixes: 1620c88887b1 ("xfrm: Fix the usage of skb->sk")
Cc: stable@vger.kernel.org
Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---

Notes:
    v2: also use skb_to_full_sk(skb) for the IPV6_DONTFRAG test, as the
    review of v1 suggested; drop the code comment.
    v1: https://lore.kernel.org/all/20261114125552.1319352-1-rmustafin@cloudlinux.com/
    
    Tested with KASAN on 7e1392a42ea2: a frame forwarded through vxlan over
    IPv6 ESP oopses without the patch and not with it.  Through ip6ip6 over
    the same ESP tunnel, a too big frame is dropped as before; ping now gets
    EMSGSIZE on its error queue instead of a Packet Too Big.
    
    Not touched here:
    - iptfs_is_too_big() has the same mismatch (IPv6 oops, IPv4 silent drop);
      it was pointed out in two reviews:
      https://lore.kernel.org/all/20260908224856.1591189-1-kuba@kernel.org/
      https://lore.kernel.org/all/179369310739.488856.16665150928122536725@kernel.org/
    - skb_to_full_sk() can read a freed listener when a bpf syncookie request
      socket is redirected and queued; the bpf_sk_assign series handles it:
      https://lore.kernel.org/all/20261119142231.2612515-2-razor@blackwall.org/

 net/ipv6/xfrm6_output.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/xfrm6_output.c b/net/ipv6/xfrm6_output.c
index 44b221a09a0c..d38311645908 100644
--- a/net/ipv6/xfrm6_output.c
+++ b/net/ipv6/xfrm6_output.c
@@ -88,14 +88,14 @@ static int __xfrm6_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 
 	toobig = skb->len > mtu && !skb_is_gso(skb);
 
-	if (toobig && xfrm6_local_dontfrag(sk)) {
+	if (toobig && xfrm6_local_dontfrag(skb_to_full_sk(skb))) {
 		xfrm6_local_rxpmtu(skb, mtu);
 		kfree_skb(skb);
 		return -EMSGSIZE;
 	} else if (toobig && xfrm6_noneed_fragment(skb)) {
 		skb->ignore_df = 1;
 		goto skip_frag;
-	} else if (!skb->ignore_df && toobig && sk) {
+	} else if (!skb->ignore_df && toobig && skb_to_full_sk(skb)) {
 		xfrm_local_error(skb, mtu);
 		kfree_skb(skb);
 		return -EMSGSIZE;
-- 
2.52.0

