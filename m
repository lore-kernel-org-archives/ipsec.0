Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844364;
	b=ml5hTrINhndd+vwjV5kDQyIOls9tsp7ANTZwcKL7yKCrtF9gAPE6xBqYxtnAXTJ8cq48
	 BuJDxqSvNC1VCsnjoZNzKBYnv6DCLSYumhbj6e/WqLrFq7lFpN1CKMhX5JgTLa3Q+F5ja
	 hqWzl+ikLuY0KuhOrli0PQbN3CnB49eHUKo224jwn+AB57M0sHRKOCD0fks14IphFjQNn
	 Uh9fyjf/Xm51CpcD8ld+zFTj6U2iBvguNIxWMuTQHm5kXfflgqPofHvyarSca01U5w50L
	 yN1jBLaOr5/hPwnuQgyts/zYbpQPzEQXKBvftNXpv+vFYAsKOQuy3IQ11X/9UowHMPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g+kb+ZzrGTUhbJttxW0qtASDjHC3TIeprrt72BSFN94=;
	b=X4rga6ya4pPVN7K3+vqY4JJt8OLTMmGZAIgGp5M+p2d/6w1aDXVBFhYtg1nIZxGhoRmN
	 M+xnrNflVebuzLMF5uH+edmJLt0Pv7WmbxJPmeDLcX1ShnXEVVG5HqqGXoYXjkc5JSWpL
	 0ILrhRAPVbdBKBZfuVYmrjEssNqyYOz/FIyW0hlv7aCujMq0yTyX3s+q5l1u2rv1ixL7N
	 yGT3iWxXjXprUBQfrZSxGDefIAlI6I9k7fJUbIW9hk4SfAnNMEbSsSMREbXYQq6uCr9bG
	 E5QtIkr1tf/F+Nc52xTuaRziewmPoApCs7qcEZDrZWeQjTIA05s2bHvuUjHHECrfobw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=dy7iXSZW;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DDB606A336
	for <ipsec@lists.linux.dev>; Mon, 16 Nov 2026 15:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8DDB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=dy7iXSZW
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ede7cb02daso32766935ad.1
        for <ipsec@lists.linux.dev>; Mon, 16 Nov 2026 07:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1794844363; x=1795449163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+kb+ZzrGTUhbJttxW0qtASDjHC3TIeprrt72BSFN94=;
        b=dy7iXSZW0IhfLU0DqF+dPR1QvYAbpJR31kcZNYHkTsVubkv+3h2++eB6x+PxZK9TTU
         0aE7hxauxn/b0a59W8p+KHK9oAODZP6Mi79o+qzpLYemHfVD8okMu1PAEjBrmtw/a0MA
         poWw8+7hx/RdeSdq3reNTKKAv3h27E+xhMaXjO/zKxBIy8e4AoDm2M6frf7B7LqR7e9V
         VHA6eH0CZHBQHtmEkNFw+YRR14ZDh1nq32hCuoc98gS9WLU8Dut4e+VtxX4ofNjpRR7T
         bT0p4rQv5ArS75GgRqtvTuleGccLzgEeHiyn4AC5MYiJ7+MotWfFeqN4xdoCSMexTvxf
         C9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844363; x=1795449163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+kb+ZzrGTUhbJttxW0qtASDjHC3TIeprrt72BSFN94=;
        b=T5AqCDOn/nEm8+fKCw4lRz5W5OWBx0B0MvxrwQpmKAOsIXcFdXYph1xT5k6hzotjMB
         LfPSBGkGKLlpes/J5vYHSESKDkY8ykilyeYYFJCSiGXbJYpxVezt0pbZZlaNWaFQwiMg
         4gW5fLV1EQV4PLpIF9NTkGgaKXlG436ErF++2IsLRULWbK5iesMi5qW+R1j3i0cL8FQ7
         HNEWMTd5ptFCep+EVH2hqrqj0RlqJp3IJ0NM5l5AD4MAVpJWHODRl8T2HWJgoA4Hh63D
         lpYYv0gXZdy6sODLSBdQXjIL8c3B2AydroVA2fSM/ereo/zTCGG1cfvzl8HHUZds8JhJ
         MbBA==
