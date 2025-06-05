# print("98 34 128")
# 
# for i in range(64, 98):
#     print(i, end=" ")
# print()
# 
# for i in range(0, 32):
#     print(i, 64, "100Gbps 1000ns 0")
# 
# for i in range(32, 64):
#     print(i, 65, "100Gbps 1000ns 0")
# 
# for i in range(66, 98):
#     print(64, i, "100Gbps 1000ns 0")
#     print(65, i, "100Gbps 1000ns 0")

print(32 * 32 * 2)

for i in range(32):
    for j in range(32, 64):
        print(i, j, "3 800000 2.000000000")

for i in range(32, 64):
    for j in range(32):
        print(i, j, "3 800000 2.000000000")
