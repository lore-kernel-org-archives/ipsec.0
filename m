Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795262283;
	b=oFApP/afXNgvJLRrz5g/wg+rtKcZQKzWuftmQrTuupKLPuKBfFfA/M+/2Y5THmCsmWlx
	 L0CJCv/EwTgfQe82CoPyN7fdO6J/xsuh7YWYCtduHjtkxe1ird5GW8396u/kZ7wWVVX7K
	 NpgAMngbQea6kYMyhIgSC4A8hc7jMGqFoX1Aq+Tspwr3VcvU861ODdIVEmjmuJ07q7lvb
	 fpC/JwxWYyMNaUS06KAHglfyitIOcElMTd5wmIv5Stz9U98MuU4Dtz7sCNydBEL4cXuEt
	 R/UlKPO9IaMshrGmdOJpP6jlsM2QBtl3q9LVhaiym/WcY8LLlLQGI3SYICutjygl0tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6oeoFimhtJH2hxh44JdtBw3TK3noQY8/rbKIHHAErn4=;
	b=ls/JvxLNabM1XJVrfPpQoSzR5aznzusadgtdc0ZMCYGzHmls4oNHgpac7iq5F7xlwzai
	 hA+MZvZiFQQXT6B/+hzykdDjRFAg+1FjVKFfre4i2p44XAvFihnk9JEdUNGn9bjjvDnnD
	 Jx0XNcf954OGvi50kom30PVtQKkcNSokcAy2azCjAmFPAv8EHTbQGgJ8FDYTjxpjS8SXZ
	 Dv/s6HV6Djiwktk7/E1BS10hDdlgMqmAYgN68J4WQNZXu9WmL4fQcH+88UYxYvJEUpHa5
	 uVdEsqGL+jgorYXTIYwLn7pr2D9Iv+YQzGzcg5Wszkb6mGqHVmr8Q5RNaSIsPBWdxOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=sKJgt63P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF4D606A320
	for <ipsec@lists.linux.dev>; Sat, 21 Nov 2026 11:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF4D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=sKJgt63P
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so899617b3a.2
        for <ipsec@lists.linux.dev>; Sat, 21 Nov 2026 03:58:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795262282; cv=none;
        d=google.com; s=arc-20260327;
        b=IC49Chqc+oIWmAe0RaULy39dwTPMnpUUl2HWDINtmzS36qAZRKOIAde6F8ny4xhYTn
         07yl9HpOWE9kEf2Ju1XLgHlBdtZcv+tIRQ7xE6Z5JDE/S7vb/UMZF9my8+sYhAxirN9f
         i/muATW3B6SRL48J2czrC0Kzio052Uq5RMqJeNpPdQHDPbry0a2P23q7pMnih0aPqC1J
         YYsFPGY4aUXoqUFn+fymnWEjMuzDtiHt66IPuYzb6RNvjdnOkA31pTLyT8vVXDucE0rz
         1WvnMSRNq6xEhIfBM2Vin34qIGulc7LIyz+Cs54F7cWUWfsL/fEkA6KFqqEl950RBLmF
         zvHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6oeoFimhtJH2hxh44JdtBw3TK3noQY8/rbKIHHAErn4=;
        fh=gfTtd7Uoevn4JxBCtfORkSfEZHHuI3ROdqekuc47cOg=;
        b=llh+sL81XDYg3wgW875utPVYa2jXgvfO3eV8a34BS4hSddJg5LEM9G8zI7NwwXFIFM
         mLB7R2A/7+UZ2M/becp1/sbXFs4Wmj3Jrpro291MLmvd5McvPdq7JHvE/DnVrLUnicQR
         Bi2rLnB+vjT9DE1QxtMqDXEwCwymJCJSmbnOPyQV6y0Fz28xHRR5F8dEmpGgd9022vmQ
         DxD4D7NRXgyAizgc4vJhidvK4p4sTHFR9G5GBfh2s7rZhLu85/JrRgHNJ0EMa3pQXtaU
         /cO8GbWIRB1zS3OMA5oH7r8P8eAaTDwT33K4KsZwMAofEhm22TfjzeUodc6Z7bxZioq2
         /ymA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795262282; x=1795867082; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6oeoFimhtJH2hxh44JdtBw3TK3noQY8/rbKIHHAErn4=;
        b=sKJgt63P2Z93gJEnXhUck40OUioE7SIwTWykSEBbT5JJrw9jx5x6+jA/qLPs1Totn0
         xvrmcpBvrmXp6Sx/JrbvosddgLz9/C/xKIbHmnj/u85134CNSbQM+hWK1Mr7N4CP5P/5
         6e/Tjv8TT5nBPyUCDCUHmgrFa7p5lkPpFovWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795262282; x=1795867082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6oeoFimhtJH2hxh44JdtBw3TK3noQY8/rbKIHHAErn4=;
        b=oRqBwkh2hLtIlbE2Lk25Gb3kZlncnOa6hLaVKOfR7UT0bP7f3S5GMYK49o2odGgTbi
         bwNK0PgsdXFVzOL1dr4IRv96GcdIbcnwYAF95znVRhmXKbrNfCVbTOoHg8vHBx8226WU
         nEv6dqbzIQYwiIoCA2VCPyLgo/GXRk75XeQEPVnON9Y4mVRiKCxGIXP9LDNKY166XhOs
         4yVrZLyx8SjK4TjHptprbD32w8FktmAPqD8Lvmh99FVfsqL07UgwDtGzVecJJFaQSLAL
         az9dkWA4yu6O/mDww5TLM6I4ivKKQEz9kDA530slAJxzlS81CvdafIec+1RYrGfNBv+e
         4m/A==
