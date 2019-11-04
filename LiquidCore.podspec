Pod::Spec.new do |s|
  s.name = "LiquidCore"
  s.version = "0.7.0"
  s.summary = "Provides Node.js virtual machines to run inside iOS apps."
  s.description = <<-DESC
LiquidCore enables Node.js virtual machines to run inside iOS apps. It provides a complete runtime environment, including a virtual file system.
  DESC
  s.homepage = "https://github.com/LiquidPlayer/LiquidCore"
  s.license = {:type => "MIT", :file => "LICENSE.md"}
  s.author = {"Eric Lange" => "eric@flicket.tv"}
  s.platform = :ios, '11.0'
  s.source = {:git => "https://github.com/LiquidPlayer/LiquidCore.git", :tag => "#{s.version}"}
  s.libraries = ['z', 'c++']
  s.prepare_command = <<-CMD
    bash LiquidCore/src/ios/generate_node_javascript.sh
    bash LiquidCore/src/ios/generate_javascript_polyfills.sh
  CMD
  s.default_subspec = 'Core'

  s.subspec 'Core' do |cs|
    cs.dependency 'LiquidCore/uv'
    cs.dependency 'LiquidCore/ares'
    cs.dependency 'LiquidCore/http'
    cs.dependency 'LiquidCore/openssl'
    cs.source_files =
      # v8_platform
      "deps/node-10.15.3/deps/v8/src/libplatform/default-foreground-task-runner.cc",
      "deps/node-10.15.3/deps/v8/src/libplatform/default-platform.cc",
      "deps/node-10.15.3/deps/v8/src/libplatform/default-worker-threads-task-runner.cc",
      "deps/node-10.15.3/deps/v8/src/libplatform/task-queue.cc",
      "deps/node-10.15.3/deps/v8/src/libplatform/tracing/trace-buffer.cc",
      "deps/node-10.15.3/deps/v8/src/libplatform/tracing/trace-config.cc",
      "deps/node-10.15.3/deps/v8/src/libplatform/tracing/trace-object.cc",
      "deps/node-10.15.3/deps/v8/src/libplatform/tracing/trace-writer.cc",
      "deps/node-10.15.3/deps/v8/src/libplatform/tracing/tracing-controller.cc",
      "deps/node-10.15.3/deps/v8/src/libplatform/worker-thread.cc",

      # v8_libbase
      "deps/node-10.15.3/deps/v8/src/base/bits.cc",
      "deps/node-10.15.3/deps/v8/src/base/cpu.cc",
      "deps/node-10.15.3/deps/v8/src/base/debug/stack_trace.cc",
      "deps/node-10.15.3/deps/v8/src/base/division-by-constant.cc",
      "deps/node-10.15.3/deps/v8/src/base/file-utils.cc",
      "deps/node-10.15.3/deps/v8/src/base/functional.cc",
      "deps/node-10.15.3/deps/v8/src/base/ieee754.cc",
      "deps/node-10.15.3/deps/v8/src/base/logging.cc",
      "deps/node-10.15.3/deps/v8/src/base/once.cc",
      "deps/node-10.15.3/deps/v8/src/base/page-allocator.cc",
      "deps/node-10.15.3/deps/v8/src/base/platform/condition-variable.cc",
      "deps/node-10.15.3/deps/v8/src/base/platform/mutex.cc",
      "deps/node-10.15.3/deps/v8/src/base/platform/semaphore.cc",
      "deps/node-10.15.3/deps/v8/src/base/platform/time.cc",
      "deps/node-10.15.3/deps/v8/src/base/sys-info.cc",
      "deps/node-10.15.3/deps/v8/src/base/utils/random-number-generator.cc",
      "deps/node-10.15.3/deps/v8/src/base/debug/stack_trace_posix.cc",
      "deps/node-10.15.3/deps/v8/src/base/platform/platform-macos.cc",
      "deps/node-10.15.3/deps/v8/src/base/platform/platform-posix.cc",
      "deps/node-10.15.3/deps/v8/src/base/platform/platform-posix-time.cc",

      # node_lib
      "deps/node-10.15.3/src/async_wrap.cc",
      "deps/node-10.15.3/src/bootstrapper.cc",
      "deps/node-10.15.3/src/callback_scope.cc",
      "deps/node-10.15.3/src/cares_wrap.cc",
      "deps/node-10.15.3/src/connection_wrap.cc",
      "deps/node-10.15.3/src/connect_wrap.cc",
      "deps/node-10.15.3/src/debug_utils.cc",
      "deps/node-10.15.3/src/env.cc",
      "deps/node-10.15.3/src/exceptions.cc",
      "deps/node-10.15.3/src/fs_event_wrap.cc",
      "deps/node-10.15.3/src/handle_wrap.cc",
      "deps/node-10.15.3/src/heap_utils.cc",
      "deps/node-10.15.3/src/js_stream.cc",
      "deps/node-10.15.3/src/module_wrap.cc",
      "deps/node-10.15.3/src/node_api.cc",
      "deps/node-10.15.3/src/node_buffer.cc",
      "deps/node-10.15.3/src/node_config.cc",
      "deps/node-10.15.3/src/node_constants.cc",
      "deps/node-10.15.3/src/node_contextify.cc",
      "deps/node-10.15.3/src/node_domain.cc",
      "deps/node-10.15.3/src/node_encoding.cc",
      "deps/node-10.15.3/src/node_http2.cc",
      "deps/node-10.15.3/src/node_http_parser.cc",
      "deps/node-10.15.3/src/node_messaging.cc",
      "deps/node-10.15.3/src/node_options.cc",
      "deps/node-10.15.3/src/node_os.cc",
      "deps/node-10.15.3/src/node_platform.cc",
      "deps/node-10.15.3/src/node_perf.cc",
      "deps/node-10.15.3/src/node_postmortem_metadata.cc",
      "deps/node-10.15.3/src/node_process.cc",
      "deps/node-10.15.3/src/node_serdes.cc",
      "deps/node-10.15.3/src/node_trace_events.cc",
      "deps/node-10.15.3/src/node_types.cc",
      "deps/node-10.15.3/src/node_url.cc",
      "deps/node-10.15.3/src/node_util.cc",
      "deps/node-10.15.3/src/node_v8.cc",
      "deps/node-10.15.3/src/node_stat_watcher.cc",
      "deps/node-10.15.3/src/node_watchdog.cc",
      "deps/node-10.15.3/src/node_worker.cc",
      "deps/node-10.15.3/src/node_zlib.cc",
      "deps/node-10.15.3/src/node_i18n.cc",
      "deps/node-10.15.3/src/pipe_wrap.cc",
      "deps/node-10.15.3/src/sharedarraybuffer_metadata.cc",
      "deps/node-10.15.3/src/signal_wrap.cc",
      "deps/node-10.15.3/src/spawn_sync.cc",
      "deps/node-10.15.3/src/string_bytes.cc",
      "deps/node-10.15.3/src/string_decoder.cc",
      "deps/node-10.15.3/src/stream_base.cc",
      "deps/node-10.15.3/src/stream_pipe.cc",
      "deps/node-10.15.3/src/stream_wrap.cc",
      "deps/node-10.15.3/src/tcp_wrap.cc",
      "deps/node-10.15.3/src/timer_wrap.cc",
      "deps/node-10.15.3/src/tracing/agent.cc",
      "deps/node-10.15.3/src/tracing/node_trace_buffer.cc",
      "deps/node-10.15.3/src/tracing/node_trace_writer.cc",
      "deps/node-10.15.3/src/tracing/trace_event.cc",
      "deps/node-10.15.3/src/tracing/traced_value.cc",
      "deps/node-10.15.3/src/tty_wrap.cc",
      "deps/node-10.15.3/src/udp_wrap.cc",
      "deps/node-10.15.3/src/util.cc",
      "deps/node-10.15.3/src/uv.cc",
      "deps/node-10.15.3/src/node_code_cache_stub.cc",
      "deps/node-10.15.3/src/node_crypto.cc",
      "deps/node-10.15.3/src/node_crypto_bio.cc",
      "deps/node-10.15.3/src/node_crypto_clienthello.cc",
      "deps/node-10.15.3/src/tls_wrap.cc",

      # V82JSC
      "LiquidCore/src/ios/V82JSC/**/*.cpp",
      "deps/node-10.15.3/deps/v8/src/assert-scope.cc",

      # generated files
      "LiquidCore/src/ios/gen/*.{c,cc}",

      # LiquidCore node modifications
      "LiquidCore/src/common/*.{cc,c}",
      "LiquidCore/src/ios/node_bridge.cc",

      # API
      "LiquidCore/src/ios/LiquidCore/*.h",
      "LiquidCore/src/ios/API/*.m"

    cs.public_header_files = [ "LiquidCore/src/ios/LiquidCore/*.h" ]
    cs.frameworks = "JavaScriptCore"
    cs.xcconfig = {
      :HEADER_SEARCH_PATHS => [
        "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/v8/include",
        "${PODS_TARGET_SRCROOT}/deps/node-10.15.3/deps/v8",
        "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/v8/src/libplatform",
        "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/v8/src/libplatform/tracing",
        "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/v8/src/base",
        "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/src",
        "$(PODS_TARGET_SRCROOT)/LiquidCore/src/ios",
        "$(PODS_TARGET_SRCROOT)/LiquidCore/src/common",
        "$(PODS_TARGET_SRCROOT)/LiquidCore/src/ios/V82JSC",
        "$(PODS_TARGET_SRCROOT)/deps/utfcpp",
        "$(PODS_TARGET_SRCROOT)/deps/Apple",
        "$(PODS_TARGET_SRCROOT)/deps/JavaScriptCore/private",
      ].join(' '),
      :OTHER_CPLUSPLUSFLAGS => [
        '${inherited}',
        '-D_DARWIN_USE_64_BIT_INODE=1',
        '-D_DARWIN_UNLIMITED_SELECT=1',
        '-DHTTP_PARSER_STRICT=0',
        '-D_LARGEFILE_SOURCE',
        '-D_FILE_OFFSET_BITS=64',
        '-DHAVE_CONFIG_H',
        '-DNODE_PLATFORM=\'"ios"\'',
        '-DNODE_WANT_INTERNALS=1',
        '-DV8_DEPRECATION_WARNINGS=1',
        '-DNODE_OPENSSL_SYSTEM_CERT_PATH=\'""\'',
        '-DHAVE_INSPECTOR=0',
        '-DNODE_SHARED_MODE',
        '-DNODE_USE_V8_PLATFORM=1',
        '-DHAVE_OPENSSL=1',
        '-DHTTP_PARSER_STRICT=0',
        '-D__POSIX__',
        '-D_REENTRANT=1',
        '-D_DARWIN_USE_64_BIT_INODE=1',
        '-D_LARGEFILE_SOURCE',
        '-D_FILE_OFFSET_BITS=64',
        '-DHAVE_CONFIG_H',
        '-D_GLIBCXX_USE_C99_MATH',
        '-DHTTP_MAX_HEADER_SIZE=8192',
        '-DHTTP_PARSER_STRICT=0',
        '-D_U_=',
        '-DBUILDING_NGHTTP2',
        '-DNGHTTP2_STATICLIB',
        '-DV8_GYP_BUILD',
        '-DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0',
        '-D_DARWIN_USE_64_BIT_INODE=1',
        '-DV8_EMBEDDER_STRING="-node.51"',
        '-DENABLE_DISASSEMBLER',
        '-DV8_PROMISE_INTERNAL_FIELD_COUNT=1',
        '-DV8_INTL_SUPPORT',
        '-DV8_CONCURRENT_MARKING',
        '-DDISABLE_UNTRUSTED_CODE_MITIGATIONS',
        '-Wno-inconsistent-missing-override',
        '-Wno-defaulted-function-deleted',
        '-DV8_OS_MACOSX',
        '-DV8_FAST_TLS_SUPPORTED_NOXXX',
        '-DBUILDING_NGHTTP2',
        '-DHAVE_INSPECTOR=0',
        '-DV8_INSPECTOR_USE_STL=1',
        '-DV8_INSPECTOR_USE_OLD_STL=1',
        '-D_GLIBCXX_USE_C99_MATH',
      ].join(' '),
      'OTHER_CPLUSPLUSFLAGS[arch=arm64]'  => '$(inherited) -DV8_TARGET_ARCH_ARM64 -DNODE_ARCH=\"arm64\"',
      'OTHER_CPLUSPLUSFLAGS[arch=armv7]'  => '$(inherited) -DV8_TARGET_ARCH_ARM -DNODE_ARCH=\"armv7a\"',
      'OTHER_CPLUSPLUSFLAGS[arch=x86_64]'  => '$(inherited) -DV8_TARGET_ARCH_X64 -DNODE_ARCH=\"x64\"',
      :CLANG_WARN_COMMA => 'NO',
      :CLANG_WARN_DOCUMENTATION_COMMENTS => 'NO',
      :GCC_WARN_64_TO_32_BIT_CONVERSION => 'NO',
      :GCC_WARN_ABOUT_DEPRECATED_FUNCTIONS => 'NO',
      :GCC_WARN_UNUSED_VARIABLE => 'NO',
      :GCC_WARN_UNINITIALIZED_AUTOS => 'NO',
      :CLANG_WARN_UNREACHABLE_CODE => 'NO',
      :GCC_WARN_TYPECHECK_CALLS_TO_PRINTF => 'NO'
    }
  end

  s.subspec 'uv' do |us|
    us.source_files =
      "deps/node-10.15.3/deps/uv/src/fs-poll.c",
      "deps/node-10.15.3/deps/uv/src/inet.c",
      "deps/node-10.15.3/deps/uv/src/threadpool.c",
      "deps/node-10.15.3/deps/uv/src/timer.c",
      "deps/node-10.15.3/deps/uv/src/uv-data-getter-setters.c",
      "deps/node-10.15.3/deps/uv/src/uv-common.c",
      "deps/node-10.15.3/deps/uv/src/version.c",
      "LiquidCore/src/ios/uv_async.c", # <- hack to deal with name clash
      "deps/node-10.15.3/deps/uv/src/unix/core.c",
      "deps/node-10.15.3/deps/uv/src/unix/dl.c",
      "deps/node-10.15.3/deps/uv/src/unix/fs.c",
      "deps/node-10.15.3/deps/uv/src/unix/getaddrinfo.c",
      "deps/node-10.15.3/deps/uv/src/unix/getnameinfo.c",
      "deps/node-10.15.3/deps/uv/src/unix/loop.c",
      "deps/node-10.15.3/deps/uv/src/unix/loop-watcher.c",
      "deps/node-10.15.3/deps/uv/src/unix/pipe.c",
      "deps/node-10.15.3/deps/uv/src/unix/poll.c",
      "deps/node-10.15.3/deps/uv/src/unix/process.c",
      "deps/node-10.15.3/deps/uv/src/unix/signal.c",
      "deps/node-10.15.3/deps/uv/src/unix/stream.c",
      "deps/node-10.15.3/deps/uv/src/unix/tcp.c",
      "deps/node-10.15.3/deps/uv/src/unix/thread.c",
      "deps/node-10.15.3/deps/uv/src/unix/tty.c",
      "deps/node-10.15.3/deps/uv/src/unix/udp.c",
      "deps/node-10.15.3/deps/uv/src/unix/proctitle.c",
      "deps/node-10.15.3/deps/uv/src/unix/darwin.c",
      "deps/node-10.15.3/deps/uv/src/unix/fsevents.c",
      "deps/node-10.15.3/deps/uv/src/unix/darwin-proctitle.c",
      "deps/node-10.15.3/deps/uv/src/unix/bsd-ifaddrs.c",
      "deps/node-10.15.3/deps/uv/src/unix/kqueue.c"
    us.xcconfig = {
      :HEADER_SEARCH_PATHS => [
          "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/uv/include",
          "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/uv/src",
          "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/uv/src/unix",
      ].join(' '),
      :OTHER_CFLAGS => [
          '-D_DARWIN_USE_64_BIT_INODE=1',
          '-D_DARWIN_UNLIMITED_SELECT=1',
          '-D_LARGEFILE_SOURCE',
          '-D_FILE_OFFSET_BITS=64',
          '-D__POSIX__',
          '-D_REENTRANT=1',
          '-D_GLIBCXX_USE_C99_MATH',
          '-Wno-shorten-64-to-32',
          '-Wno-unreachable-code',
          '-Wno-comma',
      ].join(' '),
    }
  end

  s.subspec 'ares' do |as|
    as.source_files =
      "deps/node-10.15.3/deps/cares/src/ares_cancel.c",
      "deps/node-10.15.3/deps/cares/src/ares__close_sockets.c",
      "deps/node-10.15.3/deps/cares/src/ares_create_query.c",
      "deps/node-10.15.3/deps/cares/src/ares_data.c",
      "deps/node-10.15.3/deps/cares/src/ares_destroy.c",
      "deps/node-10.15.3/deps/cares/src/ares_expand_name.c",
      "deps/node-10.15.3/deps/cares/src/ares_expand_string.c",
      "deps/node-10.15.3/deps/cares/src/ares_fds.c",
      "deps/node-10.15.3/deps/cares/src/ares_free_hostent.c",
      "deps/node-10.15.3/deps/cares/src/ares_free_string.c",
      "deps/node-10.15.3/deps/cares/src/ares_gethostbyaddr.c",
      "deps/node-10.15.3/deps/cares/src/ares_gethostbyname.c",
      "deps/node-10.15.3/deps/cares/src/ares__get_hostent.c",
      "deps/node-10.15.3/deps/cares/src/ares_getnameinfo.c",
      "deps/node-10.15.3/deps/cares/src/ares_getopt.c",
      "deps/node-10.15.3/deps/cares/src/ares_getsock.c",
      "deps/node-10.15.3/deps/cares/src/ares_init.c",
      "deps/node-10.15.3/deps/cares/src/ares_library_init.c",
      "deps/node-10.15.3/deps/cares/src/ares_llist.c",
      "deps/node-10.15.3/deps/cares/src/ares_mkquery.c",
      "deps/node-10.15.3/deps/cares/src/ares_nowarn.c",
      "deps/node-10.15.3/deps/cares/src/ares_options.c",
      "deps/node-10.15.3/deps/cares/src/ares_parse_aaaa_reply.c",
      "deps/node-10.15.3/deps/cares/src/ares_parse_a_reply.c",
      "deps/node-10.15.3/deps/cares/src/ares_parse_mx_reply.c",
      "deps/node-10.15.3/deps/cares/src/ares_parse_naptr_reply.c",
      "deps/node-10.15.3/deps/cares/src/ares_parse_ns_reply.c",
      "deps/node-10.15.3/deps/cares/src/ares_parse_ptr_reply.c",
      "deps/node-10.15.3/deps/cares/src/ares_parse_soa_reply.c",
      "deps/node-10.15.3/deps/cares/src/ares_parse_srv_reply.c",
      "deps/node-10.15.3/deps/cares/src/ares_parse_txt_reply.c",
      "deps/node-10.15.3/deps/cares/src/ares_process.c",
      "deps/node-10.15.3/deps/cares/src/ares_query.c",
      "deps/node-10.15.3/deps/cares/src/ares__read_line.c",
      "deps/node-10.15.3/deps/cares/src/ares_search.c",
      "deps/node-10.15.3/deps/cares/src/ares_send.c",
      "deps/node-10.15.3/deps/cares/src/ares_strcasecmp.c",
      "deps/node-10.15.3/deps/cares/src/ares_strdup.c",
      "deps/node-10.15.3/deps/cares/src/ares_strerror.c",
      "deps/node-10.15.3/deps/cares/src/ares_strsplit.c",
      "deps/node-10.15.3/deps/cares/src/ares_timeout.c",
      "deps/node-10.15.3/deps/cares/src/ares__timeval.c",
      "deps/node-10.15.3/deps/cares/src/ares_version.c",
      "deps/node-10.15.3/deps/cares/src/ares_writev.c",
      "deps/node-10.15.3/deps/cares/src/bitncmp.c",
      "deps/node-10.15.3/deps/cares/src/inet_net_pton.c",
      "deps/node-10.15.3/deps/cares/src/inet_ntop.c",
      "deps/node-10.15.3/deps/cares/include/*.h"
    as.private_header_files = [
      "deps/node-10.15.3/deps/cares/include/*.h"
    ]
    as.xcconfig = {
      :HEADER_SEARCH_PATHS => [
        "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/cares/include",
        "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/cares/config/darwin",
      ].join(' '),
      :OTHER_CFLAGS => [
        '-D_DARWIN_UNLIMITED_SELECT=1',
        '-D__POSIX__',
        '-D_REENTRANT=1',
        '-D_DARWIN_USE_64_BIT_INODE=1',
        '-D_LARGEFILE_SOURCE',
        '-D_FILE_OFFSET_BITS=64',
      ].join(' '),
    }
  end

  s.subspec 'http' do |hs|
    hs.source_files =
      # http_parser
      "deps/node-10.15.3/deps/http_parser/http_parser.c",

      # nghttp2
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_buf.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_callbacks.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_debug.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_frame.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_hd.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_hd_huffman.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_hd_huffman_data.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_helper.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_http.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_map.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_mem.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_npn.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_option.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_outbound_item.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_pq.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_priority_spec.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_queue.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_rcbuf.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_session.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_stream.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_submit.c",
      "deps/node-10.15.3/deps/nghttp2/lib/nghttp2_version.c",
      "deps/node-10.15.3/deps/http_parser/*.h",
      "deps/node-10.15.3/deps/nghttp2/lib/includes/nghttp2/*.h"
    hs.private_header_files = [
      "deps/node-10.15.3/deps/http_parser/*.h",
      "deps/node-10.15.3/deps/nghttp2/lib/includes/nghttp2/*.h",
    ]
    hs.xcconfig = {
      :HEADER_SEARCH_PATHS => [
        "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/nghttp2/lib/includes",
        "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/http_parser",
      ].join(' '),
      :OTHER_CFLAGS => [
        '-D_DARWIN_UNLIMITED_SELECT=1',
        '-D__POSIX__',
        '-D_REENTRANT=1',
        '-D_DARWIN_USE_64_BIT_INODE=1',
        '-D_LARGEFILE_SOURCE',
        '-D_FILE_OFFSET_BITS=64',
        '-DHTTP_MAX_HEADER_SIZE=8192',
        '-DHTTP_PARSER_STRICT=0',
        '-D_U_=',
        '-DBUILDING_NGHTTP2',
        '-DNGHTTP2_STATICLIB',
      ].join(' '),
    }
  end

  s.subspec 'openssl' do |os|
    os.source_files =
      "deps/node-10.15.3/deps/openssl/openssl/ssl/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/ssl/record/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/ssl/statem/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/aes/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/asn1/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/async/arch/async_null.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/async/arch/async_posix.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/async/arch/async_win.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/async/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/bf/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/bio/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/blake2/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/bn/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/buffer/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/camellia/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/cast/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/chacha/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/cmac/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/cms/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_api.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_def.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_err.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_lib.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_mall.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_mod.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_sap.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_ssl.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/conf/conf_lcl.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/cpt_err.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/cryptlib.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/cversion.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/ebcdic.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/ex_data.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/getenv.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/init.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/mem.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/mem_clr.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/mem_dbg.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/mem_sec.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/o_dir.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/o_fips.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/o_fopen.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/o_init.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/o_str.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/o_time.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/threads_none.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/threads_pthread.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/threads_win.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/uid.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/ct/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/des/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/dh/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/dsa/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/dso/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/ec/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/engine/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/err/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/evp/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/hmac/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/idea/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/kdf/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/lhash/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/md4/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/md5/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/mdc2/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/modes/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/objects/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/ocsp/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/pem/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/pkcs12/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/pkcs7/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/poly1305/poly1305.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/rand/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/rc2/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/rc4/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/ripemd/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/rsa/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/seed/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/sha/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/srp/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/stack/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/ts/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/txt_db/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/ui/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/whrlpool/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/x509/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/x509v3/*.c",
      "deps/node-10.15.3/deps/openssl/openssl/engines/e_capi.c",
      "deps/node-10.15.3/deps/openssl/openssl/engines/e_padlock.c"
    os.exclude_files = [
      "deps/node-10.15.3/deps/openssl/openssl/crypto/arm_arch.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/ppc_arch.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/sparc_arch.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/x509v3/v3conf.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/x509v3/v3prin.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/x509v3/tabtest.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/pkcs7/pk7_enc.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/ec/ecp_nistz*.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/aes/aes_x86core.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/bf/bf_cbc.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/des/ncbc_enc.c",
      "deps/node-10.15.3/deps/openssl/openssl/crypto/rc2/tab.c",
    ]
    os.xcconfig = {
      # System Header Search Paths
      :HEADER_SEARCH_PATHS => [
        "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/openssl/openssl/include",
        "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/openssl/openssl/crypto/include",
        "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/openssl/openssl/crypto/modes",
        "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/openssl/openssl",
        "$(PODS_TARGET_SRCROOT)/deps/node-10.15.3/deps/openssl/config/archs/darwin64-x86_64-cc/no-asm/crypto",
      ].join(' '),
      :OTHER_CFLAGS => [
        '-DOPENSSL_NO_HW',
        '-DOPENSSL_NO_ASM',
        '-DDSO_DLFCN',
        '-DHAVE_DLFCN_H',
        '-DOPENSSL_THREADS',
        '-DOPENSSL_NO_DYNAMIC_ENGINE',
        '-DOPENSSL_PIC',
        '-DOPENSSLDIR=\'"/etc/ssl"\'',
        '-DENGINESDIR=\'"/dev/null"\'',
        '-DTERMIOS',
        '-D__POSIX__',
        '-D_REENTRANT=1',
        '-D_DARWIN_USE_64_BIT_INODE=1',
        '-D_LARGEFILE_SOURCE',
        '-D_FILE_OFFSET_BITS=64',
        '-DHAVE_CONFIG_H',
      ].join(' '),
      # Disable warnings
      :GCC_WARN_INHIBIT_ALL_WARNINGS => 'YES'
    }
  end
end
