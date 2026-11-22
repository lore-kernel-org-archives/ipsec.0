Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352973;
	b=qHd54ZkSc27MAUp3EJhsD5j2uiK0S+rRJtzdWYerjrXFSLdGiZcNtA3172TXx5IY4wLL
	 fXR0Ko4SWK+qCx5ALUOCeBnK7syVsFw/edUrMvs8iipwshrQoCeSuMBTe6pSOLf8/W8Lp
	 8rlKC6+OwHVNkuBLhL5Leks4R4w9NfxiHXeT0EksZEFOFZttsILHuNyM6eZRscy4oODsb
	 zYbH7mMROmBIzwcZ3vyMxNj3/xA7Nb7gJvGfhdEiSIG5JltN7VfdMkQkVdT0VL14I3ctm
	 ctpnT/M9MBLwFesD55Fx2rhxQm973nZWGrvvKoB55RP0nD0e5/6XGuDaRigWkmJimOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RzpIstdBZ9UDJfuYE6dfOAxjKSqfqUAZ2HY3EqITTgs=;
	b=nB5NWS12X/jBf30jw02kLZ5cCcjcPOHvnDlFvpdk4i8SvXFyzbysBMWqUog1DIl6rYld
	 DiHIYiufXu7P81gjaESfEehnIgUNl/awxG6juG7mHN5yGrZ8wCjLo4YgxfH6Dusg00saQ
	 yR7Bj6kNxUStuATz8mqXhoHtGwQuFuzT+U2KC/xhuaNYpK7dbd4DQLDzzKzOsZ1XVTCja
	 9wJ61VVPwgFCtcxByrYPdyQdrIhwVEk33sV+lRfzLoJhZz1yG8AVzDNEksFQHECIRnwgz
	 S5SkVHAMlSaSUczyuqzjCqgMbfH/ukjxv9IyUSDOOlK7wlqemxFd7AOkF8DNaHCOYQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=isV5x3oM;
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E17606A332
	for <ipsec@lists.linux.dev>; Sun, 22 Nov 2026 13:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02E17606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=isV5x3oM
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-943e8d35f74so256157985a.0
        for <ipsec@lists.linux.dev>; Sun, 22 Nov 2026 05:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795352971; x=1795957771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RzpIstdBZ9UDJfuYE6dfOAxjKSqfqUAZ2HY3EqITTgs=;
        b=isV5x3oM6vdPTty/mFxJuwvbjMxb4V9nZenaeYhuAtBMP17d4mClsXrHm+0X4JXu1i
         xYFH3oIaM89pEeZHFaSUAcycSZu5A8QusdMTyTCD13R4v1jU0fuvqkXYn5pSy9ERQFhs
         gD2028+0GzaAmf5YMF3086ZI9wJV1uMIJvwLh0irUX7UiqHPWzWVN8XuT2kr9zY846sm
         iqFaUxGfBrn70oKkrsYpSjgfQQu4svgt0OErtL5l7ZsotUgWzw0QYHXJWUvnKArnSWtn
         +0HuMZs4Q8PcfhzjxI2jhMWJ9fdt51LJYjc3GKea6E34p7+ZDpkrW4L57EE2iohn5J57
         ls4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795352971; x=1795957771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzpIstdBZ9UDJfuYE6dfOAxjKSqfqUAZ2HY3EqITTgs=;
        b=U/o0u0+LTyzK7v+R53gltzWfLpjDF/a31XJayaKvWvWRhF7wbw981A+xjIeD86jj97
         v7+ylFBan62BtFhsqM/uRS40eDIDxlwH7mJtgfIUsvyV9cWlpFbow4jnOWaqw4HjOIVo
         TYAWAuOC8gt1sotvt0AGqebFZo9xwO/B+7fwL3ug6aqe/pLOPlMP1txmxlOiDmx7D9EF
         LcvAWcTHRwpppKeK70WirkAsTRAA2a1ViQObrQDEcssFzHiBqZRBq2lmyH8rYwzhQY2Z
         n6Oz7LjCyINmRABAqu9EozV7jhLeuI19KyXISsH+buri/2iN4nvxGn2ixdnBYiO9qAor
         h2Vg==
X-Forwarded-Encrypted: i=1; AL+hErFRYaduCEpXnkzmcdzMrXjAibxNosemlRauz2j+ZSGtjqn53q4pUcpbKBAx0ZgLw7xd1TOIbw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/dDpY96KDdNe6zOpIlF31PcIsrEYU//aiASmBk4hPlGgFpHl6m
	caX+BU/Q/HLKxMJpbjB3MMe2fko3XZfbZvGwQkmfaCAQb6BgWhvL73KJD2am0lxydM8X3xDd+zX
	i7P0wUfoN7ZogoEyRn7CAO31UrS36Uryq4U7vLdsnkXztSdJb/smg
