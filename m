Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408190;
	b=wHoe53YKxfQZMLl9PVYSEDLNN5EBCq8lpM4nzBNITWionLFOgqXRx6DwsdQDUfTssGLZ
	 ouD6TrHHMYVkRpUBz/F/0OL5zXzmTX0Sao/Hy6B2+KPb/YaztyzSCBkBIM7f7kpEH19mf
	 Iu7O6BRRDE7EJURSdzEZCBQ15b3UM7Qr7B1Xa+R2t8UJ2bdhhg2o+I2L5/6hJODmP29YH
	 tpwpD4fS6XBMLYGqx0RR0OME/3Uuiabiy7uY/qLibsN2KKZUfi9T/XxCkdWFrP+kS7E7P
	 tyg1w42cdAtfYLHMTD4hA0gp23u5e8++Kv91IRSeUvuAVOaZUNVe3KZ0lA230V1TMqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9WFHo8GeZELncIjowQIjRTjb0VoQunjDuTg0qWyCJAA=;
	b=bScn8zPd5OJTEWzFXsw3PE9bHx9e3iOFjKAKGCaqhMsXjPJMtzmYsMxZCt2FJ64TbXbM
	 Mz9yMK+MXiJl/+S2iMYLS1WlAQzVACFVri+Vyr08uX26kkUcUoYu/S8mcFUQ5a7GqpILh
	 xmKcN8WC+2TjyQHCtPZ0U21tBKS7/D1rExs4OW4uybc75mxYiOdKVsVjL+eZwsxQlz2PB
	 vAgcM2ZXSiKXIp/HApvMTDxPxKchji65yO9gg0iEQzxhx7HfrMGmEoDaFEthOuj3p/e2G
	 iOCUz3RJUyTNhLF1XiK/9Et4vGC0y6usEgpQzKNdFU7jG5Gupam01uytruvgd7yydNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1LG000a;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0207A606A32D
	for <ipsec@lists.linux.dev>; Mon, 23 Nov 2026 04:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0207A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1LG000a
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3869b68caecso3519925eec.0
        for <ipsec@lists.linux.dev>; Sun, 22 Nov 2026 20:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408189; x=1796012989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WFHo8GeZELncIjowQIjRTjb0VoQunjDuTg0qWyCJAA=;
        b=b1LG000aIDvE7dqCokX3rgEmd9Nl71CcMwe4vWMtSDbs+PfzmvFjnQK+59zekmSDkQ
         H7J2J8AE5pA2Vgd361oaYsZ7DeU1S8hxflLvGJ7dN9hxOdodQGgRverP2T0+faOH65iy
         1yM1K3Z+tH6WUa9Da97PzIC1W5AGhHtcfnhBCvFee1OBvl+lSi+Bq6RBpqPB7i1KgeMq
         VyEPnNdL6vxB8JGk8Yx8UcNlNu4cbUE+Hrw1ef0XnVgXT5s4YrBFrSmhZIrBg1qxOD80
         neIf8NOaXGhUf4fOYjY9Xz3TjG+cAOcdAUiPGb23dUYgzK+Cxq+0p5CFYsVtwnuqiDzl
         4Vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408189; x=1796012989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WFHo8GeZELncIjowQIjRTjb0VoQunjDuTg0qWyCJAA=;
        b=pEx85K67UY0TGPTveoKwZRVbAP9ZuREwJfD2enVLuliiA4qOlaqMMyy3zsIWwHjTOm
         A8MrFaVHglD1RKNowituUZuatZQw6ZaxmevbWgB9SidnW8cAQEW2nfOF2SomluJzfedL
         0jZ18LbC/1bGPqhkQjicIuWCq8nVcOmf2dET24qj8zLcDmWsduOXiHBg9KOSvANI33LO
         +dqMhZ6DN9BTsxzrVYfdwMAney8gT4D2flfSabq86vIabj2+UoH77QRi7IpLiADBjwNB
         oaOThgeWeNStifSsXU7KaM9GQKhAHQVauNMwrwqr8b48r4X52UweGKG2VB+KniqWwtgp
         La2w==
