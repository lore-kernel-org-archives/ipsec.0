Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777443;
	b=FHmkKPxkT+D5FYttlgpvnmIPnO+3AORTg6ErwD6FSaLcisDGD8ID1fXa6pNErXgtoTQ3
	 qkxKftbKwUGGJaTeELQqxxe+RGB9uen14mPIIXUlorsOEhMOMkHHwbNT+ZzbWBSRj4T35
	 nnljr0S8R97Ba1dIrLDza/U8DLzfIBrCF8hJlzv7tddFpy+BYxdl764yimnn1jDBxD2M5
	 wXCE0Q4kcqS37BGJrO1Pc7Q1zBy1pCk+WpThXaAL/PT2WEKmSTQhaJ+a/hpOKEUc1YYCj
	 H9MJqGAMj3U+DvzFO5veuWPJSsR7ii+PTcPbh5X9gy4fEPwkIVVECokubNr+1m7iuwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sBbKLTeMth/78J0FzA5MVCClolXP++to0y+7e0RapHo=;
	b=gc0TMqMQzM/0pGFMxGwBW3ZUWytWLUmxT7Ow/vZLhZMWqsMm6V4y7eJVqHtsyxEmPadT
	 7csMPzf5z1VOymg7kq2SsFaTIJLXmIWjWlIsUUGRBmFcvClzVYDuKaoUsPeHJJ2p11gnT
	 OFK+sMobmDg3JesR2ftkKuQi7ptF/koQ35MLPdEwCSOellwmDKDP0VFw67CxGo1MV7BAq
	 +aDX2tcKxcjkk+xpHA5Zewj86IfP8i42P4WmTeQ9Ft5AnY+9v30OzpIhZnKPRhfppIi4k
	 3ZZh7qPKbAmU43uLW+/TpoG5YdL/FWeYjBNC7fbwE6iLy4SIqistzmYwaVSQ+wSmZow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=Jvfi5yse;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB9A606A31C
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 11:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBB9A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=Jvfi5yse
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-386c71feeeaso4459324eec.0
        for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 03:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795777441; x=1796382241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBbKLTeMth/78J0FzA5MVCClolXP++to0y+7e0RapHo=;
        b=Jvfi5yseozKbD86HLJYWEaboDklU/sdzhS9yNKvd8NUMgAGRBKgZ2CHDDxKESnv7LA
         IvZm4l31OJal+rbRZTSVPAoJxbCrJ0kLYMGiP2YZ+ydemCDU4yyPBStRFP2MqEyC4kJv
         TUFQSQTh9DsoPhaRj7DBVxaIFYVhOEEcm3ddjtZ8NVn6I8CRHRGJmnoxVWUeXLFgBNJO
         E+ESDjNthPW8MIfkBg6WKKpvnY8kBGukd1gpal4n2XjE/KxbX919wbqQXb87p11aw68R
         zAmxMkFlYM/Kgc+iqGvAbBXsqAXdCQjjgpmFQ6a1Wo7mHqZ6fUeTbSFTwR4/BBgaZaNj
         Qm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777441; x=1796382241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBbKLTeMth/78J0FzA5MVCClolXP++to0y+7e0RapHo=;
        b=x/CwLz8ZeKAR+/bd4AXqLvmO9uVeNgUs7/TPr/woFAul1K1qSW+6B5jlzGaTtA4j/t
         LbwSQQgNTAgm0gxcT0snajwZo4bSgeDkXmLbQwER7ralWLIVQPQ4f5bRuPmZhQ+tovGT
         CjCYjKVOXffasLKDET5nmfek9G8qrNW0fHYqTQPzjHGUFWfXKUhe3mjtzV2IPQqtmRIl
         wgSCS9liNmdA4nl/MAq3tfVqtTxLYqn6g3sdum+XzUE/r24hfG5NDxkDBi5i14XVWlZi
         Jwgu7oWGCTtgoVOP5qPqUoAAwuc/GKfU7KeH15MBgKzUVavYd5fdpVlOC1YnCk7V4uQp
         vQIw==
X-Forwarded-Encrypted: i=1; AL+hErHdrIvV/QOAb/3IGUHaYtE5cNgAyVAZWJhPaYBD5Sgkscd+ld3ADVCR/SL7Rc26Z2miILMbEQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9F1aDh0e8NyCEidDPtMPNFY6SQVaZTGrvrC8yxKKU9+4AVk5a4
	Rgx/vtEV8wCQmMDIy4KSOi78nnqeeOQPgd3uAWqySbXZeab9uy3gR/ndJ/UvYZDAHTWDpp9pTgn
	SO1GqIknmhX2kdvBQjltdr2V+ijjfKsAG9e8BMvJ0ukauFp0CtGnI
