Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647566;
	b=2CnutuCKhOsvCH64ByggfY62lG6fbxErJTux8k/liv5fi5ak/4dlrVmQGDr8V1z0R0pe
	 f/gvSBuUOCRDs1/hbEQxqM5IzzflZbz/t9RUmPwZifGLoi/HP5ID55JYlcz5N+AvGbBG4
	 hhw82C3teOiuIcRQW0Xw/u22cnIHe5jr2GOdAiSvJXv3jefwlWv3OftSJwHcFKvx8zTra
	 jE0JuGSJBCvHhbaSuNXEeqdSogiJPAu4yg9Bto5kZgVkDFIiX2RHYTToCe9trXoz3MZ5L
	 rzs5w+J5oPnp7gD9WqmSNH5s3kQJt5xA6W+7/jDSiVvNFUm7PfffusXKG3z63dLmUyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QTbQToynBqwf3n1SZSg1pf/eN+ziaT5I0ox1EckFMS8=;
	b=arw1KLZJCN48iW0M/Gb18LcSpi23WxOiJ35y1JmfUM32ovZisy6bfvMa89ZhvNbpleXx
	 GF/Z7Rt0NOTAXKl77EVeM2rbhfnz0rz/uzsIIYzIQiC3DQR/c2N/1ikq+ufZBTG4DOh8R
	 TXO57sa3qkZv3Aqn8bi1tfxHq+XBLeyIL9rZUq0n0qIJqGBg+BfxbJnoY5ExGPlKyg8Ga
	 6Zn0PAaUcNrhrtEeLjehNTtBBzIoMJcQ339jsExXLMTeDOdbz94GLGuoEC2eJYKfM/Vuq
	 oVskNJCnZR/gWzdfQXZYMTQfUq0632b3YbbDMZ1zOrioK8FczFNq5DfNVVGnH6ZBn/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vN5uXXa7;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FFE60A3807
	for <ipsec@lists.linux.dev>; Sat, 14 Nov 2026 09:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0FFE60A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vN5uXXa7
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2e96b8bfb43so5240075ad.0
        for <ipsec@lists.linux.dev>; Sat, 14 Nov 2026 01:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794647565; x=1795252365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QTbQToynBqwf3n1SZSg1pf/eN+ziaT5I0ox1EckFMS8=;
        b=vN5uXXa7jGo/E9fnDZUmx5HOdPQ+DacJhcClRuf0qZcoGxMOIAgek0m+NJaxl6a3YP
         r0SaRIWytNVAuZXMPZ7hjezZkd7IhyruqkCMe1WQ4D0dPEHvG8nWyVrwgRU4UPVIC4ZT
         Z6l0oSq8Y6cjdOH5/bFWAonbzlUlEZliCpCVtpAfATmnl4DQiT08LNcq87nONXZPnW0d
         Mdj6UgNrKmNJcLfb25do+VhB8gbgp0It+IOFsnCH13a6zrKrGoxNQLIpU1IG9//mKFJE
         0RE9haU1+8qDX4cKYR+HwgZQRfNiJN0OCWVdBZY5BO+vQjo+ats9PhkdMakXtBfDPQDE
         GvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794647565; x=1795252365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QTbQToynBqwf3n1SZSg1pf/eN+ziaT5I0ox1EckFMS8=;
        b=y8LLc3uul3fosT73R0uWdWKSVN2gDhEh990bj6H2++vsCHMG5hYUjppR7Uq4zIRAFU
         jDfT/iUmwBRXNUvt57TTiKfvTLvelD631VzbiMm0Yi6fECX05kecbjZUq+Cvz9H9s9PF
         pyaXfcWP4X9I3N21OG4g8a1eHZLjyRVq25nmiLglH8/GMfZmxlq9D1EDlwzGzDoAamz+
         p9oqIY1IGO+FlFKa+REP514ZML+/fHDPveP3H93T6pz0vJGmQIdNVj59+6FS7/iNNvlB
         t44p1eGSlTxldicwtRc3F9oBvV1DwwaBX+iKhvMnm4p+JTDzu/tPW1IiT0U1ET/04wkP
         Mlrg==
X-Forwarded-Encrypted: i=1; AL+hErEdNS2iRut+yzdwdxN8mJE3Sa5gN92Ue0O0VVBseILt1Eu8hgWkX/f69OVCmHO1bFVnIGui0A==@lists.linux.dev
X-Gm-Message-State: APuU4Z9owAl8rn4SZ1Rnb8TxjYhoW7wP1FZeUUgmIQjXt0Salo4Y1asE
	vk3NSY+ny79yCVXELslEe9JpM9XaobKMkIP4faqV03Vul3NsTFlKZFMI
