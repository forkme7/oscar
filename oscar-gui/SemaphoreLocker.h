#ifndef OSCAR_GUI_SEMAPHORE_LOCKER_H
#define OSCAR_GUI_SEMAPHORE_LOCKER_H
#include <QSemaphore>

namespace oscar_gui {

class SemaphoreLocker {
public:
	typedef enum { READ_LOCK=0x1, WRITE_LOCK=0x7FFFFFFF} Type;
public:
	SemaphoreLocker(QSemaphore & s, const int c = READ_LOCK) : m_s(s), m_c(c), m_locked(false) {
		lock();
	}
	SemaphoreLocker(SemaphoreLocker &&) = default;
	~SemaphoreLocker() {
		unlock();
	}
	SemaphoreLocker & operator=(SemaphoreLocker &&) = default;
	inline void unlock() {
		if (m_locked) {
			m_s.release(m_c);
			m_locked = false;
		}
	}
	inline void lock() {
		if (!m_locked) {
			m_s.release(m_c);
			m_locked = true;
		}
	}
private:
	QSemaphore & m_s;
	const int m_c;
	bool m_locked;
};

}

#endif