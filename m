Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686845;
	b=2qFHc3cxoNySvk4r/vs608zg4Any/VsatAnda6lq62kNNFfLjSwesRK7ybN41BhtRnDv
	 3Dxy1iWBY2aWh2cOa5KNEgiCnJdzj7N6saezHKTxaDKuNdvKmG8AgN+Q4fGxLt78S9CCJ
	 BHVOOkvx9YYwiJxTr2rHoNOb9BDsZ2ocBt1xJt/vGZDGOvTyoFcxBhSPKLzfgpkA6RVMb
	 LRlhq3OPyWV4xmy4XvLsvIsfcpceI4ltUT1t9Rxx8DdKmxnzAiPIwOgHVd2OTgtE+iDqG
	 81Q46ayOwVKnVid+chGBiWf0YNT7/8YM7qgHrep/oDLkhFnWIJkXopH2BsNB/pH5bCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686845;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=7CCtYtbFe6le29oXXPU1ooKs9Dx0yxyQEI4GjlG+sf0=;
	b=TVW0K5HVRa64dmBTDj3cWgUeKs3HHLqC01/uarnfLrLEoXs/VaEhiGjKPrplbs0zuuG4
	 Dd3qmwzdIMbnTnvcpgiWJ0NTk9Xr4fcfgeEVHWRp3iffM+RsHTsKDHt4NoR0A+MXOG3Sb
	 MvXNK9Egolks7njSYELVC2GJyVK4JiN0+txztqOhYB6DzRiYVXW1575WCe7/gaED0mVzs
	 TYJ7+c8iBGIevyviM1U+sF5s+S/MtusAFKDUKHUQHFMcV3zVxQ8a0sWQi2biOXHQ4PYYc
	 YrUaxrQngHinm3T5gVKOdGbtChFuiOImh24PLXfU5bCuHNwqr3qFoe3yv6MBtEUgaaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RV9FN4OI;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9472160A261D
	for <ipsec@lists.linux.dev>; Thu, 26 Nov 2026 09:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9472160A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RV9FN4OI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795686843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CCtYtbFe6le29oXXPU1ooKs9Dx0yxyQEI4GjlG+sf0=;
	b=RV9FN4OI/ZTrw+N+1q5AxeSan5a/Mc0XQxKdy92oratGqXcj3yBvhwrtqP9sbY0AfA8van
	+x8uF5Gz43fNFcAlobm83Gd7p/TW29gE7YD5prLbbNFdJ34ZwbqpUzxwPFoykVXz6tMoP6
	kGKAJ1P7Uxh2X4M3Tr+UZQXcMJGfi4Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-hrzKsdtIO56HonNTNiwQHA-1; Thu, 26 Nov 2026 09:54:01 +0000
X-MC-Unique: hrzKsdtIO56HonNTNiwQHA-1
X-Mimecast-MFC-AGG-ID: hrzKsdtIO56HonNTNiwQHA_1795686840
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso34415415e9.3
        for <ipsec@lists.linux.dev>; Thu, 26 Nov 2026 01:54:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686840; x=1796291640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CCtYtbFe6le29oXXPU1ooKs9Dx0yxyQEI4GjlG+sf0=;
        b=RTYbyPfhKlgcmOkT1yXsqZRWZTxkQo7jahLVwRjr0DkNgvpUCsDCEaY5eI2423QriY
         tIFYKrS76EQMyEa/mm8qJcK19DSofBOGgpluR7YJ8tOq9DyDllhXdVZP5dP6chsr8+Jo
         4PhpDK0GzVRq4KwDjwLg9m2x3BfqiG1Z+E9jCJFqxtaDXse1RPMFye/tcvIuPpAkcqQB
         +g9scSpKZes9g03+t/5n6uKiS32EmmmJcBRCDj4s6ybFRXyTfgAgvcfTFBhqEncnTnCU
         P78PpWM2KJ20s4UoZYjx/VSeOV0XJ7FIVntuRH6d8iDAwyW84cQgtmsLTRw1nvq7KMJv
         CaXQ==
X-Forwarded-Encrypted: i=1; AL+hErH5RC68F/X4uRd75SEHJDaeid0HpSiTi8b5mwO1OTAZfsDWw4lKhwEmPHFm4HUXi4z+QELyeA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9M9ZAhjbXneONAkLWw3UFwby7iMsJ91D8qKcAUTS6uSB28VeH8
	bbQ4eeEXMnzB+cJdoO0BckWUjPqQfPx6psdTlVuCI2OWZzKfbeM24OlQQm85zBU7ZHpWq/YFZ9G
	CPrwqR30wlOo4/J3R733U7/+WOxhjE4QKJrGX8MTXAMbgvX/dvAMPthIS
