set -e -x

# for task in dinu-iate dinu-wikt ; do
#     for method in levt levt+const levt+const+nodel ; do
#         for match in exact approx ; do
#             bash decode_levt.sh $task $method $match
#         done
#     done
# done

for task in en-de-full en-de-sub ro-en-full ro-en-sub ; do
    for method in levt levt+const levt+const+nodel ; do
        for match in exact ; do
            bash decode_levt.sh $task $method $match
        done
    done
done


# for task in en-ja-full en-ja-sub ; do
#     for method in levt levt+const levt+const+nodel ; do
#         for match in exact ; do
#             bash decode_levt.sh $task $method $match
#         done
#     done
# done
