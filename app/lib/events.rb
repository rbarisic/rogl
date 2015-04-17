# # Event-Queue
# module Engine
#     class Events
#         def initialize
#             @events = []
#             @pointer = 0
#         end

#         def <<(other)
#             @events << other
#         end

#         def push_event(event)
#             @events << event
#         end

#         def process_event
#             if @events[@pointer]
#                 @events[@pointer].call
#                 @events.pop(@pointer)
#                 self.next
#             end
#         end

#         def next
#             @pointer += 1
#         end
#     end
# end