Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201921;
	b=OIklay6lF2rQAnn18tsfnTMRYQZ++amrleNbLywSW6U7MYwXBKdXls1qsv3xEurOc9xO
	 CW9tbzzah2VHptbNhhKfBdF6HIX0+L6xENke6kTia+Fsm5cTxRcozKPoPBheyjPpvdfgg
	 /tKAdehesNv+b03yN191HwJp+r1Z3cyJmByXgJZSUWSpxjl0icQNujjdYHBe3Cctk400S
	 /XYtgtMH0CTXnITKx/uOy9wehXKRimASDBZMoQtZksA+D+DfmsobTFB4+wUIVAV7x+LpT
	 Ll4gLCGOovMyLhgdaVZQdeaQP4dUhocLx1d4yXlLbkZYcnEpYD3IRuOBMx2AIB7pNNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=MfI8h61e3YMKVrq2h3izbDkMZ/iPIC2DcSVnmxWaK38=;
	b=tTKzYNK7XDf0piBfKZ9qDdP3drtI0md6Cz9LVxNXC0RdnLaJvFUlupPmr4VQxDepr/tH
	 QdsNkbNc3JebzcRnaMDDS0VNkbUNb4q6bl6kdAts0355nQGF8ddJt98pXIY1aUM7kjSAb
	 eYIoqNAIQ0pFMpICdl8rVo1CvKLQOHXoaiFX86OR9S5NW1g0bvLC1NgluETVuiGRyMcUU
	 eCwnXkTg78UYu3zyg6ajRag9qTr9AySaaxtrXsswcNFBfdcJKfraSukSDSUQJ17w0uLjO
	 aq2PDhzfSEXVREhdSJGFOA3d4Z09n76XAn8yTPrU+QSYyKupTL/UVnf99EtTmHpK21Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsZMAkfH;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ED660A2634
	for <ipsec@lists.linux.dev>; Fri, 20 Nov 2026 19:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50ED660A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsZMAkfH
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so979838a91.0
        for <ipsec@lists.linux.dev>; Fri, 20 Nov 2026 11:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201910; x=1795806710; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MfI8h61e3YMKVrq2h3izbDkMZ/iPIC2DcSVnmxWaK38=;
        b=LsZMAkfHtayrsV9rpsYWaEP4FYIhjB0DBtyZVGrJZ24n9O+Q3OVpCp732E5/iC5TtS
         c2scskhIWah3eFV2Q80QKOf5L7fbCTbAvPy9eEVX6TZJcXE9XnwVXkvi+1AUi4H1gHrf
         +JIvy2A1ee4Q6SmCbvhEeAxKV2Wr4pj5BJVYw5W08fhS5jkiKGLOr4qtHuXQgHFeQp9r
         u3LEmOTUtmDJoxrziqVvNn9LkFNQWMvYqKXFH/3fZVHk7v4/v4sRTqJs5YwLx0VYdg+e
         XBZcPks+VBTbUUgW8ZMn7JMdUJTw5e340kNBG6GK+WeMa0qAg32rrDU3edZC4AZA/yWm
         u69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201910; x=1795806710;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfI8h61e3YMKVrq2h3izbDkMZ/iPIC2DcSVnmxWaK38=;
        b=e6Mkh/TaxaaQ+DMQG+84IbRkuxN5qRYyH3PQNuFfS15BsEa4twq0I1OY7uVQXzdP4j
         HCxbqRXFRhnHj3H/KoJeJMy3mDiVMsHEvlH/AGM/4EjsVnjs5XvWNAK11KyhW40uW7K9
         WktbxbGQOIVl11yW+iF+cKFUs+iO1W58WiFgnqLEFzNF+Qo38oHgmbMxy7IRAaMTZG/K
         ZA6hJ/sb/RUmJJeetTibuoQYPPZ7sziSHG+EDvuA/ulhRP2sOuLzapZSEZRGDcD7WGzq
         VHX3AYhxzqD1GIxllnZwFLqRYYrNVnrFHRnZ3zqYClaYG8D66EL/URGBdzCNhTeul6mj
         sAoA==
