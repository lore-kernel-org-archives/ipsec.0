Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637053;
	b=0pnU/a5IT3YkG/gCCkD6rXeHSBCRXcNUpBFbEa1dRLIKnfyrfLbUZajlgnHf32Ld1vmd
	 f0uDjXPOrTu5r2VUtm6A5mJLO3Fe4h0Ss7nPg9/fEmKijeeAY8i5pnLxdDtZpGpyNV5kM
	 d+A8rl5LdiKtpvUmdhvP0YAOuBQpWSgBmxjfR0nOWQGgNQ2t+J44Uc3s1ydvbmTvJZIvO
	 K/D3YZpixrooiQnKvoCTDsus6An8UvZxhVOWTXjlKpga+mcv2Hp9iL7vsg/OZpG/z+3sa
	 yz2CmM1wvaAl5Jj0KA4UeMkvsib4mXwLU/5BbYtC1LUVm3ALAmnv5rmLgXXf1hAuaQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XbA8xSo/0EvP3bC+6uqk9zXWFfD3XB7Srs6wgP7XMNE=;
	b=yYBBGjxkrpBbXS19IyfdqNOd3l6iwALoaZdQEsNfIjRYKE/ObDpzuaGlCxk5KOjiflNa
	 LbfD/ENlNjCCKF1AO+Ud9VmkYhdrbXYStREiKkkOAFMW329tJYvA7ldgscS0MGLXwBZSL
	 y8k4wf3D0tbjkGHdWdKs8AHyuVu0YARgWP5XmXJsHu4dlFR0wdnJsxbr6NVvjxLZaL0wR
	 IFIf0c7E8CLmjReWpCE1CmAIKSxupVl2Rx4Aqdra5l83CfxILqtjfDAGM/xNCbJO3lfS2
	 AU0AHofd6/0svpiBOaesSeV8z7c+gWKNrJzSIgkUXpT3NwP3WZ/Mr2YDl9WVZNeF+AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=GSCAgotB;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA70606A33B
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 20:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA70606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=GSCAgotB
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cde84cb8803so1624346a12.1
        for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 12:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795637052; x=1796241852; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XbA8xSo/0EvP3bC+6uqk9zXWFfD3XB7Srs6wgP7XMNE=;
        b=GSCAgotBLt7zwGD8KaJ70u3XWNha89MArmrkq24nSzKXOmV2Nb5RaLo9uzAfgOoYne
         Ubz+GdWfZSlVV51j95t3Yf7nt9o87LL6LN9T8MDLFM9kfYsKVoIbszPhpOsBz4raTLsd
         GzhirUCVZWjFNcZAYBkPocyjIU4BMm0Jif1X4/iXLsSymNfOilDCjfP7fwNQB3EDzH0u
         rcI7f8ceYXbhZVmQCuGpd1Dz6AbYJkKSoZAwS4NiL2rOyZqFL1lEzHn5mxvJhyCAZhhT
         lwifgPnKN2ZLav/0tgo8Qz8yZ3fYpwzpTk+TH2bg+j8AsipwWvpOYdsCygw69Pw0f1L/
         6h8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637052; x=1796241852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XbA8xSo/0EvP3bC+6uqk9zXWFfD3XB7Srs6wgP7XMNE=;
        b=uL2b8TYgZ8JS25UWBrbQnJ2rTe+94w6JQcd/5wpvHfTQtcxOvuARViUZe8xfUReKWd
         LJxoprdr775ZWIWYekLKCrGcaQaZeJvyneY1V41lFy126m1j0iRugLtNX0rR0cZP5Af8
         6YoXm7b1kP+4ByJI312viPeAI1XpSErkpu6pmOHfcIAfizjd8nHKqymocrB7hQWAdBms
         /HLTzZZ3313t71+w+8oujIXKZ+RGcQyURoapPt21IyP//C2r1vjGDSzvLR9Q6xxzbFt7
         ap/QC44F5H3awnzQkIXgUMYHlw3OA6Rcnzjf2U4fTMMG33H6JmeiSmfsYNY4w0+FebWh
         DX1Q==
