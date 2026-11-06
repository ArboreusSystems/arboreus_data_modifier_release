/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 22/09/2025 at 15:07:38
 * */// --------------------------------------------------------------

// Class headers
#include <dmcore.h>

// Class private headers
#include <dmcore_private.h>

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

DMCore::DMCore(QObject* parent) : AThreadTemplate<DMCoreService>(new DMCoreService,parent) {

	this->setPriority(LowPriority);

	QObject::connect(
		this,&DMCore::sgInit,
		this->mService(),&DMCoreService::slInit
	);
	QObject::connect(
		this->mService(),&DMCoreService::sgInitiated,
		this,&DMCore::slInitiated
	);

	_A_DEBUG << "AModifier created";
}


// -----------
/*!
	\fn

	Doc.
*/

DMCore::~DMCore(void) {

	_A_DEBUG << "AModifier deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCore::mInit(void) {

	emit this->sgInit();
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap DMCore::mIsPasswordDefined(void) {

	AThreadObjectControllerTemplate oController;
	QEventLoop oEventLoop;

	DMCoreAgentIsPasswordDefined oAgent;
	oAgent.pService = this->mService();
	QObject::connect(
		&oAgent,&DMCoreAgentIsPasswordDefined::sgFinished,
		&oEventLoop,&QEventLoop::quit
	);
	QObject::connect(
		&oController,&AThreadObjectControllerTemplate::sgRun,
		&oAgent,&DMCoreAgentIsPasswordDefined::slRun
	);
	oAgent.moveToThread(this);

	emit oController.sgRun();
	oEventLoop.exec();

	return oAgent.pOutput.mToVariantMap();
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap DMCore::mPasswordSet(const QJSValue& inPassword) {

	if (!inPassword.isString()) return QVariantMap();

	QString oLocalPassword = inPassword.toString();
	if (oLocalPassword.isEmpty()) return QVariantMap();

	QVariantMap oResult = mPasswordSetHandler(oLocalPassword);

	if (!oLocalPassword.isEmpty()) {
		QChar* pData = oLocalPassword.data();
		for (int i = 0; i < oLocalPassword.length(); ++i) {
			pData[i] = QChar(0);
		}
		oLocalPassword.clear();
		oLocalPassword.squeeze();
	}

	return oResult;
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap DMCore::mPasswordSetHandler(QString& inPassword) {

	AThreadObjectControllerTemplate oController;
	QEventLoop oEventLoop;

	DMCoreAgentPasswordSet oAgent;
	oAgent.pPassword = inPassword;
	oAgent.pService = this->mService();
	QObject::connect(
		&oAgent,&DMCoreAgentPasswordSet::sgFinished,
		&oEventLoop,&QEventLoop::quit
	);
	QObject::connect(
		&oController,&AThreadObjectControllerTemplate::sgRun,
		&oAgent,&DMCoreAgentPasswordSet::slRun
	);
	oAgent.moveToThread(this);

	emit oController.sgRun();
	oEventLoop.exec();

	QVariantMap oOutputMap = oAgent.pOutput.mToVariantMap();

	if (oOutputMap.contains("pValue")) {

		QVariant oValue = oOutputMap.value("pValue");

		if (oValue.canConvert<QString>()) {
			QString oStr = oValue.toString();
			oStr.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oStr));
		} else if (oValue.canConvert<QByteArray>()) {
			QByteArray oBytes = oValue.toByteArray();
			oBytes.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oBytes));
		} else if (oValue.canConvert<QVariantMap>()) {
			QVariantMap oNestedMap = oValue.toMap();
			oNestedMap.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oNestedMap));
		} else if (oValue.canConvert<QVariantList>()) {
			QVariantList oNestedList = oValue.toList();
			oNestedList.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oNestedList));
		}
	}

	if (!oAgent.pPassword.isEmpty()) {
		QChar* pAgentData = oAgent.pPassword.data();
		for (int i = 0; i < oAgent.pPassword.length(); ++i) {
			pAgentData[i] = QChar(0);
		}
		oAgent.pPassword.clear();
		oAgent.pPassword.squeeze();
	}

	QChar* pCallerData = inPassword.data();
	for (int i = 0; i < inPassword.length(); ++i) {
		pCallerData[i] = QChar(0);
	}
	inPassword.clear();
	inPassword.squeeze();

	return oOutputMap;
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap DMCore::mPasswordGet(void) {

	AThreadObjectControllerTemplate oController;
	QEventLoop oEventLoop;

	DMCoreAgentPasswordGet oAgent;
	oAgent.pService = this->mService();
	QObject::connect(
		&oAgent,&DMCoreAgentPasswordGet::sgFinished,
		&oEventLoop,&QEventLoop::quit
	);
	QObject::connect(
		&oController,&AThreadObjectControllerTemplate::sgRun,
		&oAgent,&DMCoreAgentPasswordGet::slRun
	);
	oAgent.moveToThread(this);

	emit oController.sgRun();
	oEventLoop.exec();

	QVariantMap oOutputMap = oAgent.pOutput.mToVariantMap();

	if (oOutputMap.contains("pValue")) {

		QVariant oValue = oOutputMap.value("pValue");

		if (oValue.canConvert<QString>()) {
			QString oStr = oValue.toString();
			oStr.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oStr));
		} else if (oValue.canConvert<QByteArray>()) {
			QByteArray oBytes = oValue.toByteArray();
			oBytes.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oBytes));
		} else if (oValue.canConvert<QVariantMap>()) {
			QVariantMap oNestedMap = oValue.toMap();
			oNestedMap.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oNestedMap));
		} else if (oValue.canConvert<QVariantList>()) {
			QVariantList oNestedList = oValue.toList();
			oNestedList.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oNestedList));
		}
	}

	return oOutputMap;
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap DMCore::mPasswordDelete(void) {

	AThreadObjectControllerTemplate oController;
	QEventLoop oEventLoop;

	DMCoreAgentPasswordDelete oAgent;
	oAgent.pService = this->mService();
	QObject::connect(
		&oAgent,&DMCoreAgentPasswordDelete::sgFinished,
		&oEventLoop,&QEventLoop::quit
	);
	QObject::connect(
		&oController,&AThreadObjectControllerTemplate::sgRun,
		&oAgent,&DMCoreAgentPasswordDelete::slRun
	);
	oAgent.moveToThread(this);

	emit oController.sgRun();
	oEventLoop.exec();

	return oAgent.pOutput.mToVariantMap();
}