X-Forwarded-Encrypted: i=1; AL+hErEc1vd1RLQ0fdkxPbx6KapteJ95vghH3DGpULYyt/O+LVMaqsGz0uaW5XO16qx5qOeJIrccWQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/BcTX20xtTuFULoO6GJoR20Ld/Xy9/RSfraWjYF2A2FI/BYSTy
	Eg2idILK/6Kym2db/EjDcl+SARvcqMK62hu+XZCNGbVOBJRf/EftbjgR
X-Gm-Gg: AZFdTZfJ2PW37CPPArTQfwZR3wsyChGqQ5urD/BixF0q5ghuAUZYTN0vumlI0m44bkr
	TW6m3BFg3vVOe7Yl4vPdz3x198rsLn01NGGqVN9sc1S8OISdRfOCMoxI2a4K0UKrtvcGvzxlbSr
	MgcxCYXbnqwhBGCfO4chiegdjCYITdDwU8QFO+FWKVKUtHSzYxlQHM2RtU2f8YkwwV6nimEmDpE
	6dxDYsZAy2XZl9X9cn+JoetvubsVXyIUdaJ+Bw/wI+QsOwIBnEgvZLH1RGtNRT+P1+AkI6DU+mv
	t4l2gI7H8vd8l3/maUwJB9f3/SYvuHo3/0uCDgbDuQ10EZQyNJV4RE/0ukM8nhFaruoAck1nB6I
	fLk1vrqHi3o0opZ5y8Eyi2v2zzSpSgDUbA/8gqdbkOxYf2BMHUApQGuUqo1wXecpYloUAB6OE2k
	hYeJi0OE1vzS4D6/RoczW0rH+0JnA6CQ9T3M4ga+XZ0lHcWUyGVdArxoNWwqQJumqCKmTvASQGw
	o6ELT+fobotwu18Ie/GFoQHiMEpYuDNqXpBGWyXv0+pTlRoBJ52mComivo3lDZiVka73sTsUgU7
	7smBQQxdJMDZKlQNKqAzQhCpMqjygywok0JaABIRHfdqble9xx406ygs+I60LzoNpXLPEqz4P90
	L9QdS0o8K2FIDNGQa0NntjkRxbDAU27BjkA==
X-Received: by 2002:a17:90b:39a7:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3b41c8d95f0mr3666281a91.22.1795201909486;
        Fri, 20 Nov 2026 11:11:49 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm8522514a91.10.2026.11.20.11.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:11:49 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 19:11:48 +0000
Message-Id: <DN09YRKU82D1.1QHV2CIFW2C6H@gmail.com>
Cc: "Steffen Klassert" <steffen.klassert@secunet.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Willem de Bruijn" <willemb@google.com>,
 "Simon Horman" <horms@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Martin KaFai Lau" <martin.lau@kernel.org>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Eyal Birger" <eyal.birger@gmail.com>,
 <ipsec@lists.linux.dev>, <bpf@vger.kernel.org>, <stable@vger.kernel.org>,
 "Jiri Pirko" <jiri@resnulli.us>, "Victor Nogueira" <victor@mojatatu.com>
Subject: Re: [PATCH net] net: xfrm: interface: restore dst_orig on every
 xfrm interface
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jamal Hadi Salim" <jhs@mojatatu.com>, <netdev@vger.kernel.org>
In-Reply-To: <CORE-5IQX.v1.r0.20261120050801-1@mojatatu.com>
References: <CORE-5IQX.v1.r0.20261120050801-1@mojatatu.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 20, 2026 at 06:08 AM Jamal Hadi Salim <jhs@mojatatu.com> wrote:
> with skb_dst_drop() before the route is installed. The helper allocates a
> metadata dst per skb instead of a per-cpu one, so the route it records
> belongs to that skb and is released with it; the per-cpu allocation is no
> longer used and goes away.

kmalloc per packet should be ok here. xfrm_bundle_create() allocates a dst
per packet already.
It also fixes the route leak, the double put and the if_id mixup
that Hanxiang reported on Oct 29.

Reported-by: Hanxiang Xu <xuhx@hust.edu.cn>
Closes: https://lore.kernel.org/bpf/48129353.1960c.1a1859496bc.Coremail.xuhx@hust.edu.cn/
Acked-by: Alexei Starovoitov <ast@kernel.org>
