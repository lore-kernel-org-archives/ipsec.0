Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636662;
	b=zOh36iXywndWLm0mcJVID4Kd4oCXn1RfxVL23SmSmhX9bvQho9HBi2EegTtaIG6vKYW2
	 N0bRgaJJOF67zQi3kGniOxUd1TQbTSDZE1U1jI5IX8NvMyvV9G5uA4n/6w6oFaufKzwrn
	 PoPmAqINudXM4cj98gXl6QpTYAZ7IS7M9IgEwrSN3AHMUvdfBl1ZzvloZSMUvUTDlindi
	 v7JSiceMwk83Yi2oVrPCV0x+AB2Wg1V8LDEglzN/NNzaWYEpWSFzxs6hpLHPiv28DjoNK
	 D7ozpN/mMK02+92B915R/8vOB84YryQ8mfP6byZo3sE5hJ4wMvSRP1WpVRyOJFiMVLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FnWutwVHAzlegSMVJ4Kfkk7OIUcj8sfxBwSeQGcqrD4=;
	b=vogpoc3vo3Pp19PS2GHfT+cTDTYN/IWMObkfqLpfB3BVX/QhALjBoOjX6EWWKKlfWWbA
	 xdNXvVfBHNC7DxWiBJeTWIRN5EKzytERFyOwoBoUaK25wp/y7IBAfo0qsyPaLg4UowUYH
	 KQPUNbiXPkF96GcXeDEPtMeyuWZKN2+/fTkpe7kuJ+Gl+hk7A+6foxlNAwNZlpW8PfGU6
	 l8b0SfcaE28eujWhuXqSJ+p9qRCQIyyBB/IQMCJpbTNEzxa3iUtj7fglHyqkm2onJp28z
	 Q1/UMCv66e2xxnhqxGNHmYNcId2D8jv6oZ9kxqLzkeIns0M4U51RChGeoKpOGbFZa2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=MUk1tOUU;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52FD606A321
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 19:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D52FD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=MUk1tOUU
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-385c497bf94so3687515eec.1
        for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 11:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795636661; x=1796241461; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FnWutwVHAzlegSMVJ4Kfkk7OIUcj8sfxBwSeQGcqrD4=;
        b=MUk1tOUUqVRdIBRnljkQ6KGAb99NUSAsnWkYWiktyzJR38FI/YcL/W/JvQ2DHnWxmj
         LDBfGMJhGmWjQAQyySLwEHuOcRsDT/7+f6/qvrkmCphZagL+hC+VE7j2Jq8M46thpdsB
         76bWm1gVKeisa5TN9VFe0Pp0Gdk4/C3eRcxOrRlyKGX5pPIayUcHJ8IZjtFhVcCRDgcW
         z1Se6QUJtCD/Umtln5kwYM2Eq4bnH0gHK3kbVLgbdiN1AZcq8roA3XXAC3N0HRE+QI4u
         iu1Q5cETvpG/naPuuLOjrfT9szGsOq4OCn4ZNjnEtXo0IvNlSYQFmhVLU1/J/uEDOzLZ
         Jsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636661; x=1796241461;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FnWutwVHAzlegSMVJ4Kfkk7OIUcj8sfxBwSeQGcqrD4=;
        b=hnCx0ImWvAkTgjY9/B6YFOFE2ndB2W5P2zlPnsIYUG17TvHhRozpGYx1ajUoJ7F91G
         LDzD8qz1YtaHtN/iGaHF/UYOJmvDFm+d9nPMSz5K8V6KAIl/AGj/K66KdqeQ05Fn2NQ5
         3O5D0t8pVgyF5nAZM9V0wrr5ppVrftlXOri8o6KwuZrcmyVL7uRhQKk2dbouL5hZ1dQA
         ev1araUXi7BJARRlkkL0Qiq4nNW8xWH2bc4mBJCWslNPZlvD+7l715eukDnCtX+VfKxl
         YFNk70hyDOqp0vX6GibsrtNzmJyiDUHpRGBesxzXnOQVAcOnIxp1l6YiiSIon+ZN+3WM
         /OsA==
X-Forwarded-Encrypted: i=1; AL+hErGrGNtAkPNUHGWTlek1jmOAwGXoYz0oabhSGDUHKQ7ZnLOgzVBW/5kOpquVXUKBenOuvzY1zg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9srVZ3yeTO/WDzTqR3RZk+reQSoMlGdvIhxau37yTXp7T3pJBN
	avglKCkjuLXNW+YsE0bDaJ5VfLMuC2BF2xX9OAYjA5gONV7ry3Mw1uBJV66xnQp27bY=