X-Gm-Gg: AZFdTZfmOwyA5NjuXtVoLVosPneXoCs7poap9fVOodQHlezxhiBOFGekT5kEFcD3ev2
	bOqepO6rcfbQwOE7evWDBWAoCbmizBxVtMEmSS+09GP6cfqoUp6kESaNqFkk6N683O+8Zp0SV97
	OO8+UqnXHXVll7b8+fa8LPoSBvUuDCHZnUPGmoUCJJXt9KdTo06yRe9jVORYdh+tdt097Q4my6b
	GkOk7UGenlWxm9xrLSDKAwx8Z52FCKoBdQb9DF2+Oja+wB7a8s45qHDi5Ausgcq5SiVD5kqLUSl
	jbqfxM2l2r1LOC+L6Vg93uIO0unDBRrYUmTpUnvx5P3nZFpqVfmzNGDbrvsU3IFztQArsuswc7N
	VdAXcJFAbKtcgwDO7ZltwJ2qLwdA=
X-Received: by 2002:a05:7300:ce8f:b0:375:7be3:1bbd with SMTP id 5a478bee46e88-38570b336f4mr21662778eec.23.1795777440698;
        Fri, 27 Nov 2026 03:04:00 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385677c0c07sm3922451eec.19.2026.11.27.03.03.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 03:04:00 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec] xfrm: iptfs: reserve room for the outer MAC header in new inner skbs
Date: Fri, 27 Nov 2026 03:03:55 -0800
Message-ID: <a502a95c-de83-4f8d-986e-80f804ebe76c@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
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

__input_process_payload() copies outer MAC headers into skbs with up
to 80 bytes of headroom. Longer headers (NBMA GRE) wrap the 16-bit
offset, and the copy lands far past skb->head; reserve room for mac_len.

  BUG: KASAN: slab-use-after-free in __input_process_payload.isra.0+0x51c/0x1c70

The patch was written with an AI coding assistant and reviewed by the
submitter.

Fixes: 6c82d2433671 ("xfrm: iptfs: add basic receive packet (tunnel egress) handling")
Link: https://lore.kernel.org/netdev/179524501671.3135.15869590714107061136@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
netdev's AI review of Piyus Kedia's "xfrm: do not write the ethernet
header when the mac header is unset" pointed out this write (Link:
above). 7a505bb0168a ("net: clear skb->mac_len in
skb_unset_mac_header()") does not cover it: here the MAC header is set.

Found independently by an AI code review agent. Reproduced on ipsec
master without kernel changes or fault injection. With this patch the
reproducer passes, two boots each way, with panic_on_warn=1 and no
KASAN report. A reproducer is available to the maintainers on request.
Not tested: an architecture where L1_CACHE_BYTES is larger than 64.

 net/xfrm/xfrm_iptfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 3fff835497b9..fe54979116de 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -242,7 +242,9 @@ static u64 __esp_seq(struct sk_buff *skb)
  *
  * When @l3resv is false, resv is XFRM_IPTFS_MIN_L2HEADROOM which arranges for
  * `skb->data - 16`  which is a good guess for good cache alignment (placing the
- * to be pushed L2 header at the start of a cacheline.
+ * to be pushed L2 header at the start of a cacheline. If @tpl's MAC header
+ * is longer, as with NBMA GRE, resv is its length rounded up, so the
+ * arrangement holds: it is copied in front of the inner packet.
  *
  * Otherwise, @l3resv is true and resv is set to the correct reserved space for
  * dst->dev plus the calculated L3 overhead for the xfrm dst or
@@ -263,6 +265,11 @@ static struct sk_buff *iptfs_alloc_skb(struct sk_buff *tpl, u32 len, bool l3resv
 
 	if (!l3resv) {
 		resv = XFRM_IPTFS_MIN_L2HEADROOM;
+		/* A longer MAC header needs room too; round up to keep
+		 * the cacheline arrangement.
+		 */
+		if (unlikely(tpl->mac_len > resv))
+			resv += ALIGN(tpl->mac_len - resv, L1_CACHE_BYTES);
 	} else {
 		struct dst_entry *dst = skb_dst(tpl);
 

base-commit: 2803867cf3defa294710088a4663b434e12b5e93
-- 
2.53.0

