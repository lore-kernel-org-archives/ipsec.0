Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795212912;
	b=4UtLiFJr+6XmFVPyhG9gkXWP2L2lEPKkd30hRDhGhKiz3tIEsdtmXm5cCDrdOGK7mVn0
	 UW2kuid2J1CjshDZks7G6akyUaDHUYguZBYP4TrRV66xAxK/oUm8VGbNmjYHkxGaw531b
	 WqW73NaJ3GH0WlOo7CrxH/GFNnA1051buzDcwGkv0xjehHPBQMR/NO+l1kH29Smf+UybL
	 Pozw61b4HF2rQtO+IwcDe74vuqIUxWHGfXfKpfR3hOLX+cpanImld8ZA6rLyVMEDLwPiq
	 eU9yYlN9K1KWZiUjucp3GeykgI1xaWTrJ4CMiT62HIb+GSp46ImDcYiutWIaUDPWzHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S8E5/bKsqcml1NiDKuxtkXF2hepTan04xWFr5FhLnOc=;
	b=weM1pfIKdquV1o9HD7wZlqnoawYhg582LkxyZ/0U8xY/YBy583dq8BZ7ike8rmFpJwLx
	 rzZhxzGuxbfPCF1GuDvhJTvzO1zi3sce4d832JergDa5Lq62HSU5gJQes/fMIMSwMWeiW
	 XJhK18IL2mh6yJS7lTEk8dE+QUsX+biBbFiKAHzY8Bqjk9iBycVvtx+5tSREmQQLWpllc
	 oeqE2XPefwP9al/Kf+PCDpAn4oQjT1u6mpkspUSjkeFjxuRQsM25uhmuPzdFU95isO3tQ
	 Fg2U0dkrRb1Wwx3hTLZGUPs3WW3mfU3Wpey/mCZQfXEeWL8QaHShOmN+FCd/h61nZXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WCecxrlv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD98760A2600
	for <ipsec@lists.linux.dev>; Fri, 20 Nov 2026 22:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD98760A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WCecxrlv
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6df5e315bd1so1209906eaf.2
        for <ipsec@lists.linux.dev>; Fri, 20 Nov 2026 14:15:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795212902; cv=none;
        d=google.com; s=arc-20260327;
        b=sM+axnE3WDg5OLAl76oX+9T00qSfLBbBphGo0lKY1UeLl3zXDqD+D+yu8abZKT7fF1
         Y8RQCMxFscCi0GhsGVj7HMj1mjDibJB9XBhsnyZk5+bRoVo/4b5/acX5ICuYaVAJZtF9
         5dxtAm2eqPQbByOvyyOOK/8/GUJpUYJ2yzokbIAarcDajTuJLwDtixOFy/blovU7F65i
         SCL7RrMNXM9YiKIHgqsH++qsRqsL4yPLIWZUMR665gKw/SY52KJ8qfQjhDDakaqVszVi
         oz/lc+s3V7BsP1DTB+rICplTjTvfb7dpsJVhkaEwaaNSp4KL6zqo7CzegwOqBux+vhpP
         AhYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S8E5/bKsqcml1NiDKuxtkXF2hepTan04xWFr5FhLnOc=;
        fh=FDSrI+YfyDfJLQE+JHMp9GBv7sN5f48oEoPdEnZ+2fU=;
        b=bclLNAmOzsJdWKgYIs2IYlIlkvjObsDyNcQALRXFB5Igcsrt1vDpowfpL2xPsho2iC
         yHonmB641Yp0uvXx5Qrv0OL8LvtgZsFMnRNS3KNr/bYB81BVVE2IT3Bgw5wxhU5IkTMR
         xB/2VgFSt5FwdYTCgyf6gyT6ozuK46GCk5e/KcrRzXwaZccYYmmQC+UoBj6K0i6ObuYe
         mvMcuZfuGXFhY6V3xZoIkhVvepINtN5lE4uAW46WELi7NmjDGMQM5+05jZiAWg3pLrCU
         XQd1mj7ClNugw6JyafF4oox98igNKHoJ8FsKeEtHiqijTuBdHuAAPa/fk12NVa9AT0tf
         1hVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795212902; x=1795817702; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S8E5/bKsqcml1NiDKuxtkXF2hepTan04xWFr5FhLnOc=;
        b=WCecxrlvYMakQyAwUH2yEcjDKQT37Xkbyq3x7bdJETd4JJtu0hy+omILBC0Ax8meiB
         vWZ4GEflLINbnJ5FJcn8aWd7rbubj36PfR0XVlx/YcvVJTgiVykuZNvXOXv0G9h5mbeI
         3M3GJ7GrJpM5cqfqz/XdKlrSDh75hLg3zPWxQJ9LVLZPRruyvPaoEjuxlf0XuOf8tJ07
         JTifckH1J6cZJi4T6pv21Vot1zwVJOB0L/S9vNuCbhBK+Zr5iUhUIsVYIJA+P9Arhq8x
         OkZB+9NT0BH7O5CG3Zw7YS27oPKA9n7UGSG2YhDwGFBSfvfu4FUPdz6TXnUeenmwaAMj
         S8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212902; x=1795817702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8E5/bKsqcml1NiDKuxtkXF2hepTan04xWFr5FhLnOc=;
        b=q9QbulUDUvElzEPIe6dLMbHc2Fc0rll0mci0U98KiDqBBmAcMQRMhVh4VXZy53t7+K
         5YnFihj52oqJbg7BHB7hKEbBXt/n38m9xEA2CXU/fFc4m5WU65juYo/piz3wWmYjw9CG
         KO/ob9VhiiikZnQzLtozM3ImW1AtgupbUFLvM5vXjQ+16dbbIw+eQi8Cd4r1l6bh456k
         cgjDckvWGjFz+7eGgX1z6FfFm+XFqZc1Ikw/SoZ/mML2JRY7qh1MLax2qHJNiBIsbyYR
         d8JkMGNQO2V0v952lmMGcaFSm70ozQEHf8QR5UmUquaWLc4zpbM5GuTOuazVAvDUg3X3
         RVkA==
