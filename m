Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770982;
	b=HWnEW1+rPYe5uOhg1WXctyj5KUfWQSryK1pTpZ3Yslx4Ij/IjM6SNMNWzdANfeFkmgFk
	 6BD/TL3ZnkjjNNkF/JhwuxzrV3XQPzie5VPe5mxKCYquYOxn1PcnZziZda1qR81pLlKcw
	 FfD0Zfe5fHMzxTM/gHb7WSwt0FFIgNTgcpxbvVg9fsghD9rFWXUdbs0JvpxnnIGBS9mVM
	 KUmCnyiSqpzxY8ib0bd2ERwAhH3fn94Q6tf9YVHgrWjx6nGvBZZWJLdbNBVYU8mRU4I43
	 CvsMfpYrXZ8Irl32hp86Ii2XgzFmRiFSXASmPnjENtg8n8Fb7uIPw20u2hpVQ5pkLGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc;
	bh=HcE4U4ajhU0fYFPRjlDViUPtdh5ql807zszqwyGOmGE=;
	b=Ysgjm9uFIypU3EImXSAarMKUiRMJg+3QFL20CI2L4Gi+tSmpVfA0d6kFLFvZe/4pSVT2
	 DcjSH1i9P58b40L41jywr6m2G57LyL27DyRSNFnspXFmmz9AgaSlcV+OsB6fluvehSXQ5
	 zdFkYzG3AWVs7/I05WXcF7mfwzI7bFzg911VCY1gT8K3mglCNQpkvKU4EWac7tLDvX8t8
	 Mv5npUpOzGwwYMwr1r2gIHhqkpm9Bqklwx3nIT2L2XjcmzCteomX5tt24z/+5DN2kDQRd
	 fdUrENv4cWD/nDPxpOboxiVB4bxNIbxC2lUlVPCj5WZ36oDVbIWYs2DWysxK9oipZnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOFJJysC;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82738606A321
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 09:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82738606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOFJJysC
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2efc8c9ba9fso28245315ad.0
        for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 01:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770982; x=1796375782; darn=lists.linux.dev;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HcE4U4ajhU0fYFPRjlDViUPtdh5ql807zszqwyGOmGE=;
        b=jOFJJysCfDzxakpfeQhlPuCEtY9WaOtcDNXboOZzvn1C+sHD9qSNFZeGQHLdNXgTQZ
         RTEHC+i36exKOVfaYahTROZ5s3ACXRgIgU0QQQ/ZbA8HYqbN/CzC2SSJKmC2EC5tRu4y
         izElC/gWRA6hFebrcUQoS3650rgVRIZYvuxkkFqaIZLmPc1wPf2wV633hcpSrPkHVfRI
         o1pzq0F8Lk6xQLbEkaT8b9r+nuLmcFw9uCUtRJ3gzR4CfTTtn+ikGf6uPVbR/Yayv8Ro
         iaiQXdSaISD24T/rjGNs3dV8Tdq24Gm9fDvIjEz8NxRPP0V58/kW+SVFZb5Z0wkj67u/
         Ae3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770982; x=1796375782;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcE4U4ajhU0fYFPRjlDViUPtdh5ql807zszqwyGOmGE=;
        b=02PmiB4JoPA/F8Wk6NTYygzDru9DFTSMc8DIV+PboW/Bu4ASSYDHhMTIxscJNW2m0u
         bPaSdjoRjVPEd4tEy+KkPa73iFywr+YTuE09zloEJwb7dFIhCt5H8DiS1ph3SxFsjNu/
         nuz+j1YAqC7aRHB4Mxg2zt85B95ziOwpUg/HzzGXC4vtf0vzpF0x8DgI7hPYHFUoIaXz
         S8LmmMqxPXg61XTRaCyukXC69GaIRmOSz3ZZqJEkcgbdofPfegcDqMu9VAOjojCYZUlb
         xGOlyfhN0ktQYAA9sPfmPSD4O84Gnvy59ys3GG8iZy3bBnrlbqvI5P6Pe1xcyeqjwYa7
         IsuQ==
X-Forwarded-Encrypted: i=1; AL+hErFc3qgPOINm4MzAf4rD2+xE7+5II3pIFWw6na0oB/9GiKy5/fNyRQlv9ZZVjJHnHCilIexO4g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+pTVKvp9jBZYl0zLf20DTsAUf8vnDRiB78JRETSwd9tp/RR7bj
	l+RQCknfU/TtviUOPXKEn+dk302sfXo7V+EQjTPmkuqhYT/4QvUcsTM9
