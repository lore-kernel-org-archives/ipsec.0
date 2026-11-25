Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587919;
	b=xgiDXKW7FHkPq3n+AlcVidv05rtQc+nD+g+oO0eA0LmD0jPfTsauxFrUDlP5EgOA4+aR
	 625Ydj6tjTaBzOwe3cbRdFPb/piB//RvPPEMNsvw0OPaZDcmReiUpKYCOJ6mxCzahrINw
	 ZAS9PxbC6TrPcrvCqvmnF9omyu43L+m8a24bXUKjMG0W46AjlS29QGKF75dqZwkOREGLD
	 zov3AaT2Y2xzljpp6qyMgsFoa18THRfY2Gc4jGGJQOZEkGPXOcevBgDjAi27mYMtn/DB2
	 jrmlQGjRvR/DNH+LnVgN5pO6hlYBov33GyRKrkVHDd0rLS0NJEXVQ8lzdurP6XIy2Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wQqO0ZGiPSduhL/nnYRl9rtTaPzOuw285ahJlrfXT+I=;
	b=X8IlOTze1j1w7zXAZjAsVqzip29cKlh/yNZxA4wPyheegNI2w7NtFdm52cZB2rZUmusD
	 JKuN68x52e+c1cX4ydS5FtLZiPMmeFkiYMZoSxPD64IbnM+B69dpK0+z8GbN3w3X9eRtb
	 YmykKgta8sGHDduO4YsECY/Xeq9fO6DesiqPrJWBWU1qGI3fbC6mtRva+4f7RR+shda9W
	 XzOfcZGkekkiOKtPIX9PIXkRDeLGSviRqc0awOlhoHEo6dx5wsc3WEwbqR6ElV7ngJQoz
	 k1JoEsYxPJO2d84lSV1ThtQIHclGCrJeHOIQfStd9wr3GYQA1KiISXtxZA2jOBXIVFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=VJYa2XUP;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080A7606A326
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 06:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 080A7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=VJYa2XUP
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3acec6677so7976747c88.1
        for <ipsec@lists.linux.dev>; Tue, 24 Nov 2026 22:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795587918; x=1796192718; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQqO0ZGiPSduhL/nnYRl9rtTaPzOuw285ahJlrfXT+I=;
        b=VJYa2XUPlju1kVR6vhELYAUPWcgniW5cPCCnRpw+m5eppzd5x41v+HI3Hm6u6o4daX
         YxIeYMsi9NQbK4UGhGNQRTIvgbt9CDgN2jkUhRpK53tcPAIyi9NHmJ+Awbhg0u+7hGka
         JeK6PLkUNJXDjc4DKmSWhA72vqvvcr9qRS3eSam6Enc9xUbe2PDfNdjI+D5zkBPVb1xl
         3y55VPqtREHVkeMCEjFcLd7hvDu6asEpHW0npN8DsnSZjjAU+W0tp8xFgOTakwxzjDCZ
         w62vfnkmA8EODcqoL2NxKobmfKEbh7P55HjAKeTv33QMmOnOTlbansjFNYnVpz3zBK2C
         O+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587918; x=1796192718;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wQqO0ZGiPSduhL/nnYRl9rtTaPzOuw285ahJlrfXT+I=;
        b=In4xRGyAjfq0ifszoz+V/QLkexVHvdKnwTJcWHAA84qGaVGIYYFRDhZEzWz9OPQ9XZ
         pOPXCOzHs3UVqCj6uMCeUMRUO4DFsoxCm5LTmCmWMJ3FkcDQ0iSyKq6SwgqfkXlVH+8j
         wt4xgqpPobq8ZH5XyBru4Isct7pBpDvrMUlZB8uE2ZYgI4B54UX+MRgPf15QbRiEfdzk
         kMF6gQm1WCOTUO6OSCtx3OAew/qjkiwSeMxYi8aFDLyE+drewwN4PXARVsj5rfmxuL5+
         jQIXbgLYUBIbtJHacyKPi1mNE2RTZ5NRS2IBLqts32fJqzzb+loUtMZSiBweMuuw11Bq
         E5xQ==
X-Forwarded-Encrypted: i=1; AL+hErFqYZjIQSquU4hJ+NJ+CN6QG2nR0BYsN12V+rH9pV/BgMntUyXfQ3TLotej9jKXZ8sctvmyCA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+anZBy4WIk0Ro50tPtSAT89NE9Ppvxy4KJujlXqSGN8+U81Q6W
	bXaH00P5gmxFZMXaUlxC3xox0w3fdBDCGGqCCB+RWsIqu+mHB12545P3oNdqVR3jbHU=
X-Gm-Gg: AZFdTZcsRX7X2M7xFYTBpfi9BCfCVUBMVeF3ZHe7GE6Gbynqc3qJvvv+gUZykrZR5Jm
	HISOknj6Rnux+2KJ5byB19OQcvK+SF0FFIw/cm2OvmjZttkKzGxFJAw15I1KYi4bARw71ak+UTw
	cnOJNs3Q03WWhn2m4vwI7prhHxwBT5gutXmJwWqHtO2JLUvGDu5OzJwX6l2tzBaoG++Q8RILI5f
	yqsHzma//wktK5/eGg3uY5AbvOMRuQ/u+IYLu836yG3LB7S4TOrlKEuY4wj7BIPOstPb+roJu/P
	2Ugka+tIfhCn9LFFvTQxgYYtc9BivaXiLbLkaw33dyC2ajrfn3SqeHUSswvoXE+6V22d3hKWeIk
	tC+uTm7QplJ28UkimeXtPQ8LrYKlKWIFICc1NFcExwFcXLYoryksy9L4Cn18tpTnAc0mk5h7DzZ
	YdQXlYRL7HDYjdtR3HC5RGhVdHJjlw9ngNumAKGVraD5545mkwHZgMcWhgPi9NrwrqYjETeFWK1
	KTSs4L5yBk8W9dmoWp6lw2HjmT7J6LVA/Nuieut3QAaKgnHf1l93ziMGtGAZ4OfM+D2yctPeOkA
	FA9WPzYdjrKrGWmBPkWyNkyBA4dUuH4uaOhiT2thp8M5/x0JiacyRKsMMaG1krV1Al80UNYAKb9
	eKmmrH1nx2wj6af9Y+XTbV2y25A==
