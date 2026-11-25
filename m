Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572780;
	b=JuoZTUCC1IwhC8RH7wSZvuMVI+eaIyKValxLGLbxKw8lkscX7Vzjs7CKPrvRlZUecYaf
	 fJgFKymbu9g5EUmmi7RF2gvOwOqMWYpBLK2UtOinDCPOBGe8a60psbX8beytk1FkIJLgC
	 69OYT6pXlNmhzR8mJlnZDVeOZSvyljxNDtaHe1FiGn0scbIntqAAw/1uUY+ykeN8Q0ukG
	 an5H9DIV1syWksNz6HITVApcl8xJmcI5rKefwMyyn++ecwoJ+TZaHN2UEd4jo0vMugL2d
	 O11MKVuEO2/ZvoAZhkAEzTfk74K15uI07X+mVd3dyF76pjbDAmeHCHFJPemxartlX9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572780;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=uxSvM8v9iWMdJLRUywcsIsLABIUqe2hJ+iF7YYdPOzKM+5onkKvFqSSC+U/BJxyvpNxA
	 kNU15jlY0dDTExK+EsMKHlaHKui/wWqUVvkhCrggsKBZXve8XAgTHiAfTxZYJsqKrSJmS
	 jrQJuMgJnoY+XFpbptBWYbabo+SggA3Pg5PkXRgQkI5eo7M0gPGFFJ5nhu6yUiWhzAeXP
	 nycoY8yOET2/8SPQPlM37XFsF8ItiPxQO+Tgn47gk9fj2PhsIod1MuKrBMLCBwG+NqyVb
	 YNRTbZsCSy9FswrdfWE4C+n44QoPzEvhH21iPLcZorpPKTetSms2aQbf5hkvAQElYiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XCDjNUoF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430AC606A31E;
	Wed, 25 Nov 2026 02:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XCDjNUoF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E2F1F000C4;
	Wed, 25 Nov 2026 02:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572779;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XCDjNUoFlP8R/mimEQcwuL0ua4CMl70HbtnAAIZ5DaXNTZ+6E6groMFINPvaXRfNL
	 8JY0RvHkdUgWV4vZ5WE0FOTNtploYUItlulstdV1MLxL7X1X8MypiTxNpMvlwRZYsc
	 4N0VCIYzz3458zLoCRe1UX7GL+P8gSkcIlv6tMTp9kKhJUbSy54hyVlCXJ2krtOqon
	 VhKeA1OLJR84V7hwhrKmqIQoSaRvr/PNUY4P+QIx74czP/EsMfuVOpF8iqT4JRZjwc
	 2C4fiE0c/cCwZZzwtiru7COiakT8REYAwwdlxSLg6qvz0p6xgr7/TW0MygqPknYgXl
	 QETspATV9FeeA==
From: netdev-bot+sinfo@kernel.org
To: Jianbo Liu <jianbol@nvidia.com>
Cc: netdev@vger.kernel.org, ipsec@lists.linux.dev,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 Raed Salem <raeds@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Cen Zhang <zzzccc427@gmail.com>, linux-kernel@vger.kernel.org,
 Carolina Jubran <cjubran@nvidia.com>
Subject: Re: [PATCH ipsec] xfrm: Serialize offload stats updates with x->lock
Date: Wed, 25 Nov 2026 02:12:58 +0000
Message-ID: <179557277808.3294.12876532999063461182@kernel.org>
In-Reply-To: <20261125020835.1132797-1-jianbol@nvidia.com>
References: <20261125020835.1132797-1-jianbol@nvidia.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
