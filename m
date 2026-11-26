Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686701;
	b=M4jIta4zZ52Kg/quL1tAboU4umuR3LbgVI5ObPW1QFmkgclPuKzjgvhgzSEp/rNYeuKS
	 OmjUtmA/ZNBMHojUAmIq5m/QM/Fchq7iLdCzDsMzUhklCorv3pRgygbIO6s2nM4ZJCc4D
	 31MyejvLz7Ql00bNJ3S7PYModj6S0FDpa1JsBccRGuWx3jJDDeb4qUnq0P3pqzFSYOrvf
	 dkSpBDoSojdG9Zc86mjkjfmXIMUlS1dPDB+VDKpdeKykB9NhAPnMCgd8689AVovWo4y7T
	 Xr/C7cuHskIkuSSOvVPWOzhXyu/JJaQNXl3P1nFjQnCHlEs+uv79BxC5nqdCtTrjy9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686701;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
	b=EDIezH6AZsQn/peTx+tvqa4OJ1eYBYCNgQj0hbIglV0OKy14bQ13U9jDL4QKGAmTKVfL
	 b2+eT7ZGYQmQm5V8OEE+1buMLag+nUlzcVhMdzUuDIdONj8PYNcarKWYJxIMNaW9rXq/h
	 q9i/PGV5JKRGzY7HYnYRGJO153RHjvRRTJ5h/XkNhX6+TNFiL1EZVhpBYSm+o+haceK4P
	 8ZNh/VHzX6BfJarXpbNYVX6CVER4n/A0XV6cSJeba2tkqiGTOS5+L6tuW28m7W8cBszEB
	 uMvvip0PCQJDIooOpsdj7oR7S93Yu0YFCsjt3nck70syz1SrMM++3gz1Blznng6WKiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NglhJyuj;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53639606A31C
	for <ipsec@lists.linux.dev>; Thu, 26 Nov 2026 09:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53639606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NglhJyuj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795686700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
	b=NglhJyujZidG1wh9KnE18o4xefEtv14FMcA8ak08V8XoQBmG1b/fEVGJVd93CrD2oKQcEL
	BfK9jY60wQ/5xihueEr7sr0WBEX6qLW+zwl6kFe7MB78aGE4j3q+XqVaOHzFE/VuEvQPPk
	1W1N1J9zC+JGOaMEj4ahFxjpNHuJLP4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-VLrJynv7OXiVuw3-wL20UQ-1; Thu, 26 Nov 2026 09:51:38 +0000
X-MC-Unique: VLrJynv7OXiVuw3-wL20UQ-1
X-Mimecast-MFC-AGG-ID: VLrJynv7OXiVuw3-wL20UQ_1795686697
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4bbc86e1eb0so709099f8f.0
        for <ipsec@lists.linux.dev>; Thu, 26 Nov 2026 01:51:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686697; x=1796291497;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
        b=aG6M4q+zU/EFkdKONzgn251DbeWyvnhNVM4aYOG8o6FaNlRMefIW3+Lgg/TgFPI5gT
         FhEsz/pvpzIOqk6QPfz/d+TothWKx6dglbkij6wxh4rgyDRS0U4KunbWWC/XMGROglkJ
         Pi4eO/teZrneaXg6uX/+mVlI9pjQh7fVbgN6BpbGZC9WU/CN2twAgwhytWq2yAXRdHnG
         KauItIXnRxHJmkES3Ct7Hi9/65Vr1ahLJgWo3SeI9YtOouTcHdRN94lGqGT0O6uroH7L
         9/RgrS4YyVaIVMXkkCeEttOjwqPXshP4eQiHDtEv7sSyVVfyoRxKYUzy3h78SBYjSLQK
         as4g==
