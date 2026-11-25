Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795605271;
	b=if8xSTQ4PmbWGWPCPj3ZBo0trQT/Qr1Hgy7xBT1ls3DhOZH96FbloS+mJXjRg1skr4Da
	 t2ZpP84XRW4P1p2InXPfDgsAPP7l8JhnV5IWusHp9sXoAEk2UCuG8b752ktBE6zzRtnbQ
	 IVnnZVeLRsNBLD1ekjNO85N7oN1pel53boO3mDEsQeU4CMWseyxlG3n3C2E4gKCK0eEwW
	 OJaSSUZJeGGPBe97sXjFgEbxqP1o3AoYbXnsV6lGJfAsIYqaJExg0H2ODZYdWAmJzq0I3
	 CA555rcA/kkGG8cTKrCK+x9ljVUofqK0CJs8Cc0PfnCzIVVG589b2hc+dQPKu4sDh6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/WbQLbOVHSAoTWuLGv+HW4dYfMA6ahcKB8KXYloAqAc=;
	b=3eN/Hqky7fIpmUOm5kHqByTcQgE20XWiAbM6t0gj17gTNJpGLtlFVBAmS/4XIUXid31h
	 Ktj3YzLTxP80AcEJN+IyM+PMaOG2hczut0Kn4DYw3GGtnS9FDDYtolGoSNwNGMbi1sYsk
	 8k9Aufq9SWGmfvV8sCQ8ZyWrBvr6cKp73GWgA1aHKAObfRQ1uTuVs3SeR3jwsz6oq6dDx
	 AQQLhXI1qSE93ooOpiGCsu8nkGdLil4SXlQLG7lJ6jJ9MTx87u1GKANBLlziyTIMwWiq1
	 BMlmRvNOmpWbzhSQKAiFx9vjyPgikDJyd27cdKYKbPmSeXWasM+9gA5wSwKKbfmQADg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b="S/6fCDOQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1934C606A695
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 11:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1934C606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=S/6fCDOQ
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ae0d0b9db2so51668071fa.1
        for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 03:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795605269; cv=none;
        d=google.com; s=arc-20260327;
        b=F2xFrlWjT32z6ZA6DkhamcvmKvImT5fs+sJ2DuPnbPnMvE618rQl2Cze0vV/Fc/ESL
         eNFzLmbKbQ0tWo1f+5l7Py8VIvwCoTayeno/Lae+sSvk26/XFZkVLa2Ii30Z7TwNSGbi
         ZTI8PXd3Z8pfPk3SVKiFGAKcM6HpiwioWbQOqH6A7mehbc2HC75MQzQpy2Ai7MGJ66di
         cf23e1OnEHwsRSzG2rleCPfbpX1ZLXp5TZeACSeArNrHeDTF174BhGYQ9usZgxhmsw1F
         H4GiDs3uw8BZWHFZYYvG+EL6rHgNY/+GB2HeS+q2AO+TnM2YgZFLHdrKx/1nl3fHKxVj
         R+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/WbQLbOVHSAoTWuLGv+HW4dYfMA6ahcKB8KXYloAqAc=;
        fh=EyEpasNPX+RZxp/gsMMoj056iKkBtQf7/oRDiAYsy6E=;
        b=Aey5X97UmeAJqRX9Faprogmpi/9YeoPGHBVQTaEpAsny0ZStTELLlBJTh1iy1sEnwi
         fBjZalEmB30pjM7r2uKJNbi9FlDpLZQUaVunapGpiMVipnlb2T1nAtQQKFVepD5CJunI
         o7mRH4THjaFL7R+G0KMWxEgw4NOrrPSQXJKF1O20OIKwV8MuzczHKv+1JmrsqTBvwxnH
         SpTkvMJ4hkavPbgz8FYAplBQxundGZIZXRE2aefrWRMqpV75hpRIALnITQPG6a+C828N
         MWGmL1QW8AwVu6HSYUgXhrI+v7bRGgxNhkUm301ECsEZIJhnmM7JNJh2etJ13sYE0qa0
         +b9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795605269; x=1796210069; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/WbQLbOVHSAoTWuLGv+HW4dYfMA6ahcKB8KXYloAqAc=;
        b=S/6fCDOQS56+GngjF/LZcUmyslrIE7d81eMU97DfnFJ0enudvS5WcgdgxNcR1nWnE/
         /k3ZCiCyYe603JNKCK3+WYp5sjM+ua8eFlThkKIzhuryGh8kDHTEETnil0psK4QIgWES
         AYz+0czxCYCuL2D0jkvXs7C/U7Q9YznhmDMV8UxI/VkbLl5wUAIikAYmR/uMmwmnjGR6
         AgVKiGvPElmePnLQbnWOHh6FDY6SwZQBAs8pSOxe+FP8q/y78tM0NClGfmfkfyyJGlfa
         4FTmAR8rYGRuYv5KYrrXBICUAeKUp3YKItHifEgEeon54bgAtekrhMF10KnscO/Cf5tc
         UKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605269; x=1796210069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WbQLbOVHSAoTWuLGv+HW4dYfMA6ahcKB8KXYloAqAc=;
        b=qtuDXXFIxYtgLyPzggBuQiZecPtGYuE61sFziN42Kbzv1UQq1QkT5t1wwuB3OpxlyZ
         fKzYi1zLhAjTDgTJKAaROMNG2TfRNITZbcXc9Km9KFtz1wBkeTKClrSVBl1AIoQc5vnU
         dwD5PzzrSM/JeDctVgXVGPOWdelqUb5BM3OJvfX68sitzMVKx63wVjm/SzykWSUki26q
         nfhkrJVdPKCXYV+ckL8eRKHYW22EYtR39C2vG2ghcrg0OmLoVsJoAWRk5/a2mAw26MqJ
         NuPDQTeuBHMP5bBxrmUV0mvaSWE2c0c2pdjVcEnjAcsR3UOUnLvMxQsL2VeWHBmCsb1U
         7K/A==
