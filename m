Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795790480;
	b=tx9UTkwrpOB+IlY96VNEttL36XEkcMu9Ja+iq7XBAx0xlIYtz4DMi/cvKDSUqUSgBOzd
	 ydtFYWjBh2DbHZhbXXcxSVEVWY8kz0Q7T8rUqckT9JEdJwhrcF+4uZ1dPa3o/62WV4wGM
	 LMS8vZtXSjrfgEQ5q9yFDlEL+FxF5QzZOXqquNaKCsg024Czcy2Cw2NjR4/WeMim3NLUW
	 KKttvaTRctYP6l2IJt55PoEn69ByJ3Hai0/Q7igXGQVAA1Q7HabswTerwibrEVlLCzJys
	 wYvvxvKKvec2u1kad0/b+C2lw5ROWmwHFE6dKN8OFfXv5cOxaecE+WnLGxzDguwXVFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1xAA2Goyp0+/R7QCDqIjCUY9e99g0trvUh4YZU4vu90=;
	b=YIvAB6c4NgEmbqVwSHFzWKs06DOLA/k2lgaSeE0xa2yRlenJPZgxK4nU8zjx2xt8UBDJ
	 FWP/9KtP/QDJ8nPAel15om/N7rd/T415RenuNot5KklNgXvV1bQX+NhgENW5w/XJiVNKj
	 7CNNalpQj/kDP0ljOzYdjozB4/8pRhwbH5SSCWqe4KDpy6MvSaiH6oHsliRMp8n4rqq8h
	 GUm9GDud/g/J+8vkU6u4y70FrpuXxh15TdiUWONHlQUeUGeZbzEdOBY7v1L0GYUNvxxIp
	 sOSyIWGjNY9yY+kOLNJ8tTZftfzj2nQMFrQmh1yfcDNDb0hru9xu481PqVyrDGtXpkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=R8ITLjFA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2AC606A33F
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 14:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E2AC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=R8ITLjFA
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5126505cb3so1069318166b.0
        for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 06:41:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795790478; cv=none;
        d=google.com; s=arc-20260327;
        b=CSRNnixF4nJgNFBBQP6MePUyB1DrQIb1Y5KNgB2t02VN9fry0Y7N35+xIOu7pdCTbr
         VfBXYECt1xSAlxFKX2bIHxXJvWtMKncC+S8QkUv6YYUbxOtsuSQk4zh1KF5dnaOXeIuq
         n6R9oHmsOS8Sil+zcbSUyUxiTkB1iPOPLh4hk3R2zSkaC7/02vDfM9AMdBaqVilzbQyh
         vvJWW0U0JGuX7AusLOrVULtVFsDNkLkokUMxDoU2yl4DGkY/pezx09AZhIMP44GPV/+v
         mfKaswsbFPqg9Tu/0ysMRZCud3x2D1uaKgqNORIVic+h0Fdw8sXopkwZf0EZXob8ozds
         0c4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1xAA2Goyp0+/R7QCDqIjCUY9e99g0trvUh4YZU4vu90=;
        fh=hRms3h8Hqpq/J4xR2q2SaLccOeYvrKH3Mk3pidMHuCc=;
        b=IAype8voXlSTMUNEcdHDRnBYbQMphG2B8XybIdCST2IvzoikzHj6mWWKvql3MC9gr/
         gicKjb4TI/jz77qJ3BdoQKbXr+VCDLLO/FhWuXQ0eDgRMXv+DXe789hOPMn/m7dejCih
         rizT2y5iJhY2sdOElnYt98NC22060ts7rl1dBtSMfJThpFXBF5wi7SYI5OkKWwNMpOoI
         U1abAW6LXvMH2HjBZRrEILIKwzOsVVwTDW6oA2wTEKFtLoivsRd1Rc2MrstMnInNpTGM
         I1Mp5cytfq7VUr+4Myfdrk4gWZjUfJpvxsuTIL+r6tzZetGxZl+f1wOw14uMamEl11/F
         UwRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795790478; x=1796395278; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xAA2Goyp0+/R7QCDqIjCUY9e99g0trvUh4YZU4vu90=;
        b=R8ITLjFAqod84OML7uBEdozlXVDZQhLcotX3CRKl1Zok964PRt/Lmabv4ytR1yHtQ3
         IaxJFYS/gAQ53ALvEnGmD5ALnBQi4NQ5djz4/RB4MAaY5H/Ps8WI/jiGp2fLejGvNNWf
         6CBU1Orxtl8UWaMxfd1i+qJ9CSRZfMqFA59k51FeWjVQ51lGJs3I9OsvPskCbFYlCnd4
         AIi2VMi8D0+h+ucWkil9AG7eHz3T7N4hPSGj4CAMK9gW779RHz+sQ7mykzKryoijoqRQ
         9SzDwopX8YR0rrp8h9Apccc+ErV9H1sCp8lVUlYwAQILj4K7twQneLlbB0TW+gZyX+wW
         SBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790478; x=1796395278;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1xAA2Goyp0+/R7QCDqIjCUY9e99g0trvUh4YZU4vu90=;
        b=P8dnzqMuKhfXyyxw3e1V432Mr7gfcggCwKTVsfz1mi2byIcw326k7iJ6XjdM2BLy1d
         3EYjYqOZnHJiM4nkevECXP+LSh/e5tpI8Qhg/xh1V8vVdfVTPm2emVHFNKewhpKn6zrR
         yX+KFk0dH2D49gCflbrdYDegGYID0/KJ1TzFCdrHso9OIjxncYtXbhgkehWci72P2z6N
         PvLbwZ3L2eIZWBYDus60dpEYqIYdcF62Miwy0SzDb18uYxONMV/j80192nGepWJQpx5U
         pX4gV8/juuOlslFc+75wtnZzTpWSwXmVASarj88hPEkrl4IGtucZAyKmYbqdBC0CDmIf
         9iRg==
