Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574230;
	b=cX6B5ECR+ghoUn2GlhUuXGFfslunii1W0vcOXha5uDy+7LauV+nfgRC/NqiCrunHw8Er
	 4w+/DhzQJvXxd5f534ZNZMuvbNap8q08+XnottrAKhpiz6X5VI3HLs1rvmtRp+Bz5lTUd
	 lskb792oZ4rDP0xzrDpBfw/0ludG6NbpgzfqFW0qo+E2hxODw8W95L7mCm1czoQ3aMKTd
	 QZOMLx+xK88bNZoE53losGCWGowUMzGIOrPCD4OWhq25ZrBK4cnCahosFRqf0cW9w49kB
	 nAdIc8muEjUfibhfQu4ouCKkJnQiutYHFdCfbyb7QyZ7peO0otg/x3iu/wqrxym19Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F3FjnUi2pwPR5DHsF2bq9Hbvyd0STLH+1ds5EmTt9Js=;
	b=QSnjKDldf95f34NDULLpgp12Cm1NCDumNg0yx7+V8y2Jxql8OIMl7dud6RhwxYyjQufw
	 QWff5qfjXjR6Uuv8goB5P/SSsgItoYhzExPPi3Y8bDxAjjtDc9I6kD1BvG9saAbxqEldk
	 IqPeP1OxLyPkakZIDVlcdFJTn61g8RhgrMfZ5dmOh7v2m9QSy0i0ez2/mm6oNCg9tDHiz
	 Lk7Ua3f1JmtAI+ONID45CNL2rcLKwgwwjjT9ftayGAhGOFzGOOqI7UueUoKAGAh0kyvZu
	 rYo4JOLAQ74MyzQOV5rElx3kcc9X/jmbaHAmDg74KOt8UBue/XJ5ZzBGYwRorZTKm1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xs8Q5wj1;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A619A606A323
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 02:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A619A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xs8Q5wj1
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb628232d2so2859238a12.0
        for <ipsec@lists.linux.dev>; Tue, 24 Nov 2026 18:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574229; x=1796179029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3FjnUi2pwPR5DHsF2bq9Hbvyd0STLH+1ds5EmTt9Js=;
        b=Xs8Q5wj18yh7cgySv6HZB33gK9eKe1byPXqC8qtoGC7k59oj30AQ/KBgnMt6W8286t
         a7frtEDPMuuzfqH9ZBC/pixcaRm6Uz41tPH/5TsOIHyx/9oleLQbb+7SHsQ/eM16+ZxF
         YzoSQc4wcc1Nq0ZJsLpTXUWQz8+XDqErPISF/+cZmDxr1XksgCYrgVddd+AjrdgFqWOF
         ESdLJ/ePDUgFWsyZ7NM+dpjcMFE1Mt1SBs7hUlv7PC+Pt5mIr5q9zsQp27DN+L97lsUr
         MTcwVc8zWskNppW8QFOW/mql3jdRZGsMZedfYvVa5d5NiJEIgxaIRtwtO/1tP9mHDWTy
         azXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574229; x=1796179029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3FjnUi2pwPR5DHsF2bq9Hbvyd0STLH+1ds5EmTt9Js=;
        b=qAFzhBhI32WkcJ5fiQKszGlfcDbhapDHVD720Cw/Oz/FMSDCzXDKnWE0F3LoboNImP
         xaukSMN9hLkpHfl4s1Kc4IVANqHDsPh92WUERkP9cYJmkxvZ3jRusQVil+3edpACW4Tt
         ZCRLTLPlsqL9NN1rQRIaui8G/iqV8cQMUa5Ws40g56721eCHtM2j6p3ivCamVHOfZ6YI
         hMzaQ6trf0y8mFUzSyDyR1p+8eF+Qjgk89O6Xtt5G34VzXGfApKZy4/lixn7Cut6+b2E
         AIEQc6mkYHSwrf7c8JQq9TzREUx+AJuWqx294Za1Eu2PGJhH2zc+QdQGzcydOdJ3JJjJ
         Qakg==
X-Forwarded-Encrypted: i=1; AL+hErGkdPxOTmu5xaGtLrSCpbqx0nPSIuXkRk56mOmvK++Zt6oZBZwTns/zD4KD/mMtPz3dsFTbVw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+7njTZAH4IZAhW7isBVBJwiYKU1QB/HFcVSRbtXVysf0wnh2rZ
	XwlR5ScyzBG9reaa9BmOOVNfzV55WrTDiwVCIWvxZb/6+PZMvJGsoUtx1LhLlGlY
