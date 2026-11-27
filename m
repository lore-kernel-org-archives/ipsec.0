Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.216.20.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745131;
	b=Zk9SvE2+Uq9mO1LNzcksXnvFaIyAgoy+THV5khbRnrkF/IgVAu4ZGnarOHlH/WUnUkBQ
	 uuTl1Aq23B16KmFkzxqdmdd43lZh6N1X793IUbypF8pMehHUKVrdCKMiL6Zb/GrKM9aMN
	 +HicMK55f3TEQapnK58TRzc0xiVYZ2kAY0JBbdtx2ut3HoYw3Uhtn3Dix8PwMJTRRdeaR
	 XBwTS9HrbT9viuj7Ch41gqliYvP1lfgTiW091ufHgstotRrRy5Sh7Wsa6XaPFgU5aktUB
	 B5ATCAooQXE75Lg8yM+nTPsofW36NP9gs4P1TclKK8anMyZOn2xf5m3WatuRDJqkmgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745131;
	h=DMARC-Filter:Received-SPF:Received:From:To:Cc:Subject:
	 X-TERRACE-DUMMYSUBJECT:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-TERRACE-SPAMMARK:X-TERRACE-SUPERWHITEIP:
	 X-TERRACE-SID:X-TERRACE-CLASSID;
	bh=2EpZrtGEMPK9NWnN0bs8rXBtgCgd9BHgE1mJXOO9qGw=;
	b=ZpCmRy/Y+hhDNIMDcpqEUSfhWm87ALL8Z3YesV54XZ6fWWJGgKId7b3i7ZCrlJX+6ZwU
	 pMOhkJimAJtzhf2vcD73NvAVM/ZBgYUmIsfUKdAJSwHhblKkGwgkd25FB4u+7WMfgHltB
	 Yb76aHzAEZq7K7pgHxoKW4rF+mlm0AH5ot3nUPm7VLO0ro8qXfKl1+H8qy9tiFcp5QhhC
	 Pay8iSKmh0CCKrIhRfXdbeBaWlfAXDwe1s1UH++IlZMlYFw4fmmwNAZuG0k92zPfVZIgU
	 uN7oWNX2+cld70LhOozL/IHEoh7IwbtykLLW0sJcBfRXjA4dkDtD3wAbOSIBU0ct1Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pribit.com;
	spf=pass smtp.mailfrom=pribit.com;
	arc=none smtp.remote-ip=35.216.20.220
Received: from prod-dose-smtp-3.daouoffice.com (prod-dose-smtp-3.daouoffice.com [35.216.20.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1273F606A323
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 02:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1273F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pribit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pribit.com
Received-SPF: SoftFail 
	client-ip="106.245.249.210" envelope-from="his1415@pribit.com" 
Received: from [106.245.249.210] ([106.245.249.210]) 
          by prod-dose-smtp-3.daouoffice.com ([10.37.10.10]) 
          with ESMTP id 1795745088.533197.140503668266560.prod-dose-smtp-3
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
Subject: [PATCH ipsec-next v3 0/2] xfrm: add ARIA algorithm support
X-TERRACE-DUMMYSUBJECT: Terrace Spam system                                  *
Date: Fri, 27 Nov 2026 02:04:46 +0000
Message-ID: <20261127020448.55891-1-his1415@pribit.com>
X-Mailer: git-send-email 2.43.0
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
X-TERRACE-SPAMMARK: NO       (SR:12.27)                     
  (by Terrace)                                                  
X-TERRACE-SUPERWHITEIP: pribit_com_packetgoOS
X-TERRACE-SID: 1795745088.533197.140503668266560.prod-dose-smtp-3
X-TERRACE-CLASSID: Terrace Spam system                                      

The kernel crypto API already provides ARIA implementations, but XFRM
does not have the corresponding algorithm descriptors.

This series adds support for ARIA CBC, RFC3686 CTR and GCM modes in
XFRM, allowing them to be used for ESP.

Following the feedback on v2, the CBC compatibility alias has been
removed. ARIA GCM support has also been added as a separate patch
after completing testing with strongSwan.

CBC and CTR have been tested with strongSwan. GCM has been tested
with 256-bit ARIA keys and all three ICV lengths (64, 96 and 128 bits).

Both patches pass checkpatch with --strict, and xfrm_algo.o builds
successfully against ipsec-next.

Changes in v3:
- Rebase onto ipsec-next.
- Change the patch prefix from net-next to ipsec-next.
- Remove the CBC compatibility alias.
- Add ARIA GCM support as a separate patch.

Changes in v2:
- Remove the CTR compatibility alias.
- Change the CBC default key length to 128 bits.
- Add a comment explaining the 32-bit nonce in the CTR key length.

v2: https://lore.kernel.org/netdev/20260916023135.26043-1-his1415@pribit.com/
v1: https://lore.kernel.org/netdev/20260909054530.7861-1-his1415@pribit.com/

Hong In-su (2):
  xfrm: add ARIA CBC and CTR support
  xfrm: add ARIA GCM support

 net/xfrm/xfrm_algo.c | 62 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)


base-commit: 4d12fa4df5c15cebc587644e84b8f972874e66f1
-- 
2.43.0



