Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660975;
	b=sofdzV1yKfVjMklW2K0e9pI+t+bYAZl8JrFWRzFP0KS3rw+Xjd3ePP9hVplf/cbI1sVo
	 AHVnTZ5Ipnvkn1rEeUz98JLLv/YsAgN6u58FU4jZbcEQ5z5vV9e44zlfHYVHyx+CZ6dc2
	 /0R3T++n2T75mOl1YiaJbBwW3FZ8H+afBjOowoTJ8P3Ra0vwiZ3BDsPJ5YsuhLNmBJFj1
	 ckvui74kXEl2eqUoRva/foF6jGMB1swmKvHkFmVMuSvUMRm/ETrj+DEeMCY4InD3EFH29
	 oCOnmRafXzSAvPviAaSBMg/thZERbJKDHTO/RheoiI7GmrdMR3Zj+tcl/DpAa/L/NYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qwj16+X92OdYAGNxs/Vl6la6Mew3rTAyjN2yfxuPiQg=;
	b=xcFcCjxKys75PD8rRXzOJfkYyCoaMpDHRDUQjqAp0Ge5BXuGvfo0528me+cbcWqelU3k
	 a5k6UjNBeqTSFbMiG+8YXO8+068Q8Ud1jHeriRxu53OKhp+oXeA3LjYuAEufVtJ57Uga8
	 Jef07PiJ2W+9k5KX4O2UvGBsl07PnTpRa8MxcHCyWFEIWdrlfQS7/MN9T3xcxIiSZU1al
	 8hzI78nFL/RNR7g3bim2DdDOZaIdtHJzO8EI0OSQmfKGwBsLTr39/tUnlMDVT9N7ZRcdu
	 jz+gsWffof+sxcNMWTYtRRfIXVEJ61v49O4QNHbdWgrVe/YsNgK6Wi9cL93F9TWrqSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=Wdmjka2G;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49935606A323
	for <ipsec@lists.linux.dev>; Sat, 14 Nov 2026 12:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49935606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=Wdmjka2G
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso2280544a91.2
        for <ipsec@lists.linux.dev>; Sat, 14 Nov 2026 04:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1794660974; x=1795265774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qwj16+X92OdYAGNxs/Vl6la6Mew3rTAyjN2yfxuPiQg=;
        b=Wdmjka2GCuzd5t3NC9NSZ4JkbuH8N33pIruId5If3867tZO7Y5Yxpha6qSO/WGWuyW
         6kRRh/p4NMAaNHDsmT38nPFm5+oheJb6qqVkHgxVoPUyl3lwt3pWCQZWIkORasIs+TbW
         d4/3f0bHivwE30uz77zmykk+ZYEt9AkxojvqyALS/o5c1lCS7vjRPj98atLiJqcks4oX
         741kGM8448INoiczeADE+9aApvX0n5UeLkAdlXqcOQ63Rz3W5NMtZ/Re67FR+rIuA2YJ
         jcTJc7ue+OS37OJh0O3bwPyA8BFr0VPsryZJe2vilpwZCnkoqprESxlLH/157e6yQ/3x
         kPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660974; x=1795265774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qwj16+X92OdYAGNxs/Vl6la6Mew3rTAyjN2yfxuPiQg=;
        b=Pu4FY/+RznPB7nI1A6kbS+ihcu87ryNHP0H5jXEuXs5kzMb+t634PvMn0OHfgYObsa
         2SoFoEtkCyYO49l5pOOoU6tvUf0AeIf0TDbDnjvEJ+LT02DfO+xQBnfbGUYVs4Sw29Ct
         dfNwXfQCQ8MxKmxlj2YDZAZjVadEzyuG0cPJ4XkO6II3oQKEVI9Pj48EEc/hPCO9aMPH
         G1ZNmRuk8tWRAjB4LPQnuaEVFoMy/oEkiQ5a8t1D0Nd2qDMWSJ5dp9AbW8dVoSraV41M
         aDqqekSz0j2cHzpLsuf8CcMTMQpw+vnzvRwe2vbvIwil9igq4Zc6rM4ggZztIAoL9CUQ
         R8Mg==
X-Forwarded-Encrypted: i=1; AL+hErFMuieIJPONdNGXWvFiGEgmZuzPr2ZpSQGvg01yPDSodYQlGGU52wnkLbMgRDGNGv39Okcd1w==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Jq5gO2TU3zvavDfLSuBOU8tUi+CNPL7R4THsm3iZS63Zc7t0q
	shi7lYzsNh8IjdHz46Qclzmq7lvkdC/CFY0uV9POuTciE5epjLtHLcn1hOM4kSwke5w=