X-Forwarded-Encrypted: i=1; AL+hErHCuXz5jHHdNQDtV1NekAiBA2zwmDldEZ0q0WIIJTYM0bKRRmZC5IixC2t2E+2JTpkeI0gYYw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+tqsQM7IBAyCkUfXV2kqvKNQKg8jJNYG5BpkzaQecfnhDnc9mF
	x+7+pkrrDBS7YJ8BD2fhKKKTeLvRhmJ6e9WFmzrkUmCatU5cNejd1aydCWakbpGSWOXcjFpX8pc
	a7wjci14Xvj+0MBmFROk97YLlap8HLn5+xt0qHVqs
X-Gm-Gg: AZFdTZftPDdUtFLKxRPbHaHd5QaJzILYMebGxEGPa7Ir98sAEAGu5VQfDDgREwgghNr
	TcOfgG1PvOfb8prJBWBHASMHPgBhKB+Q0ytnCSmUU2/SWmIkrUuF6/7x1xaxs/41yVViIER5wFF
	48LMESsgEzt+EvDmYp243VpwSp0BEWqcracYZedhU8MjqQHzYHZTyJkrHiShgsn2WKybQXVq8oU
	q3zRQlOR29sseCwnfAiqb8UsEtlDj0mL/VFA9CzxwJNUw7ASV39TF9+c6d6j4gw3hcdxxIXFRPR
	FQVbreVoYz5/WhV6Vh1FpfjM3uOb36q2+MOiDM5pA3n4UC7RIVOVUWVjum7SXf/+l0yhv21nCWz
	54js4EbiPq85+MicFrkGhz4q2zhVwvKgz5GApEXf+He2cSDvCoJ7gdH06Fc389Wa9uOkx/wwQSI
	A5EwzUKVOweieBx0yXhdmf
X-Received: by 2002:a05:6a00:928c:b0:8a0:20e0:b131 with SMTP id
 d2e1a72fcca58-8c87bac50eamr5921526b3a.19.1795262282219; Sat, 21 Nov 2026
 03:58:02 -0800 (PST)
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CORE-5IQX.v1.r0.20261120050801-1@mojatatu.com> <DN09YRKU82D1.1QHV2CIFW2C6H@gmail.com>
In-Reply-To: <DN09YRKU82D1.1QHV2CIFW2C6H@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sat, 21 Nov 2026 06:57:50 -0500
X-Gm-Features: Aa3M54qnMKfTBVbIV7vSbL5S723ov1v1Vl5x3Mva5Jl0ckcThjBjDhbh4ZxcYw0
Message-ID: <CAM0EoM=Panth86S2_RcG6Pt8WA-nyR=1P7GDM0sPsPrOrwjyeQ@mail.gmail.com>
Subject: Re: [PATCH net] net: xfrm: interface: restore dst_orig on every xfrm interface
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: netdev@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Eyal Birger <eyal.birger@gmail.com>, ipsec@lists.linux.dev, bpf@vger.kernel.org, 
	stable@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
	Victor Nogueira <victor@mojatatu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:11=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Fri, Nov 20, 2026 at 06:08 AM Jamal Hadi Salim <jhs@mojatatu.com> wrot=
e:
> > with skb_dst_drop() before the route is installed. The helper allocates=
 a
> > metadata dst per skb instead of a per-cpu one, so the route it records
> > belongs to that skb and is released with it; the per-cpu allocation is =
no
> > longer used and goes away.
>
> kmalloc per packet should be ok here. xfrm_bundle_create() allocates a ds=
t
> per packet already.
> It also fixes the route leak, the double put and the if_id mixup
> that Hanxiang reported on Oct 29.
>

I wasnt aware of Hanxiang report - so i went looking. If no issues
found the final merge will catch what you prescribed below. I am going
to track Hanxiang's bpf_skb_set_tunnel_key() note as a
separate/followup net-next item unless somebody else wants it (in
which case i will remove it from my list)

cheers,
jamal
> Reported-by: Hanxiang Xu <xuhx@hust.edu.cn>
> Closes: https://lore.kernel.org/bpf/48129353.1960c.1a1859496bc.Coremail.x=
uhx@hust.edu.cn/
> Acked-by: Alexei Starovoitov <ast@kernel.org>
