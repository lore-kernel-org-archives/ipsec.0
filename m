Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748973;
	b=KGJR+PwqZ1zE7g7+w1nLk9PBQgOVHEgV3WNt4nOJ69AKKIMMVH3BPo8hVIOnu9KV4Oi+
	 OIrEqBO3fRMWFkJ8uIZiDBiEVHurp264VsvoEU3pkEyipTp2H61rFDKHYCzFUj7IjVkCE
	 YPVg2t87DVOZ/3siUy58J+e5X6QwQ30Z07idV2kaEMfqyj8lmt9M7+TdhPPXzAx/uQJBU
	 klNWlIHijscC6Yj1cZttz0o3NroTUSSm2cK5p6uYeX/36rM/AZfN0jN3JMBpG9mIC2Fey
	 OOGCCAqHUwn3X16IyS520frnr7lHES+DDrmv6y2RcDB7dtAzayyBLs8ckLjQp1fgj2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=lYdXgvNP0+osPYkNvp5kuJoWkPSjofQK2n2XC+K8pfo=;
	b=NMhFEtOgIn/vnH9NHnGT19GOq1dwewDDHPnlLWI6N+0Oklfx6lzZrafB7rqHVig8B3vH
	 8b27Pz6r11oed3oMt2AeapqywHqGWn8FWtPdid4/ozYxUFysSxKS8Kf2pQZa9rFk+D2Qj
	 RYhqYiMcreHlFWz6QWx3c9qh10vqOl1GDnJc41li3++aiTUOUILv2kLSOPPxw2AQ3/3/6
	 vs7mpBj96zTtFGdMkM+ZIta9g8GDq6PfsOkQ39xgmTZxkSSD9NBid7AI3T4y3k1BzDHQB
	 /5nHOVLQPlcdkKETMfMx3L8czxuxy43qKxbirgNhkt+D3W3IlZ68Rz10vPh9WfR4kKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b="aK/d+tuo";
	arc=none smtp.remote-ip=74.125.82.226
Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25AB606A323
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 03:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C25AB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=aK/d+tuo
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-38644aedba1so11278232eec.0
        for <ipsec@lists.linux.dev>; Thu, 26 Nov 2026 19:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795748972; x=1796353772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYdXgvNP0+osPYkNvp5kuJoWkPSjofQK2n2XC+K8pfo=;
        b=aK/d+tuoYS5WFLf701EPRHMPjqqylYxFQMjG0+mpmT8cF4PsGfMNQOC7D4WsTREHqu
         RGjfZ1P3KzvaLBm4J5fwohpF2Kb49W32G9Up+kG/9FyTxsOF6RexIQel0KCgtGmHWV85
         osaEnQzFPJ26wjdsp8o0NQXs6oi9RVgYcMsOa3nr3YdnYzIF8taRQPWj+hxHrJ8LQo3h
         ytvtYCNckW7Hm+91pUnlOT0rCPOFUcQVCH8AxYI3RBlcPyz6n4xXR/rLjp8jZzw85wGt
         DbDH34LTawCLv0cTG+LWCf6Z85q0mmOergDZtzxfcmyHVysqyLvDzPa2n/itxXW7ljsM
         hxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748972; x=1796353772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYdXgvNP0+osPYkNvp5kuJoWkPSjofQK2n2XC+K8pfo=;
        b=LAOkqqxM1+EIVpESJJFYO/QU4BOwksSWSuVOiH+nL+Mrq+erZBVPWx6ZLoCukV4cEF
         BB3VedzycHurcuB/nLNVKbO9mkXQElksMywYcpkldGxhLa8g/VigzOzwUSfbPDGmiF2L
         vy695BY+mEidYzoa3BhideJKFsxZNZuKuaa2tEd8ncDrzxmUgxIcRB68tFMHbI5dVjrj
         1BGkR/lwsgKrEQJ9UYheahEj/rcLCq6gDqWA1sywGsDlMAb02CRvSDm8MN5zszm2+zIg
         MDS/x14wn90ey6oYw7Lun7sVRvC2skCXs3R02+AsQKr7HYP16u0f6KKZb6dcVSXJbnxn
         0W7w==
X-Forwarded-Encrypted: i=1; AL+hErF/OdCZJEnjnZY1ImmpRaEGuS+kZW7c/UYwaQ6s3fiD3jxf6BCYSkT1CojXHKfnfX3PgaPx8A==@lists.linux.dev
X-Gm-Message-State: APuU4Z/xlpug2K1CwCDe52c9MMcQ9CxIfcBc3u7SKvnWUqyHuoAl2UvT
	SdVTLylg2X+W3eedw9o0jFGA43cnCc2l+Sz0QUgv+VCl13AcWXLrKWTwUbnBfiziFHVsHZwzD+t
	G5mBxrNKZlU1xX3AzbSpWulGm9ylWM8DtCdopA8eRwD1G7VbpTcs5
X-Gm-Gg: AZFdTZfvqxrcFq8aR7PByBH21YORApTm7zPlP/GFoOHHH9n8m7VL/4GJSALETLoNi9U
	V9mBfTcf2brqXzvsHTx8jw1TXOc5B84anlY2QY5GxpHrdWKyUQG3D65hAwrBDGpIu8JsQtHChdC
	F1a1WDn3CwcQzypZUQIXvDSM1ZOgsYBzJ9KrkvzFCtF38Q/xpb+Jn7uuCiy0IpG+LPqMgnZWQ3x
	tNfduFzbsUoyzEUzCsUPuOGVVMz8T1qEKwMMVFLAfDNCey9nPUgrG0CmzCGOmC9XsNkBC3BrH/g
	wJYQft875X2J4FZ7Gaz8g5kfheX3OfY6vEkSCkCileJJYn80cTi3MKeJ/ovtwxTgewT1Qo6Icg6
	udquagerPCbpSNxJVj+I2ED/5Viw=
X-Received: by 2002:a05:693c:65ca:b0:386:b826:407 with SMTP id 5a478bee46e88-386b826061cmr13259762eec.20.1795748971828;
        Thu, 26 Nov 2026 19:09:31 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-386c7c627b0sm1659379eec.23.2026.11.26.19.09.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 19:09:31 -0800 (PST)
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
Subject: Re: [PATCH ipsec 2/2] xfrm: iptfs: hold the dst while a packet waits on the output queue
Date: Thu, 26 Nov 2026 19:09:28 -0800
Message-ID: <47c34f93-d927-4052-acde-83a84e5ef373@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <45f802a2-c639-44bd-aba0-5c81e2198c9e@mid.andrii.net>
References: <b56bbced-a8b0-4ae9-80b4-1958ea36684c@mid.andrii.net> <45f802a2-c639-44bd-aba0-5c81e2198c9e@mid.andrii.net>
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

Please drop this one: Nguyen Ngoc Thang's same fix is already
upstream as b88c75488ecc ("force a dst reference before queueing an
skb", syzbot 622de7e1f18a30fc404a). v2 keeps 1/2 only and follows
as a new thread.

Andrii Tereshchenko
