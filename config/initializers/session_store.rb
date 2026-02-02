Rails.application.config.session_store :cache_store,
                                       cache: ActiveSupport::Cache::RedisCacheStore.new(
                                         redis: Redis::Cluster.new(nodes: %w[
                                           redis://redis-cluster-master-1:6379
                                           redis://redis-cluster-master-2:6379
                                           redis://redis-cluster-master-3:6379
                                         ]),
                                         namespace: "my_namespace"
                                       ),
                                       expire_after: 90.minutes,
                                       key: "_redis_cluster_session"