Rails.application.config.session_store :cache_store,
                                       cache: ActiveSupport::Cache::RedisCacheStore.new(
                                         url: "redis://redis-master:6379/0",
                                       ),
                                       expire_after: 90.minutes,
                                       key: "_redis_session"