X-Forwarded-Encrypted: i=1; AL+hErF924w3yUpxypaV0GmYMxm8phKby08mRgfrZM8xyQJNgoCskAnsN7XH8AZ3w1PNYnLEVMQOqg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Bx1HMpYy9i8Z2KLpON8vVOky95lXCXSiFb9drkn7QYYQJuGC1
	Rr9wkcpesjLspzBHuv2UH/n9UwHPDpKePb9IY+DnrYmfjIQPinmapLJOQLKNUyu+ojukRcN67jw
	BU2v18w+uKgGCg9iQmeod3pll/rNKBSc=
X-Gm-Gg: AYBFou0z+W1rQBl4xptQ50rFAwRcy1stWYe+45rH9p4gJU720zysDHBZpCQYftwcg/i
	6rUJJnlnkorYNMvV1v4VR0MsVsm/KnApd5rqM87MNss5OklwqCO+Q1TqUaLuju/+6fanmHrQuJg
	uc3OrlaP3ZhoFyYKbiWR9u7QwuGeP/Rz5K21f/X+3xgIi+pEVlOAOr1IMYxMeXx7fcJGX5SJveu
	MAmYdOlI6wlnrOq6nHdzVcpD1CrcUDmi/K6qmZS+lj67Co5OJBlJrP688WhZomZXAPk0Jp2s2A6
	ur5KUq0U68uvkbEY8nywK+t6v5nFkqYy/ik07EDPZokZWgCmrjaRUuJGfrTaMxg7gVbTEpNuosg
	BT+4PuDvQf95PlIgrDdpFGpG9ZHdJJb57SkaT
