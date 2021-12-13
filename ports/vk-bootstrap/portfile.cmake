vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO charles-lunarg/vk-bootstrap
	REF 6bf383778bfadb0eb173e6f25a9a39e7e9def1cf
	SHA512
    c0ca4c9417de2c34ad4a6c065a4ee6cc2d2ecfcd239266efe568e35e4d08585480a00f431d86e892e38d97faf51304649a59debe42f81c94cb60c4ce1aae2ce0
    HEAD_REF master
    PATCHES "dont-build-tests-unless-requested.patch" "Fix-Add-VkBootstrapDispatch-to-includable-files.patch"
)

if (VCPKG_TARGET_IS_WINDOWS)
    vcpkg_check_linkage(ONLY_STATIC_LIBRARY)
endif()

vcpkg_configure_cmake(
	SOURCE_PATH "${SOURCE_PATH}"
	PREFER_NINJA
)
vcpkg_install_cmake()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
	INSTALL "${SOURCE_PATH}/LICENSE.txt"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright)