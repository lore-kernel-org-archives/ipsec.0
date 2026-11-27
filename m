Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795793204;
	b=rbbH6dFQ1o6ppB3l2TJLrKmXb1PqCWQS1h5km2TsrpyLTILrrYqfc/kkJpFYX0RKVblF
	 fug7j1E+sGVxvPlhyCh/6SpFty5tJtDjZe9VK4Vb+sMoqd3Tl7TpG/cLC+4X4xwr6Ufuo
	 0WSeebZsg8F/2pIBs8E0RVixCCUCOaQPswpv/Gcz3Yj8FOy/tEZ8Kqb4VoMhLPN9MTi3c
	 yTDYTOx/OlAK2L4BxESu6rv8J9es/rgxdhxJVgThhv2N0ploejtSlNSyEZ6f5yRRx2WFv
	 4rbUhXeUKy0Oeuf8oUdwWowezC3Gpd2KxnkUpggIvgrwGfTwzQJjzZwykj0dayioqQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
	b=WRjkAq9lm2WwRtJ+oMwDQPzMvHaH8NIUPne1+qus3FTIUJfAufJAQXpAexKqmUesgyfV
	 1Tf7BmMxminf+s2CXPJREZ/Y08iZzu+Ff8xxPc3B372Ix4NKAtXLRp7YB9x6/oO6g17Tu
	 OPFE+yUMtZ8PCbDHnSW7c0srD5B4jql0TCGH46+eCG0JQbaxrgF0h5FXCS3SumaP2H9MP
	 nYA5T4TxL0fny+5clNM1kiEvPQmeu2QAXMkkj5UV+zixYKHDt9MO/xlO920DPQf1bQ80f
	 /tLJ1nx1vNC+ouuGzz92kuKcwsa1XTjo+oIWg1TPyPktOojvQzu1rQ48LlYKl0glZRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bcASCVKm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5E1606A321
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 15:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E5E1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bcASCVKm
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4ea3c5afaso55731067b3.1
        for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 07:26:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795793203; cv=none;
        d=google.com; s=arc-20260327;
        b=F/4HIobNAK5/cKMPNMSVLyfRMOsXwzQN9ws40m2bZabyabBWhkq3F/iN0tnnDNIcNt
         ZZCdS+WEzeVaK453IGGSnihIaAqpRkSb2oah/ak/KyIXA5Gl0+MYGSnoqZovM7Cjae46
         prHMswYW0UVA9jCN78UWoJAkubzM/2GT/cagDycoN9i3MZJX5PsrD/6YSs5uKwi3NABj
         JElWA0qveiSfPtcDO+xXp+F6zh2/2qaDn5GjQ6sLRMoC685xcM8AEm0JggsgIVzRV9jg
         BB17Zc1uSnLXvRC8BJ0C0itK1c2tIokHhaaqbIBOCuMvugwLv7MQY4WNX/sP5wh+7weg
         ikfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        fh=pLAh4KQoYVs8RnKVLVuszobJFWhJo/MGAvLANmoV8jU=;
        b=dJH/KouAuDkQQY/IFGZFvXZROQlCybNmi9Q36YiaMBE5+9/uh9JdZqfI92Zbsqav3X
         B6gI9zbzPzahFtjMYBsNqeSjNRDmmjbcEO71H/xDnx9MRLiiOoN2HNaPqXwXIbMBMU1l
         4dFQ+YSNfm77dYBQD/Gk/1iv8wTVV/yk3FMDg5orWsyetgkvP49u3J6RgU7mdCiLqp/k
         qb/P/aJWq0N1Osdz5vZnLyzVKcorotFtsGynlZjmzgDqXoagt7Ge9m+DU31WLZrYoM+I
         sosvNhKN7uWlhiz4GMWuuMnOyt8njI/ZrHOv9Rd80937nV4GGUT9HLwh3CPSswK7l2rd
         lFDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795793203; x=1796398003; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        b=bcASCVKmhWQ3IutYF7wi9zfgbgfxuPG8NiuSkVpInRzPWL0eqjwIHfbS3S9BIIpoym
         VfEzb8NxwFWvp0goznZKuNv1KAcqZ+Y5TPu7wsAjbDm1PdyCXEFVPb/tQYz8kx8bO9bU
         +sn0SSt3nUyWBEd2Mw2BoWgcX2v7Ttp8qw8MStqWgd6H0p1kmLIDMoxE1CBAPxTm30bN
         hZVgUnJTHU570rnTM8JBnBdbbQmlABqsnjAGXVnYhw/pFtTDLk9y3uE71JDmOEVYxJ21
         t5tdkUA5LEy+iKR8t9jOY1DU7l9mePMMOJLRo3lfO9hTmEHuEUyOes/KTi4JO+kfGMq4
         n5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793203; x=1796398003;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        b=O5GzR6434pny1QC/FDVkQ9H50D9iLjEpfWNWDkBn7wI38OjNFaKVokJ9SBZp14o1zi
         SI5gRYfs2+3TQLm9n8t11V0GtX1ukLtSNVK9UBpxZZdTCO7JvYo4btUcQAiqrS22Szox
         n9ZvH5fIsWSKLtuI9s4NGIpDE/Y6NjwV5x4uXEeCmOkTEdwqK75kjQzaGPDC8RW6Dm18
         XSlaIm+yhg8dpJFoI0dKBGfTuUjAgEeyxwYEY9vuaJvMDSklbuIucmOHWe8YzYxvIuzu
         Jxg4lDv2UUE8MJ/OdF/9vZyz6nSvgsZ2MzYgbODFbBce5KgLZZSGjvulT3ne2BAZDrqY
         rmwA==
X-Forwarded-Encrypted: i=1; AL+hErFO+hYwJvqlCcfdmNUwk978cbaZPd39Yjy1Yi2HXKqc7iueC2a7sZITL0kC47GmN2P5T9PkxQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/srywpWvd1mCdoTC1q4d8ISFB2nt+GLba7xwCQ2V655wud/Ksu
	66H3vzQT58OrprZkri6MliqzXu5QkErSXNL7DlD8mwkRoE+uPcXhiCKY41Ztp5TGD1uTXI++8WH
	vQ/iv7liVxlx3Oz4uc3IN+1POGCCEVCfMG4sS068+
X-Gm-Gg: AZFdTZcDI9nxI6C7VGfBqkULRkrz3h37zD/cv9lMfErxmy8tRsKdY1Kr5e89Tf+2N+B
	foYNJaomXYaMxyb6+61ARqGjwrhR8L8//ty6Pk1bd9sayeThCShkT3Xsrj88XNt8fZn69O51qvK
	pIyaoGNNCmmjkBvTR5Qx29SGK/L6ufwNOlVq0xqjP/B5YVFwSBQqATk3jj5SdhrcJ1anfxAWYFE
	SvyBi+Jpbg3uenQA+wN61l7lXQ1Hr7e+quo/pud5ts5AjOrkzzmDS7nIduXhXiSaEXQRbydg8VI
	QyUwANB0tIBjX5x1qfhAcJhFxGBqPhsVYovvuG+VdEaFKHaMbBCgnWzBshuVvjV8kahaxEzZfeh
	brFAYRaxEdIHstZ5yd0SK28ff4sypI1+5gLpvN/InGRbAm8N9ionj53vEF+0XaZ3e99oZyHOvRq
	4elOUlZn50oJYSHUzalzKp6nSOji4zbU7tozL9AhSx/AXkXpoASxP2dTeeYdX0GGJOXo37OQ5VG
	ar7S7iK269KYliVlM0Ux0UJHbhb7K2Q3Qt2anm/vks+bRn09rH+AmRqPQXEFg+5JoVwRfOaAU5r
	th+QjEZMuk4zhsOwnUvXJ663VbeVNW5FP/2KMnZf2A+1sm9CwF1yoFj2Gf89p/533MmpvLSCOUk
	Op+PVnAFTOs6YLxl8G/eIf3k9IlKi8/Y6
X-Received: by 2002:a05:690c:698e:b0:8b3:45b:a4f3 with SMTP id
 00721157ae682-8b5204ed736mr106681927b3.83.1795793203488; Fri, 27 Nov 2026
 07:26:43 -0800 (PST)
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1795284858.git.julius@bairaktaris.de> <7c74b2076dc7dee1d481d39a135e0946d5e04145.1795284858.git.julius@bairaktaris.de>
 <34e77fff-c57b-4ed0-9035-b9682ad3914e@redhat.com>
In-Reply-To: <34e77fff-c57b-4ed0-9035-b9682ad3914e@redhat.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Fri, 27 Nov 2026 15:26:08 +0000
X-Gm-Features: Aa3M54pxMqgZ_s-9JbfNek_3dyGz87LXsEraMMuneoiDkKTrHn3sKg0m5hARvDM
Message-ID: <CAC1t37L_+P72w+gNcrdphB7xkBmCQp5PQRFpcu1zqM1m-2Am+A@mail.gmail.com>
Subject: Re: [PATCH net v3 1/2] net: keep the TCP fixed-ID flags on the header
 they describe
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, willemb@google.com, horms@kernel.org, andrew+netdev@lunn.ch, 
	dsahern@kernel.org, idosch@nvidia.com, ncardwell@google.com, 
	kuniyu@google.com, steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	richardbgobert@gmail.com, ecree.xilinx@gmail.com, andy.moreton@amd.com, 
	alex.austin@amd.com, linux-net-drivers@amd.com, saeedm@nvidia.com, 
	tariqt@nvidia.com, mbloch@nvidia.com, leon@kernel.org, 
	linux-rdma@vger.kernel.org, alexei.starovoitov@gmail.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, sdf@fomichev.me, izaiahsun@gmail.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	shuah@kernel.org, bpf@vger.kernel.org, ipsec@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ack.

Thanks for looking into this!

Julius