X-Gm-Gg: AZFdTZeECgKbogxI4R53qInZW/+GUrLXPWIQJ3RFm+KEWLpzEVB8d+WaSv+65oqCbT3
	qF5u7AY8KBRzjF0Pc2NB6+u+D0COOFEhvyfxPQsX2tqHiSwP6DDsltOoZnXYAKfvYI+AZIbbPd2
	55EJLSrA6eQYpsoEdKKtcYPsAUKRfIl4svQ8oQJCsv5ZveYCKsVd76iPrZtw0m5o0WZkmzewR3Z
	9IrJ1MlyBCDX2ocOM0J/drgNyabnjSOvrEYbcQ+gqzZXbxnFQWsO9zPtQ7U+OQDJu4gDQlHNn/b
	x1chHceYJ7EB4569dVAsMCHdPRUJOuFmSrq5TY2YIRwB9LksVaJx8INGiHbrVrjni7Q7Nh88crb
	jP8JEuAPHaCnW+6i+WqUJFy3/cYnzQz1utrExWbFhFTTnKUIbz5yC40rdLDDrKh0WbSe1rl5E3F
	Sg8RtgeM+SewvBeR4QRK1zOy2CBNzfypQ7HNT9xlcz3VZHBV8vI6OvaWxuE87Vl3RatxTHabzfd
	WDt/PHWlF9kzKkdwh5JfN03H1bOA9RI2w+MyiUD2EaVeIO6/CTAsgq4kg4bqwEnGiPSSW8iE8ly
	8H42cbi2SwyQpRcjE1nV0W5euz949S2/CaK188IyKeb9LfZare3ScBVXUa2n4UyGSp8=
X-Received: by 2002:a17:90b:52:b0:3b4:f457:9e5d with SMTP id 98e67ed59e1d1-3b4f457a24amr1003392a91.9.1795574229078;
        Tue, 24 Nov 2026 18:37:09 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm24946594a91.4.2026.11.24.18.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:37:08 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Florian Westphal <fw@strlen.de>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Hui Peng <benquike@gmail.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v2 0/2] xfrm: refuse route optimization mode for ESP
Date: Wed, 25 Nov 2026 11:37:01 +0900
Message-ID: <cover.1795573672.git.kyuwoncho18@gmail.com>
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

From: ChoKyuWon <kyuwoncho18@gmail.com>

An ESP state in route optimization mode can be created, and its first
packet hits the WARN_ON_ONCE()s in xfrm_state_mtu() and
xfrm_inner_mode_input(). Patch 1 accepts the mode in
verify_newsa_info() only for DSTOPTS and ROUTING, as in v1. Patch 2,
as Sabrina suggested, also makes ah_init_state(), esp_init_state() and
esp6_init_state() refuse the modes they do not support, like
ah6_init_state() already does.

To Sabrina's questions: XFRM_MODE_IN_TRIGGER is already refused by
verify_newsa_info() ("Unsupported mode"). AH or ESP over IPv4 cannot
get route optimization mode at all: xfrm4_mode_map has no entry for it,
so __xfrm_init_state() fails with -EPROTONOSUPPORT before
ah_init_state() runs. So only ESP over IPv6 reaches these WARNs, and
the IPv4 part of patch 2 is for consistency.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype.

v2:
- Patch 1: say that esp6_init_state() accepts any mode instead of
  "treats" an unknown mode as transport (Sabrina).
- Patch 2 is new (Sabrina, Steffen).
v1: https://lore.kernel.org/netdev/179550330841.535592.4607028415857424638@gmail.com/

The patches were written with LLM assistance; we reviewed and tested
them on the ipsec tree. ESP over IPv6 in route optimization mode is
refused with -EINVAL with patch 1, with patch 2 alone, and with both,
and the reproducer no longer warns. ESP and AH in transport, tunnel and
BEET mode over IPv4 and IPv6, and DSTOPTS and ROUTING states in route
optimization mode, are still accepted.

Kyuwon Cho (2):
  xfrm: allow route optimization mode only for DSTOPTS and ROUTING
    states
  xfrm: refuse modes that AH and ESP do not support

 net/ipv4/ah4.c       | 11 ++++++++++-
 net/ipv4/esp4.c      | 18 +++++++++++++++---
 net/ipv6/esp6.c      |  6 +++++-
 net/xfrm/xfrm_user.c |  9 ++++++++-
 4 files changed, 38 insertions(+), 6 deletions(-)

-- 
2.43.0

