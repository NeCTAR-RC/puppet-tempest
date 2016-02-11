# Class for configuring Tempest messaging settings
#
#  [*service_available*]
#    (Optional) Whether or not Zaqar is expected to be available
#    Defaults to $::os_service_default
#
#  [*max_message_ttl*]
#    (Optional) The maximum ttl for a message
#    Defaults to $::os_service_default
#
#  [*max_messages_per_claim*]
#    (Optional) The maximum number of messages per claim
#    Defaults to $::os_service_default
#
#  [*max_queue_metadata*]
#    (Optional) The maximum metadata size for a queue
#    Defaults to $::os_service_default
#
#  [*catalog_type*]
#    (Optional) Catalog type of the Messaging service.
#    Defaults to $::os_service_default
#
#  [*max_claim_ttl*]
#    (Optional) The maximum ttl for a claim
#    Defaults to $::os_service_default
#
#  [*max_messages_per_page*]
#    (Optional) The maximum number of queue message per page when listing (or)
#    posting messages
#    Defaults to $::os_service_default
#
#  [*max_claim_grace*]
#    (Optional) The maximum grace period for a claim
#    Defaults to $::os_service_default
#
#  [*max_message_size*]
#    (Optional) The maximum size of a message body
#    Defaults to $::os_service_default
#
#  [*max_queues_per_page*]
#    (Optional) The maximum number of queue records per page when listing queues
#    Defaults to $::os_service_default
#
class tempest::settings::messaging (
  $service_available      = $::os_service_default,
  $max_message_ttl        = $::os_service_default,
  $max_messages_per_claim = $::os_service_default,
  $max_queue_metadata     = $::os_service_default,
  $catalog_type           = $::os_service_default,
  $max_claim_ttl          = $::os_service_default,
  $max_messages_per_page  = $::os_service_default,
  $max_claim_grace        = $::os_service_default,
  $max_message_size       = $::os_service_default,
  $max_queues_per_page    = $::os_service_default,
) {

  tempest_config {
    'service_available/zaqar':          value => $service_available;
    'messaging/max_message_ttl':        value => $max_message_ttl;
    'messaging/max_messages_per_claim': value => $max_messages_per_claim;
    'messaging/max_queue_metadata':     value => $max_queue_metadata;
    'messaging/catalog_type':           value => $catalog_type;
    'messaging/max_claim_ttl':          value => $max_claim_ttl;
    'messaging/max_messages_per_page':  value => $max_messages_per_page;
    'messaging/max_claim_grace':        value => $max_claim_grace;
    'messaging/max_message_size':       value => $max_message_size;
    'messaging/max_queues_per_page':    value => $max_queues_per_page;
  }

}
