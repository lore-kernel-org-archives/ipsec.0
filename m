Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408179;
	b=Ba64LADOI6E60pWDth78O3OtlEXBKjUDNohLDvpKNDG/3mjK36Ix12oxbBpOFP4hb2wh
	 wxbgYGydlTjM1E7tgvEUCtvP4ZW6TgvDhROAbxrcAa/Vw4CFo37ensAqn4g1VXjuQW8cS
	 Svy4WYUWXZ9JtMM0R86SGMoYy2ujUCwg7+bcPpdf4LAF3uBLptYswun5ZTQFUT7g6Qfd3
	 popIgVhRCWh/A9pyu6avBpdI/EOCSFQ+mUtaxRwQenHudVU/9Y2tTMmsW7VW42U03dkAR
	 RbGT9Uskkycb+E+WvwND81TuvRdT0/9PyGH/uwl4eK9z5p2PlMaTi/YNmZ+uYNmPLGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7zM+IiNKEoJGgxM3+Bk+Imyhf6P6VaD/X4/H1O5YPuw=;
	b=AS9LRW6yLH7CV2hBliMK+WMkM4peiiiEr+zpxZelf90FmoBsWNi278jAOedWladui2iE
	 qCp5FaW4i2TMbQTVisCtOA/yma9IYDZ/p/neDxGlw2TiAKz/1lSM1lnejKMFbCVwpVLQt
	 w3ewfmxge8r0KvtP0gwpMMOgIlIbvC99jWsTjFC/lBeIbqb7ViPXhTBD/Bta/MkZ6drSy
	 5pdfZHqGBzZzzSC47W1za3h+bZ+8GTC4exnBJ5rPfh41/1IcE4JqS0xfq2YI1P8UzVJyO
	 So0AnY1zPubYJYTB1c2/jr0CR4OPnhLSoQrXV9XcNGr3+f8IfnrOymgkXL3ilmGcnkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="temYE9/g";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D724B606A334
	for <ipsec@lists.linux.dev>; Mon, 23 Nov 2026 04:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D724B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=temYE9/g
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2647503c88.1
        for <ipsec@lists.linux.dev>; Sun, 22 Nov 2026 20:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408178; x=1796012978; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7zM+IiNKEoJGgxM3+Bk+Imyhf6P6VaD/X4/H1O5YPuw=;
        b=temYE9/gj70/NffNeWcE9ZMV5O0YpZQRtndxpK78750zJBTiGYNcwF6zK8w+zhxaYY
         PEPK9R7mm88rEdIvuviXkBtj+6b+Jqy0/GWMAPrqaPje6q8sNZjStrO18FvrhKPRU8DT
         W8MEdPIYCqarFPO5Q6hUR7DBbduYTEkCN3zRGXzOQVMNTK4PuysfhhTMkl3fYWygzh4T
         5YZ+udxDzuM+RB1ObvQtwdGvgaEHgYYUWtP52QKxrqzkImgLHOE5Coq1O3BTRtYcpQFa
         xzHQ1CrQqvtH0qmTVFmOaw0k1HjsMzj4y6bZlBdFdZmvtJ/Q9iLWBdYXLQSwJRn2dQSA
         ukiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408178; x=1796012978;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zM+IiNKEoJGgxM3+Bk+Imyhf6P6VaD/X4/H1O5YPuw=;
        b=QmuslO1woD2NGccsDxa/bnWci5x/fcbnDNDXgEfcqKLINA0wvVZGY3I85ShpZTWqxs
         /ix9CEUwv72eFSEjIG+7DEya+0wcQhVM10VQDokLo3o5SeML5Wenu1UjeN6/1271DUCD
         sb+FPzbSs+bwfXxXWxyKhYKoSqT6480rWLNOQJ+PxWJkWdkNzz7M3XF6J0dzLMcWq8wG
         828qLGIyRJeqHQaJBnyaK9NrAW6Nw/dU49YwJno7dHB1AuEEZ/rRkPh0285ZENNTD2Oy
         DYtp/tgs/HK9mKm1Xeiu7fQF8x0Mjhy9Ioy44iY0ubc92DOrfJkdz5lomN4hCwN7gyxF
         CmhQ==
X-Forwarded-Encrypted: i=1; AL+hErGmLrjfivDKGts8qTr8dW5rOcDskcq/vbZ43/cjIzgjagb4ONhjtim4KoO/0jMV1t3sxNzmeA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/CYWCu5b8fDJ1G1lfD9ENQqhtbbm7O2KfvNodxpkU9EXPhQf65
	SuzJs/uJ5Rrp3H0pYFO/AgUSNjov/eoiKJvRG+vwU1eCF9D9jWzXv5Uz
X-Gm-Gg: AZFdTZd066q3c+QothLrRpOcXwaufT2dyMigelz6kmYdB/+l16JKTk3poKD/McWiHZ2
	YaOJWBAc8hMrhvzOKPktN8DI6ZgNhSB3xRfcujnpiT2VagsWvDWealeCuPxFswurED2dbncoGQ0
	ktw5fS1vgpuIRDng0nvk4sGkzQMvsr+P5cfFb828STmaF5mQ1cFnq5vuN5vJFVLNv8j7X1M8dyo
	HL2euVf/6uN3uAtmxGIF6NgkhqKAs3MH3Y3NU8Sp/9USZ0i5Hqi/zuZHT7EukVlVxpvw5dZn0yk
	vTsuDO0rMYDQ+j51TiGNUVl1sgn0Sx4QKor8qnUW/GDZf4bBEL5Q8/hQmXZqO+eDOLeW1RtBqe4
	pRlCMgyKNXScvrwS8EyNXV/OtWo/o6y5NSdDuxRIP5590HxSFvP8cx5hehhrNYLHm/yHYzQ0iCO
	RZgWTbDkyyAkfKsDFZX4OQp/yZ+lXCz1ZaXWiMeHjW4tZOKtsJ+AJKOiUoKqfR3YkkYmlN55WKR
	22D4Qu/dnAbco4s9DrPXI86nFFrhzwQSKLqF34ZorEjWuvoVy90r9L81OWWT4f2rUnBuDw=
X-Received: by 2002:a05:7022:62b:b0:14d:3c0c:79e9 with SMTP id a92af1059eb24-1b55686d67fmr14706089c88.11.1795408178021;
        Sun, 22 Nov 2026 20:29:38 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm17703865c88.11.2026.11.22.20.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:29:37 -0800 (PST)
Date: Sun, 22 Nov 2026 20:29:37 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Eric Dumazet <edumazet@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, ipsec@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [BUG] xfrm: a socket policy cloned for a TCP child leaks when
 cloning the second policy fails
In-Reply-To: <179540513898.3135.13913410077710347458@kernel.org>
References: <179505710269.3511679.8893709762919027206@gmail.com>
 <179540513898.3135.13913410077710347458@kernel.org>
Message-ID: <179540803327.3139702.4403349042486439775@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Mon, 23 Nov 2026 03:38:58 +0000, netdev-bot+sashiko@kernel.org wrote:
> xfrm_sk_clone_policy() already sets the child slots to NULL before cloning.
> Would checking "if (np)" on the child pointer avoid both cases?

Yes. v2 checks np, the new socket's own slot, and is sent inline as a
proper patch. The report was also wrong that a partial clone leaves the
parent's sk_policy[1] in the child; that slot is NULL.

Kyuwon Cho

pw-bot: cr