X-Gm-Gg: AZFdTZetVIPky9PTo6M40w0zkAlkX9qc4xbCdFgaDh3bADHwhuDnmSYLviMOECxR5KC
	pIY6FFac34HyO32g+MJtkilRpD7N0Ptyb81gG+kg1rCGUCbMxOUmf3h/j1JPZ5U/06R/MuEYyL8
	77B9ImMaOQvjbD3lMyHwPLQRuKLMTeZE3qniJvjA6OM05Zx/yUf06aESo3z76VGx2vgOWOs+anE
	wj1VoSSEislg5XtfIREu0xWUoych5b0zdK2pB8ch8jwWLPPKGbn0jAZkvaIWVPT3rEQJRACtUPH
	rbo/U8szpHS1qD0PkIMFGs2QYW+RX59IigCJBvqMJ7weh/0K4fOZZJWEuAk6jFqWZmQXB53KRKG
	LZjKQklajEVv9yV41rezaGQhGQ7JmQUU0UGzUAqnKvGnZ/5IWkelLY1YYSNr4j/z0e91+TbwkO7
	ImrpXrnf70IK56WkIW95MGB0tELnOyOhg0wu9IHYovOAr7VAOMs/NadrPCzuIYSIhiaKq/W6nqn
	wpFDxsr3k112lc2y4Biqw+uBELoTTYRz9b6WVB2KWe6AsAzX57Fbx0A8x3IJJA0bHHGC/jVrGFW
	eaTSYPPGrHdfw1hI1yPEAn5BVObrbv1o9ijoFSCf7cm/XuzNwM504pUnIbruUUNyzDRehpk3BjC
	TRsDpYEVabjnikium18og+LY=
X-Received: by 2002:a17:902:d4c3:b0:2ef:e20f:3eeb with SMTP id d9443c01a7336-2f09ca84710mr142455805ad.20.1795770981749;
        Fri, 27 Nov 2026 01:16:21 -0800 (PST)
Received: from [169.254.212.233] (ec2-16-179-105-217.ap-southeast-2.compute.amazonaws.com. [16.179.105.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10c9casm117276575ad.52.2026.11.27.01.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:16:21 -0800 (PST)
Message-ID: <624bf99e815ca1a98d13ef06684c86148166fe9b.1795769101.git.n0ps1edzz@gmail.com>
In-Reply-To: <cover.1795769101.git.n0ps1edzz@gmail.com>
References: <cover.1795769101.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 14:39:57 +0800
Subject: [PATCH net 2/2] xfrm: fix use-after-free in xfrm_lookup_with_ifid()
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    Kuniyuki Iwashima <kuniyu@amazon.com>,
    Steffen Klassert <steffen.klassert@secunet.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Willem de Bruijn <willemb@google.com>,
    Hangbin Liu <liuhangbin@gmail.com>,
    ipsec@lists.linux.dev,
    linux-kernel@vger.kernel.org
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list

dst_dev_put() can replace a dst's device with the blackhole device and
drop the reference to the original device.  The device can then be freed
after the unregistering netdevice's todo work runs.

xfrm_lookup_with_ifid() reads dst_orig->dev directly in its no-policy
path.  It can therefore dereference the original device after that device
has been freed.  KASAN reported this race three times while a reproducer
repeatedly deleted and recreated a dummy interface and exercised the XFRM
no-policy path.

Read the device through dst_dev_rcu() in an RCU read-side critical section.
This requires netdev_run_todo() to wait for RCU readers after flushing
routes; that fix is a prerequisite of this patch.

This access was also identified during review of an earlier XFRM device
lifetime fix and left for a follow-up.

OpenAI Codex was used to analyze the supplied KASAN traces and reproducer
and to draft this patch and changelog.

Reported-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/netdev/20260908224901.1591334-1-kuba@kernel.org/
Fixes: 2d151d39073a ("xfrm: Add possibility to set the default to block if we have no policy")
Cc: stable@vger.kernel.org
Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
---
 net/xfrm/xfrm_policy.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index cea6842e6..eafd090e3 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -3186,8 +3186,10 @@ struct dst_entry *xfrm_lookup_with_ifid(struct net *net,
 	struct xfrm_policy *pols[XFRM_POLICY_TYPE_MAX];
 	struct xfrm_dst *xdst;
 	struct dst_entry *dst, *route;
+	struct net_device *dev;
 	u16 family = dst_orig->ops->family;
 	u8 dir = XFRM_POLICY_OUT;
+	bool is_loopback;
 	int i, err, num_pols, num_xfrms = 0, drop_pols = 0;
 
 	dst = NULL;
@@ -3312,7 +3314,12 @@ struct dst_entry *xfrm_lookup_with_ifid(struct net *net,
 	return dst;
 
 nopol:
-	if ((!dst_orig->dev || !(dst_orig->dev->flags & IFF_LOOPBACK)) &&
+	rcu_read_lock();
+	dev = dst_dev_rcu(dst_orig);
+	is_loopback = dev && (dev->flags & IFF_LOOPBACK);
+	rcu_read_unlock();
+
+	if (!is_loopback &&
 	    READ_ONCE(net->xfrm.policy_default[dir]) == XFRM_USERPOLICY_BLOCK) {
 		err = -EPERM;
 		goto error;
-- 
2.56.0