X-Received: by 2002:a05:6820:4615:b0:6f8:8385:52a with SMTP id
 006d021491bc7-71b395ac078mr3579653eaf.58.1795212902477; Fri, 20 Nov 2026
 14:15:02 -0800 (PST)
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CORE-5IQX.v1.r0.20261120050801-1@mojatatu.com>
In-Reply-To: <CORE-5IQX.v1.r0.20261120050801-1@mojatatu.com>
From: Eyal Birger <eyal.birger@gmail.com>
Date: Fri, 20 Nov 2026 14:14:24 -0800
X-Gm-Features: Aa3M54rA3AVclKtpTsDBdZrwTvIcM9OP1ypUCaxAnAe_aZyVGm-fhga0xkyXQgY
Message-ID: <CAHsH6Gt7RkR1kKXQaQUdz-_8VYXfW7NcwPxNtzwaHtBYWgRuqA@mail.gmail.com>
Subject: Re: [PATCH net] net: xfrm: interface: restore dst_orig on every xfrm interface
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: netdev@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, ipsec@lists.linux.dev, 
	bpf@vger.kernel.org, stable@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
	Victor Nogueira <victor@mojatatu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 20, 2026 at 6:09=E2=80=AFAM Jamal Hadi Salim <jhs@mojatatu.com>=
 wrote:
>
> Found while auditing the xfrm metadata consumers of a steered packet. One
> of them is an xfrm interface, which restores the original route before th=
e
> xfrm lookup; the swap warned on the metadata dst still installed in the
> skb, and only the collect_md arm restored the route at all.
>
> The issue:
> An xfrm interface takes the if_id and the underlying device either from i=
ts
> configuration or, in collect_md mode, from the xfrm metadata on the skb.
> When that metadata also carries the route the packet arrived through,
> xfrmi_xmit2() puts the route back on the skb, because the xfrm lookup tak=
es
> the address family from it. skb_dst_set() expects the dst slot to be empt=
y
> for a reference counted dst and warns when it is not, so the route landed
> over a metadata dst that was still there; a kernel built with
> CONFIG_DEBUG_NET=3Dy panics on the first packet that takes this path when
> panic_on_warn is set.
>
> Two more defects sit in the same place. An interface with a configured
> if_id never restores the route: it takes the metadata dst as it is, whose
> address family is AF_UNSPEC, so the lookup finds no policy and the packet
> is dropped as a link failure instead of being transformed. And the restor=
e
> moved the route out of the metadata dst, which a clone of the skb shares,
> so the clone that reached the interface first left the original packet wi=
th
> nothing to restore.
>
> The same slot overwrite is in the unstable helper a tc-bpf program uses t=
o
> attach that metadata: bpf_skb_set_xfrm_info() records the route as dst_or=
ig
> and installs a per-cpu metadata dst over it. The per-cpu dst is shared by
> every invocation of the program, so the restore cannot keep anything in i=
t.
>
> The Fix:
> Restore dst_orig in both arms of xfrmi_xmit2(), taking a reference with
> dst_clone() so the metadata dst keeps its own, and empty the counted slot
> with skb_dst_drop() before the route is installed. The helper allocates a
> metadata dst per skb instead of a per-cpu one, so the route it records
> belongs to that skb and is released with it; the per-cpu allocation is no
> longer used and goes away.
>
> Conditions to recreate the bug:
> A tc-bpf program that records the route as dst_orig with
> bpf_skb_set_xfrm_info() is self-contained: the overwrite is in the helper=
,
> so the first packet that calls it panics inside bpf_skb_set_xfrm_info() o=
n
> a CONFIG_DEBUG_NET=3Dy build with panic_on_warn=3D1.
>
> An interface with a configured if_id shows its own defect without any
> other patch: it drops the packet as a link failure without consulting the
> outbound policy. And a clone made after the metadata was attached consume=
s
> the route before the original packet arrives.

Thank you for the fix!

Reviewed-by: Eyal Birger <eyal.birger@gmail.com>