X-Gm-Gg: AYBFou21UkO02RJHgG3AKmAy43LEDK/Z2P1Mb2mF96xo0ympDOPP72YWqNf9esBWnwO
	6+RG/blQUll0AB1XzG7ybYdbCf0MpeiU1c9HEfwZMxkSJOGysCOV2gGrPO/oN76TJP2vxvKiuCF
	hdVNqJM+3fkDIQdqEHgYvKu9e0opd7zv6f3TDKG4oXFIzTXD0GoDH1Rna1z/01nGyVB6wcAD4G7
	Ub/Qx8KGN0ssfU9eRSudxNEqRRKl1bR8lPF+ITATSp4yUep02j1Sf6OSjgbOFa2XcGo0NwfNjKI
	Ff2efm6QFlDwkq9a0xrk7dgRToIx5pqucvKN7Pl5CjU9j4o1ScWlE+Lt7qBfTqZ56tbqJmR/Nc2
	wVTppuBFcpzTnt+wNc7PQUqGnCZoa+wb9+M4sUQHvv3A9Z1eiQB0NxsWacaet8jog8HTNlxfwBr
	OEsXAy5M/++NG8wYFn/pITpRzv+eRZ6Pa80xsh3KLjY57qe3Z8ZFGkOaSvzIG0afqWPPEr5si0b
	QmfEn0IeDy8x+YvjxHIw7qc6aMYOKbA7ZIJZkk8Dq1gwAxGQ0p6mPhqc7HJfEHwwzPrBRlLfpkQ
	idSX+llr74CAHiCceskBR+0HOZFVOhij2KwVAew=
X-Received: by 2002:a17:90b:2c8d:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3b1b0d8a4d0mr5854784a91.64.1794660973616;
        Sat, 14 Nov 2026 04:56:13 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18c800esm2332710a12.29.2026.11.14.04.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:56:13 -0800 (PST)
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
Subject: [PATCH ipsec] xfrm6: gate the local error on the frame's own socket
Date: Sat, 14 Nov 2026 19:55:52 +0700
Message-ID: <20261114125552.1319352-1-rmustafin@cloudlinux.com>
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

__xfrm6_output() decides to report a too big frame as a local error by
looking at its sk argument, but xfrm_local_error() reports to skb->sk
and dereferences it unchecked.  The two differ for a UDP tunnel: vxlan,
geneve and other udp_tunnel6_xmit_skb() users pass the tunnel socket as
sk, while a frame they forward has no skb->sk.  When such a frame takes
an IPv6 tunnel mode xfrm bundle and exceeds its MTU, xfrm_local_error()
oopses on skb->sk->sk_family in softirq context:

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

Commit 1620c88887b1 ("xfrm: Fix the usage of skb->sk") changed this
test from skb->sk to sk.  Test skb_to_full_sk(skb) instead, as
xfrm6_tunnel_check_size() already does; commit 6973a21ee73c
("ipv6: xfrm: use full sockets in local error paths") made the IPv6
callees use full sockets the same way.

A frame without a socket then goes to ip6_fragment(), which sends an
ICMPv6 Packet Too Big to the source address of the outer header, the
local tunnel endpoint, and drops the frame, as before 1620c88887b1.  A
caller that passes a NULL sk while skb->sk is set, such as
ip6tunnel_xmit(NULL, ...) in ip6_tunnel.c, takes the local error path
again, also as before that commit.

Fixes: 1620c88887b1 ("xfrm: Fix the usage of skb->sk")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---

Notes:
    Tested in virtme-ng on 7e1392a42ea2 (v7.4-rc2+) with KASAN: vxlan over
    an IPv6 ESP tunnel, a forwarded frame above the bundle MTU.
    Unpatched: the oops above.
    Patched: no oops in 3 runs.  A separate run with nstat in the
    forwarding netns shows Ip6FragFails 0->2, Icmp6OutPktTooBigs 0->2 and
    Ip6FragCreates 0->0.
    The reproducer script is available on request.
    
    Not changed here:
    - The xfrm6_local_dontfrag(sk) test in the same function still uses the
      argument.  Its callee xfrm6_local_rxpmtu() returns on a NULL skb->sk
      since 6973a21ee73c, so that mismatch does not oops.
    - iptfs_is_too_big() has the same sk vs skb->sk mismatch (IPv6 oops,
      IPv4 silent drop).  It is left for a separate patch; it was already
      pointed out in two reviews:
      https://lore.kernel.org/r/20260908224856.1591189-1-kuba@kernel.org
      https://lore.kernel.org/r/179369310739.488856.16665150928122536725@kernel.org

 net/ipv6/xfrm6_output.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/xfrm6_output.c b/net/ipv6/xfrm6_output.c
index 44b221a09a0c..54fcf4b43091 100644
--- a/net/ipv6/xfrm6_output.c
+++ b/net/ipv6/xfrm6_output.c
@@ -95,7 +95,10 @@ static int __xfrm6_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 	} else if (toobig && xfrm6_noneed_fragment(skb)) {
 		skb->ignore_df = 1;
 		goto skip_frag;
-	} else if (!skb->ignore_df && toobig && sk) {
+	} else if (!skb->ignore_df && toobig && skb_to_full_sk(skb)) {
+		/* xfrm_local_error() reports to skb->sk; a forwarded frame
+		 * sent through a UDP tunnel has none, sk is the tunnel's.
+		 */
 		xfrm_local_error(skb, mtu);
 		kfree_skb(skb);
 		return -EMSGSIZE;

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.52.0

