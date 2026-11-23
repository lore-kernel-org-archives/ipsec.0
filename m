Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408187;
	b=k4oaO13kwBfeZGVDZA63IHltvpiM5zKS57Ela43HMpW+q/W4Si3/2GBAgmLTXkfGrbY1
	 9apIcX+/NJjtLqYWMbBQvX6pXgFRkHy931qk7B6IUdMz1Cuzmcf6kkOPQK2WwyTes6UY0
	 vmoQgoz7BECZZJGRNNIsmZaUjbi1LtzZjHpkrYQeOSsRua8M9cLGwQQuQ5kjujpSrmZPO
	 B6MzxMYiBNbh8hJyJe5GOKiCgrxIS7dVA6KhXLdyCHF1oaV7J8E2985uF7QnIQjmn26c1
	 isbAcNDg0Y0k3XBNdAEAkDEHvVZmMuDj+bhEwHEnXuTsCc1pGspRhwtHzSZH/jb6ZoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uLMnyfwDcXeZXg//v+DD9Q7sPFzFL3MyagznzzULhMA=;
	b=xcWmgvAI5+xq4dXd10FKac3BgMZFDb6jH+6zpS+0mdzuP+1QeYLPfmDxFPaDugrelY0u
	 lBxJfWJ0YYpZ0ZuR18GfXUN1C1b55BjuVGYjL/TAzHx3Uc7Gak5BD03KApXujHiK41Zl1
	 JjpIaZ8qvSeKyApXXvXIo2snSZfvGhFXSurFT655UEHKbNjiZEhyqBcNOTT7va/qicgxc
	 RaTciHb/hiYVzjJTavsXeT/TjZ4lcDe6oFMIwEMLQaAsKVSQs18fKIfUGTLhrXmq+tNzq
	 6N3tA451aTHthRS34Uk+bhKobBMOX9i5uaJysVqjT33Z6sukxd6GgNYxYMn0u2qaCZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dbORgZk6;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD25606A320
	for <ipsec@lists.linux.dev>; Mon, 23 Nov 2026 04:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD25606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dbORgZk6
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-382f4710a17so4922676eec.0
        for <ipsec@lists.linux.dev>; Sun, 22 Nov 2026 20:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408186; x=1796012986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLMnyfwDcXeZXg//v+DD9Q7sPFzFL3MyagznzzULhMA=;
        b=dbORgZk6D4KFmHP2WOJjZmmmk4n0h14zJJ9Ays7WOuoR3vSJ9Wvb9FgYWPjFFRc5QL
         XmdtwH2O2nfbyWtNG7wMKf2uWvS3T86mIyB9F+GEMd/LZNtKzMOQOZ6r4pTLYeC0FtLW
         r4lYM+1W8OjlMrDE9yChzBfUlvqMTelIU8BO96M5+6L97XACJNi+rX/UCSDl9lCWaQ0k
         rgLpXZ4eIoOhxd3BWa6mFe0mz1KmSV53tXIFfUUpkmuT89BilISoe9JPMIZWnDTlixPk
         SoXwFwnKZV6YZ2ZZwaxeVAdQVA2EExct4HOlMRqEXh35QZca//0oh5t2C57GqfrbGvNM
         G0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408186; x=1796012986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLMnyfwDcXeZXg//v+DD9Q7sPFzFL3MyagznzzULhMA=;
        b=bNApewAgSKEI0sV5kRRmXi1o8C0ipI1AUIlCcEkJwgEI1pJpMGoaPkJ0R/6mEILPIk
         HeqZGzg4Z8A9iYCmxZHdIqtxv2ERLe88m7x/QCMEVXKqjMzyaTdEJsFhOwENO4zKgjTP
         YMjYG/SuqylDT3tfB+lPopKDXWu2hKi/dCSF/xliAbbpH+rZS7pG53u4M003P90CywJo
         ua+n6Me3zjMNptxLk18x9S5AmI4YBoUGm+QIddNNDqQwjMZrcj0hsQoaqV7F9eC/H8TT
         q8bVgPC+PjMyo9A5QQFroj9ITfEQrB76Tu23PkbFqxfBk48R/SP6mWF7cI9OceHv1rzm
         rrYA==
X-Forwarded-Encrypted: i=1; AL+hErH3CWJ+u8bHVQaoDg0u66SEk0IA7iSczkKxsCRVUBpIi78cd8nBUiGk93i4OcARPwWx6uGDcg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9ewAIXaEA5FkN19AShO49vkGXikpE+nis5PVEDR7uDD9AkWP/O
	9Bm+NmJ8eDh9WvG61GXMV1Gj6U8sz7fQzJn0TgPe2fWbM/pUz0veOMtx
X-Gm-Gg: AZFdTZdZs8zrepxpRADYp2XQApyhDgMcowiqfQEdtlesJU1TKv5HTOhKJJp+7QPdr2S
	Qm2iGm0zgZ41NTP6SfFJJB9N9E8vlY644KGmlQVsIYf8pAS/EvyEj/o987v2SJkUElEAQhSxCJ4
	p5FIcUIut9Zb8VtPY5x1CsKHbYl1ECpNHJAC6Z6Ib9TZ5LtJb1+LxflJs3SxzV/+rhz6+fkVxl8
	kxnZp/xzDLea+DqrY7qzngNPcdQe/Uij7vbqDtnV6VV0cH81FI49flPsADxrKejd3woJUvHjzoW
	91Gi+mPnfI9JaoD3Ze+Xe5akSmOwonXh7pSrOqyxHR+2YKAcUpxkRNRhoXhqFwTgDRe4pruYM+P
	SA3N/BMVP4d9wo/MKsSRt6Gz09eCCq5+BQ2Wb3pUjxGjdU/u5GvHUhRFSk0OKyO7x3D7Y3pq8gp
	I1PVPiH4290+xyP2djGnGtdSCWY01aLMbuW1QxpwaYLAP19f8iS+c4IoMsoJIhW8fCHVdjHQGAF
	wNi9LTDM0F7uxsH+pSojJ0S6UQEBip/vbu+OGnEQ8HAXKt9row8QosViQ7v+zxp312E4W7pCIEc
	knGAuwzI+ip+jylOZo+XC8yT3iE+XnfwPvRPL7RRC/FbYoL/i7849DEsfb/OzGCuaNI=
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr12237050eec.22.1795408186322;
        Sun, 22 Nov 2026 20:29:46 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm33562090eec.22.2026.11.22.20.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:29:45 -0800 (PST)
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
Subject: [PATCH ipsec v2 0/1] xfrm: free the policies already cloned when a socket clone fails
Date: Mon, 23 Nov 2026 13:29:41 +0900
Message-ID: <179540803323.3139700.5340002553684152759@gmail.com>
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

When cloning a listener's second socket policy fails in sk_clone(),
the clone of the first one is leaked until its namespace goes away,
where xfrm_policy_fini() warns. The patch deletes the policies cloned
so far before __xfrm_sk_clone_policy() returns the error.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype.

v2:
- Check the new socket's own slot instead of reading the parent's slot
  again, which a concurrent setsockopt() on the listener can change
  (Sashiko review).
- Send the patch inline, with its own changelog.
v1: https://lore.kernel.org/netdev/179505710269.3511679.8893709762919027206@gmail.com/

The patch was written with LLM assistance; we reviewed and tested it.
With it, the reproducer from v1 no longer triggers the warning.

Kyuwon Cho (1):
  xfrm: free the policies already cloned when a socket clone fails

 net/xfrm/xfrm_policy.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.43.0

