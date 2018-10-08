#include "src/options/OptionGroups.h"

namespace openmittsu {
	namespace options {
		uint qHash(openmittsu::options::OptionGroups const& key, uint seed) {
			return ::qHash(static_cast<std::size_t>(key), seed);
		}
	}
}