// -----------
/*!
	\fn

	Doc.
*/

QVariantMap DMCore::mEncodeString(const QJSValue& inString) {

	if (!inString.isString()) return QVariantMap();

	QString oLocalString = inString.toString();
	if (oLocalString.isEmpty()) return QVariantMap();

	QVariantMap oResult = mEncodeStringHandler(oLocalString);

	if (!oLocalString.isEmpty()) {
		QChar* pData = oLocalString.data();
		for (int i = 0; i < oLocalString.length(); ++i) {
			pData[i] = QChar(0);
		}
		oLocalString.clear();
		oLocalString.squeeze();
	}

	return oResult;
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap DMCore::mEncodeStringHandler(QString& inString) {

	AThreadObjectControllerTemplate oController;
	QEventLoop oEventLoop;

	DMCoreAgentEncodeString oAgent;
	oAgent.pString = inString;
	oAgent.pService = this->mService();
	QObject::connect(
		&oAgent,&DMCoreAgentEncodeString::sgFinished,
		&oEventLoop,&QEventLoop::quit
	);
	QObject::connect(
		&oController,&AThreadObjectControllerTemplate::sgRun,
		&oAgent,&DMCoreAgentEncodeString::slRun
	);
	oAgent.moveToThread(this);

	emit oController.sgRun();
	oEventLoop.exec();

	QVariantMap oOutputMap = oAgent.pOutput.mToVariantMap();

	if (oOutputMap.contains("pValue")) {

		QVariant oValue = oOutputMap.value("pValue");

		if (oValue.canConvert<QString>()) {
			QString oStr = oValue.toString();
			oStr.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oStr));
		} else if (oValue.canConvert<QByteArray>()) {
			QByteArray oBytes = oValue.toByteArray();
			oBytes.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oBytes));
		} else if (oValue.canConvert<QVariantMap>()) {
			QVariantMap oNestedMap = oValue.toMap();
			oNestedMap.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oNestedMap));
		} else if (oValue.canConvert<QVariantList>()) {
			QVariantList oNestedList = oValue.toList();
			oNestedList.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oNestedList));
		}
	}

	if (!oAgent.pString.isEmpty()) {
		QChar* pAgentData = oAgent.pString.data();
		for (int i = 0; i < oAgent.pString.length(); ++i) {
			pAgentData[i] = QChar(0);
		}
		oAgent.pString.clear();
		oAgent.pString.squeeze();
	}

	QChar* pCallerData = inString.data();
	for (int i = 0; i < inString.length(); ++i) {
		pCallerData[i] = QChar(0);
	}
	inString.clear();
	inString.squeeze();

	return oOutputMap;
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap DMCore::mDecodeString(const QJSValue& inString) {

	if (!inString.isString()) return QVariantMap();

	QString oLocalString = inString.toString();
	if (oLocalString.isEmpty()) return QVariantMap();

	QVariantMap oResult = mDecodeStringHandler(oLocalString);

	if (!oLocalString.isEmpty()) {
		QChar* pData = oLocalString.data();
		for (int i = 0; i < oLocalString.length(); ++i) {
			pData[i] = QChar(0);
		}
		oLocalString.clear();
		oLocalString.squeeze();
	}

	return oResult;
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap DMCore::mDecodeStringHandler(QString& inString) {

	AThreadObjectControllerTemplate oController;
	QEventLoop oEventLoop;

	DMCoreAgentDecodeString oAgent;
	oAgent.pString = inString;
	oAgent.pService = this->mService();
	QObject::connect(
		&oAgent,&DMCoreAgentDecodeString::sgFinished,
		&oEventLoop,&QEventLoop::quit
	);
	QObject::connect(
		&oController,&AThreadObjectControllerTemplate::sgRun,
		&oAgent,&DMCoreAgentDecodeString::slRun
	);
	oAgent.moveToThread(this);

	emit oController.sgRun();
	oEventLoop.exec();

	QVariantMap oOutputMap = oAgent.pOutput.mToVariantMap();

	if (oOutputMap.contains("pValue")) {

		QVariant oValue = oOutputMap.value("pValue");

		if (oValue.canConvert<QString>()) {
			QString oStr = oValue.toString();
			oStr.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oStr));
		} else if (oValue.canConvert<QByteArray>()) {
			QByteArray oBytes = oValue.toByteArray();
			oBytes.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oBytes));
		} else if (oValue.canConvert<QVariantMap>()) {
			QVariantMap oNestedMap = oValue.toMap();
			oNestedMap.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oNestedMap));
		} else if (oValue.canConvert<QVariantList>()) {
			QVariantList oNestedList = oValue.toList();
			oNestedList.detach();
			oOutputMap.insert("pValue",QVariant::fromValue(oNestedList));
		}
	}

	if (!oAgent.pString.isEmpty()) {
		QChar* pAgentData = oAgent.pString.data();
		for (int i = 0; i < oAgent.pString.length(); ++i) {
			pAgentData[i] = QChar(0);
		}
		oAgent.pString.clear();
		oAgent.pString.squeeze();
	}

	QChar* pCallerData = inString.data();
	for (int i = 0; i < inString.length(); ++i) {
		pCallerData[i] = QChar(0);
	}
	inString.clear();
	inString.squeeze();

	return oOutputMap;
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCore::mClearOutput(QVariantMap inMap) {

	if (!inMap.contains("pValue")) return;

	QVariant oTargetVar = inMap.value("pValue");
	if (!oTargetVar.isValid() || oTargetVar.isNull()) {
		inMap.clear();
		return;
	}

	const int oUserType = oTargetVar.userType();
	if (oUserType == QMetaType::QString) {

		QString oString = oTargetVar.value<QString>();
		if (!oString.isEmpty()) {
			oString.detach();
			QChar* pRawHeapData = oString.data();
			for (int i = 0; i < oString.length(); ++i) pRawHeapData[i] = QChar(0);
			oString.clear();
			oString.squeeze();
		}

	} else if (oUserType == QMetaType::QByteArray) {

		QByteArray oBytes = oTargetVar.value<QByteArray>();
		if (!oBytes.isEmpty()) {
			oBytes.detach();
			char* pRawBytes = oBytes.data();
			for (int i = 0; i < oBytes.size(); ++i) pRawBytes[i] = 0;
			oBytes.clear();
			oBytes.squeeze();
		}

	} else if (oUserType == QMetaType::QVariantMap) {

		QVariantMap oNestedMap = oTargetVar.toMap();
		if (!oNestedMap.isEmpty()) oNestedMap.clear();

	} else if (oUserType == QMetaType::QVariantList) {

		QVariantList oNestedList = oTargetVar.toList();
		if (!oNestedList.isEmpty()) oNestedList.clear();
	}

	oTargetVar = QVariant::fromValue(0);
	oTargetVar = QVariant();

	inMap.clear();
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCore::slInitiated(void) {

	_A_DEBUG << "AModifier initiated";

	emit this->sgInitiated();
}