X-Forwarded-Encrypted: i=1; AL+hErH4SlDbbHYAZx8gDyo3YYteE9E97xSQa0JVPqlJb0Sqg5H26fvBk2gl218da0mLknIXvM5CFw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9JKb2eVoFmQ/xGaudTs9CiWL+3A6J2/MWrEnVDFhb2I5BhRw+2
	SltWbnyX15/prhrCcgtG/4KvRitMZlf8aEUSzN2dDjhY0D1eG0VecA11wPE3GBvJrohDZGuKfCP
	uW4BjOoJl1x8Tg3zGqs9+XNkThIBRLRn+yE1g1z2Bwqo=
X-Gm-Gg: AZFdTZcMwmEtmXoef5t7iHc4uf01mxegJ1DW5eZ7BcV9WPvIimqYfwBCPNkYofb9Zwc
	ZmgD4UE91bQImG3KysFzabrXW7wzxsxmXOdQLlDbu/xEo7AMKY7DMJ6kvbyzrA8vm/tniDtfAjy
	LjYkV2wd9uk+btSqvATNu46XWAfro6QUmnC+p9ebY/1blSqIE8msuKTxkjuIBwvmJxHBnSY0mb6
	aXfo4jwbEmQDGofEJ9aG5dyu+KRaGHgo3zdR9B6ehz4bcotuvkuKhlXjSqpf+tt+rHPWnuTh/Ac
	AkBfqTPIL8V+676p6Ykq4jYsxhCFSd9ORjSoLNFhRWO8jpZgSbwDlwzDOtv/oTeWM2m5ykF5pfs
	RAJ7kuSvvwhvMlO332awSmHF7ZPyevG+zfHX287JwWSg3tlL2W9WP/mA8teDesTKHL26+E1EfX8
	rtdCJlGiU0/6Arici5CIZgiTDT+yg=