X-Forwarded-Encrypted: i=1; AL+hErH219yJdSGV2GXF3od3hkDQx58yFTkvfC78cxY8BmV973Gw7CPZFsfAyrFqfmG/eD0JWQNzuA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8PXh66AuiY8PTkyOJtybDSu7ynNo74CS1s58BeW0/uXIiiL24L
	bBPLkt1DmG1YvbqfLJoERj/zKDKR4yuJwFoqEMMLGK2wWB0oZ37cYAzWxF2YJLRrhgvro3TeD0J
	9JKo8ZxglxCZYUC1IgG29x6GBeNuKudfAMXZzi+Jba3z5mWrelK1P0V+q
X-Gm-Gg: AZFdTZcv9QIp7xqTxjvyYrc/bPeddxn+GpoAz2TSCLK1Ze0Oy6R1jLd8lxesPvfkl1O
	W/GEUR41zOuemAzEybzW5+ouQstdgRcBRkFqx05Wm7VMJMYol/VfXjC7mRcw/xlaJ0CKLOhz5q2
	tciohax+2BV9qP+5DxLnuypbab2vhMbFFxoL+eHX1dMAs7QnsbtWV3MGfa3bvLZwkiil5K1CjxO
	zsTr7fSJnoWyvaLbd2ckX0bExcdVjMXT9dSLprz0tzc7JvsxL1BtMEqJmTWIc7TJL7Rv4zMpQ7R
	NsYLnEQo4ic3lVLQjbm2IdiUcuz7XE3oi0Si2wsUWy6mMcJea7V1S01BDIkAyk+5VTp5zTSuHZH
	9O7sp5m2/GlFVjumHkus1abexxu0D55lhho5PGf2nbspSd9jU3NNRJActmHfFehR0x/PTMXTCuH
	pyL4GiXtSu7Bo8zs5K/KUJzp9ECyCjluiXTOL9iY2onX+s
X-Received: by 2002:a05:6000:2c13:b0:4a6:9f2f:4153 with SMTP id ffacd0b85a97d-4abaac57ba9mr38614724f8f.1.1795686697247;
        Thu, 26 Nov 2026 01:51:37 -0800 (PST)
X-Received: by 2002:a05:6000:2c13:b0:4a6:9f2f:4153 with SMTP id ffacd0b85a97d-4abaac57ba9mr38614627f8f.1.1795686696684;
        Thu, 26 Nov 2026 01:51:36 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm39627871f8f.52.2026.11.26.01.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:51:36 -0800 (PST)
Message-ID: <e07adc3e-838a-4c46-a56c-eb47bb9e77f4@redhat.com>
Date: Thu, 26 Nov 2026 10:51:34 +0100
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
Subject: Re: [PATCH net v3 2/2] selftests: net: check TCP IP IDs across
 tunnels after GRO and GSO
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
 <2f75527eb49d7d4ffec32a61fd7dd080673dc57f.1795284858.git.julius@bairaktaris.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <2f75527eb49d7d4ffec32a61fd7dd080673dc57f.1795284858.git.julius@bairaktaris.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fKrYJYl10HTJpM4RJmolIoX5if8DWpYaxgxhpRtj8KM_1795686697
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 19:27, Julius Bairaktaris wrote:
> Send TCP segments with fixed or incrementing IPv4 IDs from a packet
> socket, let GRO on a veth merge them, forward the merged packets into
> IPIP, GRE and VXLAN tunnels over IPv4 and IPv6 and into ESP tunnel and
> transport mode SAs offloaded to netdevsim, with segmentation done in
> software, and check that the IDs of the IPv4 header in front of TCP come
> out as they went in and the IDs of a new outer IPv4 header are unique,
> or for ESP tunnel mode increment within each packet. Also forward a
> VXLAN stream with one header's IDs fixed after decapsulation into IPIP,
> and send the merged packets through a tunnel that the far end
> decapsulates without segmenting them before it forwards them.
> 
> A test where GRO merged nothing is skipped.
> 
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
This test is very unstable:

https://netdev.bots.linux.dev/flakes.html?tn-needle=tcp-fixed

/P

