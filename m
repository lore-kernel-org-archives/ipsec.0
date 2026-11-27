Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744075;
	b=njAkEThpFBH53dGJJ37CX0t7ILlr8DlcSSjvEpiygmP0CRsxCaip9TZBAU0eoMOYr+LA
	 cfbeQWzhjL3z5nAmxSetfuQa0EgWI+lxxLlP3a2iVTeiwuudRqNgbWXZDRhufcdWIwiEl
	 8znb9+JflhG7m9iiAoLijdCDabZE+vegd3qye5gkUxd1AP0A5LVjIs17UHpdQOSlo1zMX
	 4S7FTNOcRAsQrZZHGirPNFzVGAAbovFH/N8ZY29Hr5w1cAsyYoYOfsGcQ9pgUPb4O3cOb
	 +TTgHNGDJpk8WxBxdTRjZ4AHVTG/0S4HH7AaUe5GvK1xRbXGcFtKLKLDjGZsX0byeeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9rpdsm/VQNjI+QZyvQZysG3z/mkS8qpvjAF0HDQXOiw=;
	b=AwMTlLc1kFEc97xlqMx/0iCanseCn3WcLlp+TfxayVtmJ+xIjcQ5Sd9RturTW+us72xM
	 whv+LfIwBHNpddd5fi36Rnu9IqD80kEKMsxM7E6dRzHfJKfFK1kKJi69vaRNn3GjcbK6c
	 MKSBSlAvEvkD7p10o381noWWjHKBY/6BIXKEoJPvRj6dswUREtU2caSAvB9in9iv294j9
	 i9DDkKJyjweUBGZIfRo70BVnA/4Sev0ksk69khwebs58f8blR8RuQkINhr4Taj7hZPsZR
	 7TdLgqDNgNcb1E4umOd8Vsq8KECjh6sDhww6xuDNs0LMsPKMjkM29JfDU7AZ1nV72Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=i7UfiNTh;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C681606A31E
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 01:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C681606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=i7UfiNTh
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so4298576a91.0
        for <ipsec@lists.linux.dev>; Thu, 26 Nov 2026 17:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795744074; x=1796348874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rpdsm/VQNjI+QZyvQZysG3z/mkS8qpvjAF0HDQXOiw=;
        b=i7UfiNThcAyJzNtSjLPq20FjDo65+3FedpBMwKPXBtc8FEm4yYcUll7uHc1JBpTNYi
         CiKBO0TIiYgpa+buukoo63luW0SOdMUc2JoGdJkYugfX7H98v1tPf5h3tT16epmEbrGT
         kg7F1+imRM5QpakkhPgR8EJSvATlK4suuy2/Ue/UevIXuPp7Hy/pHbaQInuCnFB4Qz1u
         PjwYtUh2f7xP/MYuslBtxycue7RSk8hQQzDnbc0utmLaZSW6Zg5RPAW4qio5iGCSVLev
         EkyVZTdQd5QbO4szcm+KWs+xZ5K2Hf06R7quSij4nGVesE/YqDyJQJ9cnV3FjLf6I+SE
         BEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795744074; x=1796348874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9rpdsm/VQNjI+QZyvQZysG3z/mkS8qpvjAF0HDQXOiw=;
        b=WsYmIKzTLW3ci8gJYwpGzNhTn74ICWDbxZMhaoTf0GPcuyb4gnthSxazx2ItyAR6Cz
         SOqc9wB/ARxK2KHwjUYs0/RD8xq2lNB12EEWpE8lyhMesnWSYKlZ5htXG2hjwPvCvvWj
         yUmqEqdkn5zdeKaa3q6VZmxN0r4VfWVdr9WIFk5sOvxL7B//1ZHx8+G4tOJQzCm4losM
         D8nALEYlUbECajhT/NjSj/l3tt+eBB8SyZWjM/8ksYxJ23Ehb2S9klN7h+U3d6LGkW2Q
         vM62zWQClnqppg+JnfjpXbYa0QHnl+2EqEuwixU+gZMIRUUzc+Id61us9DJ9wrgGzCJQ
         GGeQ==