X-Gm-Gg: AZFdTZcENv5IgJIX85EkPdi0OXN65Bn1JHomj1J2Ey2k6+Ukv9HmeAYhIS8OrEf6rJG
	wahOwIycd1Ca9U+cDlRWGSv4NWf+hdaaE0i3+5p4I4Y9mipygFv1Qmjflbv1Z6IsqBMFXih3FcR
	gQKv4zjs/ubIu5h1PUDrOUDjigyBWsWHkMeCSScWS++7Pns6d2rwoeNvcanhkip+YTxCmJRjJXz
	NpCnfAIam+25vMQ3VKZ3v8HkuiYPJMDpJU3WWab+egP325oSE8Js2fIPmwLdIP13hb+/u20o0I5
	F4kCwrbPhFW7JkdSswkuXYemejlO6bipYztfviPuMPRJ8/KfeS8vwQjKPiJpUpF5CRFnvv8qLBG
	1jIEGPfDz06RwwNHh2ZJsrUSxzNiBV5Y/n8pB7/2FIxpuVxAAvYdlrdEmGKXDjkyZDmSKardV4r
	fldyT+5G++xa4P5acyGZZk41s8bXoOK2e6lItOk7wp88gO
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr440507305e9.21.1795686839789;
        Thu, 26 Nov 2026 01:53:59 -0800 (PST)
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr440506695e9.21.1795686839381;
        Thu, 26 Nov 2026 01:53:59 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm41250729f8f.8.2026.11.26.01.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:53:58 -0800 (PST)
Message-ID: <34e77fff-c57b-4ed0-9035-b9682ad3914e@redhat.com>
Date: Thu, 26 Nov 2026 10:53:56 +0100
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 1/2] net: keep the TCP fixed-ID flags on the header
 they describe
To: Julius Bairaktaris <julius@bairaktaris.de>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 willemb@google.com, horms@kernel.org, andrew+netdev@lunn.ch,
 dsahern@kernel.org, idosch@nvidia.com, ncardwell@google.com,
 kuniyu@google.com, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, richardbgobert@gmail.com,
 ecree.xilinx@gmail.com, andy.moreton@amd.com, alex.austin@amd.com,
 linux-net-drivers@amd.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, leon@kernel.org, linux-rdma@vger.kernel.org,
 alexei.starovoitov@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 john.fastabend@gmail.com, sdf@fomichev.me, izaiahsun@gmail.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 shuah@kernel.org, bpf@vger.kernel.org, ipsec@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1795284858.git.julius@bairaktaris.de>
 <7c74b2076dc7dee1d481d39a135e0946d5e04145.1795284858.git.julius@bairaktaris.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <7c74b2076dc7dee1d481d39a135e0946d5e04145.1795284858.git.julius@bairaktaris.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o_WDh_-opITQ1KUxHrw9ZEuUgZ3xzCdzpeJdSuB5FN0_1795686840
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 19:26, Julius Bairaktaris wrote:
> Commit 3271f19bf7b9 ("net: gso: restore ids of outer ip headers
> correctly") made SKB_GSO_TCP_FIXEDID describe the outermost IPv4 header
> and added SKB_GSO_TCP_FIXEDID_INNER for the inner header of an
> encapsulated packet. Every path that adds or removes a header then has to
> move the flags, and none does. A TCP stream that GRO merged with fixed
> IDs and that is forwarded into an IPIP tunnel, or into an ESP tunnel mode
> SA with crypto offload, is segmented with one outer ID for all segments
> and with incrementing inner IDs. A tunnel that decapsulates such a packet
> in iptunnel_pull_offloads() leaves the state of the removed outer header
> on the new outer one, and the inner header of a GRE or UDP tunnel, which
> segmentation reads at encap_level 0, gets the state of the outer header.
> 
> Let SKB_GSO_TCP_FIXEDID describe the innermost IPv4 header again, as it
> did before that commit, and replace SKB_GSO_TCP_FIXEDID_INNER with
> SKB_GSO_TCP_FIXEDID_OUTER for the outermost header of an encapsulated
> packet. Where a header is added in front of a GSO packet, in
> iptunnel_handle_offloads() and in the BPF LWT encapsulation, clear the
> outer flag, so that the new header gets incrementing IDs as it does on a
> packet that was not encapsulated before. Clear it as well where
> iptunnel_pull_offloads() and bpf_skb_net_shrink() remove the outer
> header. ESP transport and BEET mode with crypto offload set
> skb->encapsulation but keep the IPv4 header and its ID, so xfrm_output()
> copies the inner flag to the outer one for them. Convert mlx5 and sfc,
> the two drivers that use the inner flag.
> 
> Two flags cannot describe a header between the outermost and the
> innermost one of a packet with three IPv4 headers: software segmentation
> uses SKB_GSO_TCP_FIXEDID for it, as it used SKB_GSO_TCP_FIXEDID_INNER
> before.
> 
> Fixes: 3271f19bf7b9 ("net: gso: restore ids of outer ip headers correctly")
> Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
This patch is IMHO too invasive for 'net' at this point of the cycle.

I suggest targeting net-next in the next iteration

/P