X-Gm-Gg: AZFdTZf3dawJMzt70120TkeDvHQNG9l/5h9LMZJKx4rxzWPF0c3KH6V4R/zE2GKGOHe
	jjWRbQWFhDsrzj4f9ymgAyplPEzD81mJpDzJ23OHL0B6HJq2vsdfaSndPu8tNBPgxcPrWwGPmma
	lowqeOa9gx8hiZQMDRZoK3o1Fj2G/PrpzeM8ZRSUPGWmNCn5MSxl6IzKzm5YkdJ34VNKVbRb9hd
	fDNSSL4SggYsW5Bkx5K5hnJcwQ1IRrnVDS05dkX5KDWiAinlKke5GFOF8CXAjxN7NL+GhHVBntS
	FAwvrDj429Bw5cG0HtCkE+RhIr5ttWj7Ra5SxzHWSgAx0HfapmU+U9Zs20MlyJbze/O1IXfs0ur
	TB6l0jWGsCXyoZHPFEcvsdZ5BRtI=
X-Received: by 2002:a05:620a:6607:b0:949:3c50:134 with SMTP id af79cd13be357-949ba9a178amr1410279285a.33.1795352971591;
        Sun, 22 Nov 2026 05:09:31 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb3a8486sm45588885a.14.2026.11.22.05.09.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 05:09:31 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Willem de Bruijn <willemb@google.com>,
	Piyus Kedia <piyus@iiitd.ac.in>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrii Tereshchenko <opensource@andrii.net>,
	stable@vger.kernel.org
Subject: [PATCH ipsec v2] xfrm: iptfs: make room before copying a continuation in reassembly
Date: Sun, 22 Nov 2026 05:09:25 -0800
Message-ID: <e417c7f2-eaee-4fb0-b365-65cd521efd6b@mid.andrii.net>
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

When iptfs_reassem_cont() cannot share a continuation as page frags, it
linearizes the in-progress skb and copies the data in with skb_put(),
without checking the tailroom. An skb started by iptfs_pskb_add_frags()
has little room after linearizing, so a larger continuation panics the
kernel in softirq:

  skbuff: skb_over_panic: ... len:2884 put:1442 ... end:0x6c0 dev:eth1
  kernel BUG at net/core/skbuff.c:215!
  Call Trace:
   <IRQ>
   skb_put.cold+0x1f/0x1f
   iptfs_reassem_cont+0x242/0x760
   iptfs_input_ordered+0x382/0x3e0
   iptfs_input+0x24d/0x630
   xfrm_input+0x12a5/0x29f0

After linearizing, grow the head if the rest of the inner packet does
not fit, and abandon the reassembly if that fails.

Made with an AI coding assistant, reviewed by the submitter.

Fixes: 5f2b6a909574 ("xfrm: iptfs: add skb-fragment sharing code")
Fixes: 0b352f83cabf ("xfrm: iptfs: fix skb_put() panic on non-linear skb during reassembly")
Reported-by: Piyus Kedia <piyus@iiitd.ac.in>
Closes: https://lore.kernel.org/all/20261119142308.3272570-1-piyus@iiitd.ac.in/
Link: https://lore.kernel.org/all/20260908224855.1591147-1-kuba@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
v2:
- skb_linearize() first, then pskb_expand_head() only if the tailroom is
  still short, as Fernando Fernandez Mancera suggested. Regular traffic
  never took the second allocation in my tests.
- shorter changelog.
v1: https://lore.kernel.org/all/70d0cc8d-e2ff-4293-a416-eaf2705a0b9c@mid.andrii.net/

The netdev AI review of the runt fix flagged this copy (Link:). Piyus
Kedia's patch for the same overrun drops the valid inner packet; this
one delivers it.

Tested on v7.4-rc3 and ipsec master: the panic reproduces without fault
injection and is gone with this patch, failslab on either allocation
only drops the packet, and W=1 and sparse are clean. The selftest is
with the IPsec maintainers, as security-bugs.rst asks.

 net/xfrm/xfrm_iptfs.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 0313a43aa8a97..e9b4d23468022 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -909,7 +909,15 @@ static u32 iptfs_reassem_cont(struct xfrm_iptfs_data *xtfs, u64 seq,
 	    iptfs_skb_can_add_frags(newskb, fragwalk, data, copylen)) {
 		iptfs_skb_add_frags(newskb, fragwalk, data, copylen);
 	} else {
-		if (skb_linearize(newskb)) {
+		/* A newskb started by iptfs_pskb_add_frags() has little
+		 * tailroom after linearizing. Make room for the rest of
+		 * the inner packet before copying.
+		 */
+		if (skb_linearize(newskb) ||
+		    (skb_tailroom(newskb) < ipremain &&
+		     pskb_expand_head(newskb, 0,
+				      ipremain - skb_tailroom(newskb),
+				      GFP_ATOMIC | __GFP_NOWARN))) {
 			XFRM_INC_STATS(xs_net(xtfs->x),
 				       LINUX_MIB_XFRMINBUFFERERROR);
 			goto abandon;

base-commit: f0e68014f4ac1653b2980ab76744f4dfdffdbac5
-- 
2.53.0