X-Forwarded-Encrypted: i=1; AL+hErHYti0BWbt3km5CMCm9Xb0898mF+2o+agYheTsfzlujA3gktmjslTTnR/p2zI1Rf8sSoQ2Lsw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Sb3q1OxZIehILaGybOx95F5y+cpZHshEDIaXA8LOY3XtleW5n
	R+LzV7663drkD48JePWOFIZi/5JXNj08gEwgTRrzfcfyOKc+B9GtdJUY
X-Gm-Gg: AZFdTZccgarxXhl4kCgy7GMDLGn98isp4lryQD9oSx0uttMaRZyXUIjGmVENErhShLh
	Lis5L2zAZbH6S6tWl5J3vMhsXi+VbG7dAZdzT/U7KfWFuLR1hoOriG55amIYnYhiQwkQNGY19Ih
	a9RGS5Fqmj1XA4GnpIuFTUQTTbY/tiPAuZrcNgEdHNqPMxOlUKtOUanqbHmeaQ0AEHbrSR+6GhJ
	xYXNHYn2DQv3s22ar/j1wNItiPcVnQOc8Onu2wX4K8Z4qCVxrDvMRExA4KD+mhCr82pdX6G9Tvm
	HRY+y89A/MoxYm0P7oN/tMW7a/BZEKFSVuzEQ5jzX3LQtEQTFl0fC5b1flglE6GAZwfs1Qq1r5x
	kam9W+iu6BZHwEWDm6JDsndRfGvEiCFCxZ6R7udBh3rvZ44MJgmv2l6qSViSVMEMZYpt+g/cQb2
	h+OPP4NMi13/u79zPNZDJwPorNMwptfEOl5MUrYWw7UyQiTG4/ZXd1seCtHhv0E3Jn6WuLx/VpI
	5F1+rziwi7/5vrMeobTWQMOKbp+jLZwZWdgl5PGRV5rCEtgJi3W6DSW7X6ju28SG1UjUZLp3fq2
	BV501XoEZ3b28KZ7kP17IJPIDsL1XNnzaDZS8Shv6WCdRSobPvO0j0vJVDmkQKBr1Cg=
X-Received: by 2002:a05:693c:600a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3863f13587fmr9290868eec.4.1795408189065;
        Sun, 22 Nov 2026 20:29:49 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm33562090eec.22.2026.11.22.20.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:29:48 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v2 1/1] xfrm: free the policies already cloned when a socket clone fails
Date: Mon, 23 Nov 2026 13:29:42 +0900
Message-ID: <179540803323.3139700.15088508372382876389@gmail.com>
In-Reply-To: <179540803323.3139700.5340002553684152759@gmail.com>
References: <179540803323.3139700.5340002553684152759@gmail.com>
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

__xfrm_sk_clone_policy() clones the parent's socket policies one
direction at a time and returns -ENOMEM at the first failure. If the
policy for the second direction cannot be cloned, the clone of the
first one is already set in the new socket and linked on
net->xfrm.policy_all. sk_clone() then frees the new socket without
xfrm_sk_free_policy(), and the policy is leaked until the network
namespace goes away:

  WARNING: net/xfrm/xfrm_policy.c:4303 at xfrm_policy_fini+0x24c/0x300
  Call Trace:
   xfrm_net_exit (net/xfrm/xfrm_policy.c:4372)
   ops_undo_list (net/core/net_namespace.c:253)
   cleanup_net (net/core/net_namespace.c:713)

Delete the policies cloned so far before returning the error.
xfrm_sk_clone_policy() clears the new socket's slots before cloning,
so a slot that is set holds one of these clones.

Fixes: d188ba86dd07 ("xfrm: add rcu protection to sk->sk_policy[]")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 net/xfrm/xfrm_policy.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index cea6842e6454..dba1851f0b3d 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -2460,6 +2460,13 @@ int __xfrm_sk_clone_policy(struct sock *sk, const struct sock *osk)
 			rcu_assign_pointer(sk->sk_policy[i], np);
 		}
 	}
+	while (unlikely(ret) && i--) {
+		np = rcu_dereference(sk->sk_policy[i]);
+		if (np) {
+			RCU_INIT_POINTER(sk->sk_policy[i], NULL);
+			xfrm_policy_delete(np, XFRM_POLICY_MAX + i);
+		}
+	}
 	rcu_read_unlock();
 	return ret;
 }
-- 
2.43.0

