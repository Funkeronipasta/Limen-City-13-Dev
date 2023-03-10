/**
 * The icon_state for space.
 * There is 25 total icon states that vary based on the x/y/z position of the turf.
 */
#define SPACE_ICON_STATE(x, y, z) "[((x + y) ^ ~(x * y) + z) % 25]"