X-Forwarded-Encrypted: i=1; AL+hErF9pkqa6ipy79qUj71qTE0AftvNgGOVqX9oQSFbQEYtJfD1Jk3rKn5dzlPNcCcDUKQYYhwjgQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/V3+2W80rdT3TBLaImDC05iUCsy4DuMcswp1NloDOxfX82QIjM
	BICnJ0gNUmrBJMKA4YkmPCQrUq1JFCXARaKspeF66Md3GnWG8QHlXwEy3XNQZm+zx2BjRf9lICE
	a+STgk3JABVc0L/3wJC6gOwS2oGYKzt/lH/Tzmd79aoXy2VaNvB1G
X-Gm-Gg: AZFdTZfFJSxmmc/EbRR9zblwv0I5VVGaU18eaZ7XliLiR0zfWF0qzgKuybS2DGxHZax
	BJ8H3MOLPV97MRCVJzhGWJePQQOG57jCjqus06xEUG2FtadXERe609V+BK5Lpi0XA1Zva5q+3pq
	PEEt+H+8g3j/sBtXwLMDGAdkyVGPijv1hNyao+NetM271S0OfVcknCQxK6rwewy+nxe7sMtGAZO
	RB3ruj4ZFVFuHuWiMDDRiNZsiQY632xa9wZsD47I8MKdWOIZfVO+RFCb0NV+lpj4/8Yly+E/qYI
	o3Cz8x0W1iP+nPMJxGnlHEvf1Cn1+2J+eIOjtfy9XlW2b55v2qTOYlx54ayOl3oL4dKCMwc2FM0
	yoxwjPOInieRNHWhmnzeHZ2I8dzs=
X-Received: by 2002:a17:90b:288e:b0:3b3:ab75:c94f with SMTP id 98e67ed59e1d1-3b41c92a098mr21400073a91.31.1795744074328;
        Thu, 26 Nov 2026 17:47:54 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062a77f5sm16585106a91.6.2026.11.26.17.47.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 17:47:54 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH ipsec 1/2] xfrm: iptfs: don't modify the shared info of cloned skbs on output
Date: Thu, 26 Nov 2026 17:47:51 -0800
Message-ID: <5ea528c8-ec02-4f2d-bc59-50700be8216a@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179531150722.3135.5639628464200463791@kernel.org>
References: <c1e999b5-15ee-468d-81c5-530a560e84df@mid.andrii.net> <179531150722.3135.5639628464200463791@kernel.org>
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

On Sun, 22 Nov 2026, Sashiko AI review wrote:
> [Severity: High]
> Does this guard hold the "they are never appended" rule from the comment
> above? It only tests skb_cloned(skb). It also runs after
> iptfs_first_skb(), which may already have uncloned the head.

Yes, this is a real gap. A head that is not cloned can still share its
frag_list members: after skb_checksum_help() as you describe, after
pskb_copy(), and after skb_cow() of a clone. v2 tests skb_has_frag_list()
instead of skb_cloned(): a first skb with a frag_list is sent on its own,
aggregation stops at a following skb that has one, and
iptfs_rehome_fraglist() is removed. That also covers a deferred skb2 that
becomes the next first skb.

I drove your route directly in a test VM: a cloned CHECKSUM_PARTIAL skb
with a frag_list sent into an IP-TFS SA, then a small packet behind it.
With v1 the original's frag_list was written into every time; with v2
never.

> [Severity: Low]
> The commit message says: "ESP copies a cloned head anyway, so this
> moves that copy earlier and does not add one." That is not true...

Agreed, with aggregation ESP can reallocate the head again. v2's
changelog no longer says it.

v2 follows as a new thread.

Andrii Tereshchenko

pw-bot: cr