X-Forwarded-Encrypted: i=1; AL+hErHXFjBahYPo3wKxffiGs68NarLZMLnumbaE8rB0pwR4FmUCfKxQAey3dGG4UQACsNn0kC7MUg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9MJNg8EiOtVCfBP/4ImbERTpP2thBw+v6IPF2HhMXdF+M8IzXH
	pthos8+M+12LqVwU8GBEIUHvM3TYiNnAykw3G4zxeHSeF2IhosuqxgVfIJztbX5KEpleF5JCSDb
	7XzDpUjGxcs35tZpjN4xQMz2EX0j+NioIaa8cG/4m5qXgzUm506kL
X-Gm-Gg: AZFdTZek9x+IkJt27PY42jPnXGp62FK8/xZZmhM/aVzqo4COrQScoSQWuj8b8qvNBas
	Mf2QFSZ0JzRq7sPDoDE/N0QDqSBXmX0obNmCdjFoddnP5iei7GFPDUKgFqD2gtAevClBWWhSLB0
	o/VGV3OM58j9cdoIWA1zvjiWQIZw6gazxG6vAo2STg7dbReoVX+m4pM31wRSxjQV770c4NZRSau
	Eg+06tVYjvawQT+dq1Q4Oo1KI84ZVBcbuQr3JkyHmLrJJwiz/y9I7eYzL2qym0AQ5WZY+S0G4zL
	1rpStYHTSu35PO8cbY3NL0T7FTOLbOA+g+kmqwYYeq+nHX5DIePwfln6cLGkn3KKlEJjF8nEjTk
	18geHGyov3vPS9C0LAHcS6ov8rA8=
X-Received: by 2002:a17:90b:4e83:b0:3a8:32f2:f4a5 with SMTP id 98e67ed59e1d1-3b41c956a0cmr18014294a91.53.1795637052486;
        Wed, 25 Nov 2026 12:04:12 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d224ba3sm7118846a91.1.2026.11.25.12.04.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 12:04:12 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH ipsec] xfrm/compat: pass on the translated length of a socket policy
Date: Wed, 25 Nov 2026 12:04:09 -0800
Message-ID: <76b0ddfc-33ff-48a0-8113-db94076f2473@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <5249741d-fa84-4d54-bf77-45f48dbbb169@mid.andrii.net>
References: <5249741d-fa84-4d54-bf77-45f48dbbb169@mid.andrii.net>
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

The netdev AI review [1] raised two older issues, outside this patch.
Adding Willem de Bruijn, whom I missed in the Cc.

Sashiko (netdev AI review) wrote:
> This is a pre-existing issue and was not introduced by this patch. Does
> this translation also run for x32 tasks, whose layout already matches the
> 64-bit one?
[...]
> Would compat_need_64bit_alignment_fixup() be the better gate here? On x86
> it is in_ia32_syscall, and net/ethtool/ioctl.c already uses it.

Yes, confirmed on ipsec master with X86_X32_ABI=y: x32 requests are
translated as i386 ones, so their SA and socket policy requests are
refused and a NEWPOLICY loses its template, leaving its traffic in
clear text. Gating on compat_need_64bit_alignment_fixup() fixes it; the
fix will come with the other xfrm compat fixes. x32 readers of dumps
and notifications still get the i386 layout, which needs a separate
af_netlink change.

Sashiko (netdev AI review) wrote:
> This is a pre-existing issue, but should this translation be limited to
> IP_XFRM_POLICY and IPV6_XFRM_POLICY?
[...]
> As a result, a compat task's PF_KEY socket policy shorter than 164 bytes
> is refused before any key manager sees it:
[...]
> The gap came in with 96392ee5a13b. That commit replaced the
> in_compat_syscall() -EOPNOTSUPP refusal for all optnames with the
> xfrm-format translator. Could an optname check be added to this fix?

Yes, it should. I have that fix ready as a separate patch, which runs
the translator only for IP_XFRM_POLICY and IPV6_XFRM_POLICY, and will
post it with the other xfrm compat fixes rather than fold it in here,
as it is a different bug.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/5249741d-fa84-4d54-bf77-45f48dbbb169%40mid.andrii.net

Andrii Tereshchenko