X-Gm-Gg: AZFdTZfQrD3N3j++wZ4GDe8cgX4O4Bx+d9dywo5YGfQJtgctpCZaMmZAvBymNEB/epB
	XYtEIywnkQCSoQaNJ+i2OTnK9fv+7ZP0tGTW3fqqV3FV+qsU2I5C3QBtkQEgRxD4y7vZpGM9YQq
	Yr8IBi/F1CT0N0sU9zYBVmEYTi0IT5lYkYBccgRjsc7jQVWlIGJfzmd5KJvI3fFEA0bimwMjU2B
	RncPn/OTYpDJrOsWlKiQW35E/3I+LNE+HpBExH6XFr6SMePIsaFB17UdYqXrycrxQ1SHsVyYGih
	MAZAP3JCRQJG9zq5la/z5H8e4QVxWuT6nH9+SFLfOqiq+xJQ/APkXdo28sp/fv+v0doZeXv7mef
	ZwWvJMMURiTOB4gPimP6Q9qi4pJjwrSg283Td5rcW0gLBK5ds5rksiscEfTc/H3WHUwmssg19L4
	PfleasdJHcgkYF+tROVvglSWnSfB+F4zeLJOwd2BJb1uLPRI5CUZiPab43ub0obhZAKTcxGzNUg
	VtvOMziw1tHfRSLy8w7wkJbuKurFqPWXYMPCdUlRkfT7bf48ihca9iFcDL17D+QVtVUcWgnbyOT
	4n6ndOFh5zOfPoO7338+OXvHxdbzSDNncXqzNXHCZSt3HDd64oKZYq/PSftZVktu2XdDBcgk05j
	H99DNXGroWlwpO4TbwtEaSJBKWYlws7vTHTMp5OO1S1F4hro=
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr17732201eec.39.1795636660967;
        Wed, 25 Nov 2026 11:57:40 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm59596522eec.14.2026.11.25.11.57.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 11:57:40 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: ast@kernel.org,
	cratiu@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	herbert@gondor.apana.org.au,
	horms@kernel.org,
	ipsec@lists.linux.dev,
	jhs@mojatatu.com,
	joe@dama.to,
	kuba@kernel.org,
	mst@redhat.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shawnq1@163.com,
	steffen.klassert@secunet.com,
	willemb@google.com
Subject: [PATCH 6.18.y 0/5] net: validate GSO headers and preserve XFRM inner offsets
Date: Wed, 25 Nov 2026 14:57:30 -0500
Message-ID: <20261125195735.57472-1-artem@trailofbits.com>
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

Please apply these five patches to 6.18.y. Patch 2 fixes CVE-2026-53091;
the others are its prerequisite and the upstream fixes that followed it.

1/5 be1b70ab21cb initialises shinfo->gso_segs for SKB_GSO_DODGY
    packets. Patches 2 and 4 build on it. It applies unchanged.
2/5 7fb4c1967011 pulls GSO headers into the linear area before
    transmit accounting uses them and drops malformed packets. It
    needed adaptation; see its backport note.
3/5 fa90a3145c03 stops xfrm from overwriting inner header offsets set
    by a tunnel. Without it, patch 2 drops VXLAN-over-IPsec GSO traffic.
    It applies unchanged.
4/5 c6648c9f3b51 bounds the segment count and accounted length of
    untrusted GSO packets. Only its context differs from upstream.
5/5 35d2d6e5ac0d rejects a negative TCP header offset in the code
    added by patch 2. It applies unchanged.

Patch 2 is in 6.6.160, 6.12.114 and 7.0.10, and in mainline since 7.1.
It does not cherry-pick onto 6.18.y (checked on 6.18.57 and 6.18.65)
because 6.18.y predates the qdisc_pkt_len_segs_init() rename and its
pkt_segs accounting. Patch 5 is also in 6.6.163 and 6.12.118. All five
changes are in 7.3.6.

Compiled net/core/dev.o, net/core/skbuff.o and net/xfrm/xfrm_output.o
with CONFIG_WERROR=y on 6.18.65 with the whole series applied, from a
cumulative x86_64 tree, with and without the current queue-6.18
patches. The intermediate patches were not built separately. No kernel
boot or runtime test was performed.

An LLM was used to prepare these backports and to check applicability
and stable-queue history; I reviewed the result.

Thanks,
Artem Dinaburg