X-Gm-Gg: AYBFou1b+wiKk64Qtqmy4EZ1T/5k+l6pDriexRmDREGBBBWvqJqBXzuL03DxZQkitgO
	8xDdKMMBL/ddZukC0Q3tDCkRBt3JTmNEWrmwnx8A2EVmNJTn7wORrglL0ZF1zs3/JRKDY01L9Vi
	QrITx3Ya1oizAUwckhfD0B6sQcjK91o3lUG9MIlnGvoTi3bZLgC0sKkRhUc0EPFhEk8RSpnMjo7
	9dLM1Y9Pl6nE5rGxDZglHuwhK8E1WTFGvMhaT7oQxiX8bihsjLuH9Y6mUqD+XQzgWxbiAUtVtdi
	Id39/okHPRISajwBwPrRSDOjHkn9O3FL6qbI05gBJo9S+4OafUw+WGQL78xvD9OBzH1VvK1Payd
	06ofUM5IWRtJbBvF0asulTdy9SKwaslRApDm0/UDjl5u0lZmhhfQl6WJbb2PB3n9xL3na4rROFd
	hC34wbEPZT2g6uVw8PPf3nbnmZlJxtIvbYzpRREhDI3weZZqOp3Wkbe1g5roDICkYN9n22zywoM
	zrNHdh9qGer37TLG50ixtDTkqUHHqPdW9c2VUI5VDpbWS/NXxMsZQBuX07/RTRQh0FDD4QiJ0RU
	LfyhPnIlP6ADje7orHrlh1EkVIKj85Qjws09rlsGkSG3hcfU8xuf
X-Received: by 2002:a17:90a:c88b:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b1b0b6049emr4722150a91.43.1794647565057;
        Sat, 14 Nov 2026 01:12:45 -0800 (PST)
Received: from kernel-lab.tail5e91bb.ts.net ([2409:8950:57d:63:2b6e:fd48:7485:9720])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm8311897a91.4.2026.11.14.01.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:12:44 -0800 (PST)
From: Yingjie Wang <flashhhhha@gmail.com>
To: steffen.klassert@secunet.com
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH ipsec] xfrm: avoid wrapping AEVENT timer thresholds
Date: Sat, 14 Nov 2026 17:12:39 +0800
Message-ID: <20261114091239.780633-1-flashhhhha@gmail.com>
X-Mailer: git-send-email 2.43.0
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

net->xfrm.sysctl_aevent_etime is stored in 100ms units, but the
conversion in xfrm_state_construct() multiplies it by HZ while it is
still a u32. Large values can wrap before the division by
XFRM_AE_ETH_M, disabling the replay timer or turning a long threshold
into a short delay.

Do the conversion in u64 and clamp the resulting jiffies value to the
range representable by replay_maxage and safe for jiffies comparisons.
Use div_u64() so 32-bit builds do not require compiler runtime helpers
for the u64 division. Use widened arithmetic when reporting
XFRMA_ETIMER_THRESH as well, so large stored values do not wrap during
readback.

On x86-64 with HZ=1000, setting xfrm_aevent_etime to 536870912 made
XFRMA_ETIMER_THRESH read back as 0 on the base kernel and 42949672 with
this fix. A normal value of 8 read back as 8 on both kernels.

Fixes: d51d081d6504 ("[IPSEC]: Sync series - user")
Cc: stable@vger.kernel.org
Signed-off-by: Yingjie Wang <flashhhhha@gmail.com>
---
 net/xfrm/xfrm_user.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index a5fbe38839c4..4a676a6aa53e 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -924,6 +924,14 @@ static void xfrm_smark_init(struct nlattr **attrs, struct xfrm_mark *m)
 	}
 }
 
+static u32 xfrm_aevent_etime_to_jiffies(u32 etime)
+{
+	u64 maxage = min_t(u64, U32_MAX, MAX_JIFFY_OFFSET);
+	u64 j = div_u64((u64)etime * HZ, XFRM_AE_ETH_M);
+
+	return min_t(u64, j, maxage);
+}
+
 static struct xfrm_state *xfrm_state_construct(struct net *net,
 					       struct xfrm_usersa_info *p,
 					       struct nlattr **attrs,
@@ -1022,7 +1030,8 @@ static struct xfrm_state *xfrm_state_construct(struct net *net,
 	x->km.seq = p->seq;
 	x->replay_maxdiff = net->xfrm.sysctl_aevent_rseqth;
 	/* sysctl_xfrm_aevent_etime is in 100ms units */
-	x->replay_maxage = (net->xfrm.sysctl_aevent_etime*HZ)/XFRM_AE_ETH_M;
+	x->replay_maxage =
+		xfrm_aevent_etime_to_jiffies(net->xfrm.sysctl_aevent_etime);
 
 	if ((err = xfrm_init_replay(x, extack)))
 		goto error;
@@ -2782,8 +2791,10 @@ static int build_aevent(struct sk_buff *skb, struct xfrm_state *x, const struct
 			goto out_cancel;
 	}
 	if (id->flags & XFRM_AE_ETHR) {
+		u64 etime = div_u64((u64)x->replay_maxage * XFRM_AE_ETH_M, HZ);
+
 		err = nla_put_u32(skb, XFRMA_ETIMER_THRESH,
-				  x->replay_maxage * 10 / HZ);
+				  min_t(u64, etime, U32_MAX));
 		if (err)
 			goto out_cancel;
 	}
-- 
2.43.0