X-Received: by 2002:a05:701a:cc88:10b0:151:6e80:ba7e with SMTP id a92af1059eb24-1b5567dcec1mr15984271c88.4.1795587917888;
        Tue, 24 Nov 2026 22:25:17 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm38712721c88.15.2026.11.24.22.25.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 22:25:17 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: andrea.mayer@uniroma2.it,
	autonomouscodesecurity@microsoft.com,
	blbllhy@gmail.com,
	bridge@lists.linux.dev,
	davem@davemloft.net,
	dsahern@kernel.org,
	edumazet@kernel.org,
	g.goller@proxmox.com,
	herbert@gondor.apana.org.au,
	horms@kernel.org,
	idosch@nvidia.com,
	ipsec@lists.linux.dev,
	justin.iurman@gmail.com,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	razor@blackwall.org,
	steffen.klassert@secunet.com,
	xmei5@asu.edu,
	yuya.kusakabe@gmail.com
Subject: [6.18.y] Please pick four networking fixes
Date: Wed, 25 Nov 2026 01:25:13 -0500
Message-ID: <20261125062513.96901-1-artem@trailofbits.com>
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

Please pick the following four upstream commits for 6.18.y. None carries
a stable tag, and so far each has been backported only to 7.2.y. They
touch unrelated files and can be applied in any order.

1. 2842ce397dd09882530b42f7fdb0c855767eb24e ("net: bridge: vlan: fix
   bugs caused by switchdev deletion errors"), CVE-2026-98285

   When switchdev fails to delete a VLAN, __vlan_del() returns early.
   This can leave inconsistent state, leak memory when the VLANs are
   flushed, and cause a NULL pointer dereference on the flush error
   path. The fix logs the switchdev error and completes the software
   deletion. In 7.2.8 and in mainline since 7.3. Applies unchanged to
   6.18.65.

2. 9fa903b24b1f46b4ff5443bcd4aca23e5c57f9c1 ("xfrm: hold net_device
   reference under RCU in bundle creation"), CVE-2026-98364

   xfrm_bundle_create() and xfrm_create_dummy_bundle() read dst->dev
   without holding a reference and pass it to xfrm_fill_dst(). A
   concurrent RTM_DELLINK can free that device first, causing a
   use-after-free. The fix reads the device with dst_dev_rcu() and stays
   in the RCU read-side section until xfrm_fill_dst() has taken its
   references. In 7.2.8 and in mainline since 7.3. Applies to 6.18.65
   unchanged apart from line offsets.

3. 87cd6b717e4069dca34e0866e57eaeb44d3b173e ("net: ipv6: keep room for
   the mac header in dst_dev_overhead()"), CVE-2026-98570

   The seg6, rpl and ioam6 lwtunnels reserve headroom with
   dst_dev_overhead(), which can be smaller than skb->mac_len, for
   example on a VLAN device with reorder_hdr off.
   skb_mac_header_rebuild() then computes a negative MAC header offset
   and writes past the buffer. The fix makes dst_dev_overhead() return
   the larger of the two values. In 7.2.9 and in mainline since 7.3.
   Applies unchanged to 6.18.65.

4. 8ae3f4067ba4ae3a15581392f6dac422e3d3def0 ("seg6: ensure packet data
   is writable before modifying SRH and IPv6 DA"), CVE-2026-98802

   advance_nextseg() and seg6_next_csid_advance_arg() modify the SRH
   and the IPv6 destination address without making the packet data
   writable. If the skb is cloned, for example by an AF_PACKET socket on
   the ingress device, the clone sees the modified packet. The fix calls
   skb_ensure_writable() first and reloads the header pointers
   afterwards. In 7.2.10 and in mainline since 7.3. Applies unchanged to
   6.18.65.

   Ordering note: queue-6.18 contains
   seg6-fix-transport-header-for-inner-ipv4-with-ip-opt.patch, which
   adds code above input_action_end_b6(). With that patch applied, a
   three-way cherry-pick of this commit is clean and correct, but
   applying the upstream diff as plain text places the
   kfree_skb_reason() hunk for input_action_end_b6_encap() in
   input_action_end_b6() instead, which fails to build.

Apart from that seg6 patch, no patch in queue-6.18 touches the files
these commits change. All four cherry-pick cleanly together onto 6.18.65
and onto 6.18.65 with the current queue-6.18 patches applied. Older
stable series are affected by some of these bugs as well; this request
covers only 6.18.y.

Compiled net/bridge/br_vlan.o, net/xfrm/xfrm_policy.o,
net/ipv6/seg6_iptunnel.o, net/ipv6/rpl_iptunnel.o,
net/ipv6/ioam6_iptunnel.o and net/ipv6/seg6_local.o with CONFIG_WERROR=y
on 6.18.65 from a cumulative x86_64 tree, with and without the current
queue-6.18 patches. No kernel boot or runtime test was performed.

An LLM was used to check applicability and stable-queue history and to
draft this request; I reviewed the result.

Thanks,
Artem Dinaburg