X-Forwarded-Encrypted: i=1; AL+hErFcVjQxyBi1+o4eS0YUuHdtnFCkCXXWFaHZUz3N5mcf5fddZ7IZrmAfX8uSFEdhmuVVdWTwLw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9ADAfw5zg80tRzIcRkajk193ZCPMaQ6REwBHpFUNZmt9kw36pA
	aFhW5aBapOFav3KEQwczc9hU4gXQU6fHBjJ94U+0xg7gFVfuLBVCSTttybbJ+lmINki0
X-Gm-Gg: AZFdTZcP6ajxtGNq0yMsamC2Y+Pntq1GcXR50MhjxvRRxvuPb+yTVFy/yRF5ns/q8ZS
	iLbIuOcqn4YleYkjxDsmaQbrGx4Jl00yhngeuL5xhj/4ZpGM+owgZrHHVfDKCaTYf7AmsL97qdI
	5bloZiVHmta5ykB036dKUM/4QmBa7GV0ExBUwn7k8LSSd/aU61+Vjk2U0x0M0rrlW/Bq4V/RE03
	zBPFthddjbY+yeMslH1HJNjpecZuUstIGKqgOKLUhOXg2EcXhXhJm8KOKmiTtKX6nMMiB1y4Ku+
	7USNl+k+Zm1MSQtB3E71QyDoM1ESXYTw6jnmv/qaPZoYMw03B8fjL96gkVzLo2Q+K4U+0l/V/sa
	BTQoZTmUzvAT0+7WirF/CD5hsZ1h265lUfgys4JIvHFY2a73TkYl/M8BqVjWj80rNiyie4MN7/3
	gLPtBNfc71HOI9kVYlXMSEnxdKUQ2tXFIeW14xih5UdWlGahzgnq3bNuVkAkhO83b/OX0TxM544
	jHRF9jCQaqo5RZWk6gJOlUTKD5DRjaqV2Gljako7hXZfyIWwKqpV1YwOq/eUOYBydlLPZscJo9V
	D6PHNPMYF9+nQsAiIWhAkmKps3iSOViSgQ9Deo/Fun4gji+JoDTlqKfwMXmSeHURBaYnC1VLUzX
	v0D9PaoejLZ9kQYvDrIUG
X-Received: by 2002:a17:903:3b87:b0:2e6:1c24:d5f2 with SMTP id d9443c01a7336-2edf21c1da4mr95518365ad.36.1794844363031;
        Mon, 16 Nov 2026 07:52:43 -0800 (PST)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a36504sm1330985ad.30.2026.11.16.07.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:52:42 -0800 (PST)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org,
	ipsec@lists.linux.dev
Cc: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sd@queasysnail.net,
	vega@nebusec.ai,
	zihanx@nebusec.ai
Subject: [PATCH net 1/1] xfrm: espintcp: select receive path by skb protocol
Date: Mon, 16 Nov 2026 15:52:29 +0000
Message-ID: <20261116155229.318582-2-zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116155229.318582-1-zihanx@nebusec.ai>
References: <20261116155229.318582-1-zihanx@nebusec.ai>
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

An IPv6 socket can accept an IPv4 connection through a v4-mapped
address. Such a socket still receives IPv4 skbs, but espintcp selected
the XFRM receive path from the socket family.

Use the skb protocol when selecting the receive path so IPv4 packets are
not passed to the IPv6 XFRM parser.

Fixes: 26333c37fc28 ("xfrm: add IPv6 support for espintcp")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 net/xfrm/espintcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/xfrm/espintcp.c b/net/xfrm/espintcp.c
index 4052ae5bbb2e..ec37a32ecb00 100644
--- a/net/xfrm/espintcp.c
+++ b/net/xfrm/espintcp.c
@@ -48,7 +48,7 @@ static void handle_esp(struct sk_buff *skb, struct sock *sk)
 	}
 	local_bh_disable();
 #if IS_ENABLED(CONFIG_IPV6)
-	if (sk->sk_family == AF_INET6)
+	if (skb->protocol == htons(ETH_P_IPV6))
 		xfrm6_rcv_encap(skb, IPPROTO_ESP, 0, TCP_ENCAP_ESPINTCP);
 	else
 #endif
-- 
2.43.0