X-Received: by 2002:a05:6512:1396:b0:5c1:ac84:c105 with SMTP id
 2adb3069b0e04-5c1bc8e701fmr5040864e87.57.1795605268346; Wed, 25 Nov 2026
 03:14:28 -0800 (PST)
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116155229.318582-1-zihanx@nebusec.ai> <awa-F8TtQllwfELK@krikkit>
In-Reply-To: <awa-F8TtQllwfELK@krikkit>
From: zihan xi <zihanx@nebusec.ai>
Date: Wed, 25 Nov 2026 19:14:18 +0800
X-Gm-Features: Aa3M54obSpIFTgOpxzvlbhG_4pABQmeuGB5Sw90aMOsN7FqTvFvI_Y0VnB8DBDw
Message-ID: <CAANe3eQhQD=6s-Da74_bEy8qNFtOp_kCqpqDs64TBv0CAXdKtA@mail.gmail.com>
Subject: Re: [PATCH net 0/1] xfrm: espintcp: fix IPv4/IPv6 receive path confusion
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, ipsec@lists.linux.dev, 
	steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sabrina,

Thanks for the review. Your questions are fair, and I agree that my
original cover letter did not distinguish setup evidence from evidence
of impact clearly enough.

On Wed, Nov 25, 2026 at 6:53=E2=80=AFPM Sabrina Dubroca <sd@queasysnail.net=
> wrote:
>
> Hello,
>
> 2026-11-16, 15:52:28 +0000, Zihan Xi wrote:
> > Historical QEMU run output:
>
> I'm not sure what "historical" means here. Your reproducer will output
> the same thing before/after the patch.

By "historical" I meant that this output came from an earlier QEMU
run, not from a fresh run for this revision. The socket output only
confirms the test setup: the accepted socket is AF_INET6 and the peer
is v4-mapped. It does not demonstrate a failure.

The relevant observation is the ftrace entry:

xfrm6_rcv_encap <- espintcp_rcv

It shows that the packet was dispatched to the IPv6 XFRM receive path,
despite originating from a v4-mapped connection.
>
> >     accepted socket domain=3D10
> >     peer=3D::ffff:127.0.0.1 port=3D41512
> >     recv=3D0 errno=3D0
> >
> > The historical tracing additionally showed:
> >
> >     xfrm6_rcv_encap <-espintcp_rcv
> >
> > and XfrmInNoStates increased by one (before=3D1004 after=3D1005 delta=
=3D1). The run
>
> Which is expected either way since you haven't configured any xfrm states=
.

Agreed. The XfrmInNoStates increment is expected without an inbound
XFRM state and is not evidence of impact. I will not present it as
such.
>
> > followed the no-state/error path without a KASAN report, oops, or crash=
-log,
> > so no crash-log is attached.
>
> So this is just a "regular" bug where things don't work as expected,
> right? No other issue after we pass the packet up? (still worth
> fixing of course, the patch looks ok)
>
> Earlier you say "the vulnerable path", and call the reproducer a PoC,
> I want to be clear on the problem ("vulnerable" and "PoC" sound like a
> security issue).

I agree that describing this as a "vulnerable path" and calling the
reproducer a "PoC" was misleading given the evidence. I will use more
precise terminology in future revisions.

Based on the evidence currently available, yes: this is a receive-path
correctness bug. The demonstrated issue is that ESP-in-TCP dispatches
an IPv4 skb from a v4-mapped connection to xfrm6_rcv_encap(). I did
not demonstrate a crash, KASAN report, memory disclosure, or a
consequence after successful XFRM state processing, and I will avoid
claiming those.

Separately, source analysis confirmed the control-block overlap
addressed in the current reroll: strparser metadata overwrites part of
the saved IP control block before the old code restores it. However, I
have not demonstrated its end-to-end effect with a valid inbound
SA/policy. I also could not substantiate the proposed kernel-memory
overread through IPv6 ancillary data; the inspected helper
bounds-checks reads against the skb tail.

I have revised the cover letter to distinguish these findings and
limitations. The reproducer demonstrates the wrong-family dispatch; it
does not demonstrate a crash or security impact.

Best regards,
Zihan
>
> > We run the PoC in a 2 vCPU, 2 GB RAM x86 QEMU environment.
>
> --
> Sabrina