X-Forwarded-Encrypted: i=1; AL+hErEeNJmJX4jj8EeH8BuCW3FAZsGJJHlu2jEQ1UbhVVjFM/UNk2jdr5x7cFcGItIjIaPJJtdbqQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9l7xhXUzEJwd1SUv7yOJ55eynz9Vflv7AJKUMANFMJi1EPNYlh
	XZ8ZSq1QS29UWdB5I1kR3eMho/vwPqksaeJWsB03vcj8Y6ZcdRL4FMJIKEkJc7pbKDUXs2oRd2o
	HGv1ffQh7WKZskpigVcY/10S6DmVa6QBLJ0WGo25p6A==
X-Gm-Gg: AZFdTZc9KleLxp33BvZ4hExEBjjkqMC93JzBNyWZ8ueWd3swOz8aQxSsghggLLCCZH4
	/JwQlKdzCMwWooQnG/eKrFe6OMWuCztILTBqhFTq4p9ZCGWTng4Zg9dewxj5A7mGmcDEIoy6HqE
	HhCJByvy8iG4c8wBQmBYO6s7VYkdiCH/D15AKRhPIhcaqPjiw66RLBgv5D6mLXH3aK22DGQToB6
	vHeOwyeIpfsWUW7U5HL0Y1JleH5hfolYxzBO7zKLUgIa6C4OgxkC8ov/ECDGAAlJBMvtMFbQoR8
	l4CePq5VoO7tLrQXcOrmewtMRiiD33AY6gIq7bOrvRZpseQPWIpwfz9+QIRoiOvWP36iWOZT0Zn
	Pb77zlZZUZ30Dvomgn1yy5xqRauNxAv/Jcss=
X-Received: by 2002:a17:907:1b0b:b0:c51:e06a:4744 with SMTP id
 a640c23a62f3a-c51e06a478emr187991766b.7.1795790478468; Fri, 27 Nov 2026
 06:41:18 -0800 (PST)
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123104236.4179425-1-rmustafin@cloudlinux.com> <179551712630.3135.52212996809224784@kernel.org>
In-Reply-To: <179551712630.3135.52212996809224784@kernel.org>
From: Rustam Mustafin <rmustafin@cloudlinux.com>
Date: Fri, 27 Nov 2026 21:41:07 +0700
X-Gm-Features: Aa3M54ridbYcbm90XHp9x2LSe6zmQntTNNJ5b4vHfgqbclmUtnKlfUB5zVS6gIA
Message-ID: <CAG6=z5vW4aPe9f5S_8m73oKvEkxSZySc7tJJo_hbK7F-bL3ZJA@mail.gmail.com>
Subject: Re: [PATCH ipsec v2] xfrm: use the frame's own socket in the too big checks
To: netdev-bot+sashiko@kernel.org
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, netdev@vger.kernel.org, ipsec@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 5:45 PM <netdev-bot+sashiko@kernel.org> wrote:
> Does iptfs_is_too_big() in net/xfrm/xfrm_iptfs.c still have the same
> mismatch?

IP-TFS has its own output path, which this patch does not reach. It is
fixed in a separate patch:
https://lore.kernel.org/all/20261127142550.66326-1-rmustafin@cloudlinux.com/

> This isn't a bug introduced by this patch, but this branch leads into
> xfrm6_local_error(), which looks like it can leak kernel heap memory:

It is pre-existing and this patch does not change that path, so I have
left it for a separate fix.

Br,
Rustam
