Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.216.20.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745131;
	b=wFeGdUYnEmZ2ZXfFriXF52FW0i5REVnf1ASi1HLEj1qlqnAa3OTjH7NVSaSQAC6ITOGy
	 FhX0dgRX3jvWNbuReq8qV2Udo39srZuwpZpTbHBOZuISKHHX3HwaY8LXcEY/YrPtHyD1S
	 BGLUic43eIKLC83q/h2DzrUl6O2TplVAEEisFwKHCJOnSnb4rg1nkuoS2b6mcuESl9j+k
	 mHmxCdh8az/D5bU+E1i6QLSvDnWiUWbCin+KrUmI/D7EIh2oZwuxpf6L2RhMGN+r7QR8s
	 nbKMg73oJBlFn/3AdEun8W/al+/foxoBBJ8M6m7GD+7ZC8NwwWuVZ75maEStw45/XsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745131;
	h=DMARC-Filter:Received-SPF:Received:From:To:Cc:Subject:
	 X-TERRACE-DUMMYSUBJECT:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-TERRACE-SPAMMARK:
	 X-TERRACE-SUPERWHITEIP:X-TERRACE-SID:X-TERRACE-CLASSID;
	bh=/0mhPj01jYciMNIS3v4D8R62f4Kv27ZLnnjl8phcSXY=;
	b=ASFoIS1oU8G8/vy2LcNE1mk7txCNi0Fh/IcWOlofKPL5mRCMn4MsQEnwgcNCHSt6LjKs
	 3wQNxocUO9JxTRxrvAs2NnWtDBTp6ey51790+IdsebsYyhYI1W4SNe/R7294BB88/9Rc9
	 UspI2EaMdsLSpEWb+whxGU4yzYKqLa7EzkjuWQH8N8fb4JDfPZlPzooi1vZcFvA9AjftO
	 lGXebTO6WJ35oGrrNQsIRdRSSqdULjMThWUZygws5YPjIBqXYNy3WG83DyYq+TYB4+Xvs
	 DrNO/Mm7ci0BxTf2ktbzI1O/fchpOpPaII+TulDW+ezrSomT9VoJR2/w6VNyIzLO3FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pribit.com;
	spf=pass smtp.mailfrom=pribit.com;
	arc=none smtp.remote-ip=35.216.20.220
Received: from prod-dose-smtp-3.daouoffice.com (prod-dose-smtp-3.daouoffice.com [35.216.20.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126F8606A321
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 02:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 126F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pribit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pribit.com
Received-SPF: SoftFail 
	client-ip="106.245.249.210" envelope-from="his1415@pribit.com" 
Received: from [106.245.249.210] ([106.245.249.210]) 
          by prod-dose-smtp-3.daouoffice.com ([10.37.10.10]) 
          with ESMTP id 1795745089.365151.140503668266560.prod-dose-smtp-3
          for <>; 
          Fri, 27 Nov 2026 11:04:48 +0900 (KST) 
From: Hong In-su <his1415@pribit.com>
To: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sd@queasysnail.net,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	his1415@pribit.com
Subject: [PATCH ipsec-next v3 2/2] xfrm: add ARIA GCM support
X-TERRACE-DUMMYSUBJECT: Terrace Spam system                                  *
Date: Fri, 27 Nov 2026 02:04:48 +0000
Message-ID: <20261127020448.55891-3-his1415@pribit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127020448.55891-1-his1415@pribit.com>
References: <20261127020448.55891-1-his1415@pribit.com>
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
X-TERRACE-SPAMMARK: NO       (SR:12.67)                     
  (by Terrace)                                                  
X-TERRACE-SUPERWHITEIP: pribit_com_packetgoOS
X-TERRACE-SID: 1795745089.365151.140503668266560.prod-dose-smtp-3
X-TERRACE-CLASSID: Terrace Spam system                                      

The kernel crypto API already supports rfc4106(gcm(aria)), but XFRM
does not have the corresponding algorithm descriptors.

Add XFRM AEAD algorithm descriptors for ARIA GCM with 64-bit, 96-bit
and 128-bit ICV lengths.

Tested with strongSwan using 256-bit ARIA keys and all three
supported ICV lengths.

Signed-off-by: Hong In-su <his1415@pribit.com>
---
 net/xfrm/xfrm_algo.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/net/xfrm/xfrm_algo.c b/net/xfrm/xfrm_algo.c
index 98ef2c48982a..d74f86d4e672 100644
--- a/net/xfrm/xfrm_algo.c
+++ b/net/xfrm/xfrm_algo.c
@@ -82,6 +82,42 @@ static struct xfrm_algo_desc aead_list[] = {
 		.sadb_alg_maxbits = 256
 	}
 },
+{
+	.name = "rfc4106(gcm(aria))",
+
+	.uinfo = {
+		.aead = {
+			.geniv = "seqiv",
+			.icv_truncbits = 64,
+		}
+	},
+
+	.pfkey_supported = 0,
+},
+{
+	.name = "rfc4106(gcm(aria))",
+
+	.uinfo = {
+		.aead = {
+			.geniv = "seqiv",
+			.icv_truncbits = 96,
+		}
+	},
+
+	.pfkey_supported = 0,
+},
+{
+	.name = "rfc4106(gcm(aria))",
+
+	.uinfo = {
+		.aead = {
+			.geniv = "seqiv",
+			.icv_truncbits = 128,
+		}
+	},
+
+	.pfkey_supported = 0,
+},
 {
 	.name = "rfc4309(ccm(aes))",
 
-- 
2.43.0



