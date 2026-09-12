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

QVariantMap DMCore::mPasswordSet(QString inPassword) {

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

	return oAgent.pOutput.mToVariantMap();
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

	return oAgent.pOutput.mToVariantMap();
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

QVariantMap DMCore::mEncodeString(QString inString) {

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

	return oAgent.pOutput.mToVariantMap();
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap DMCore::mDecodeString(QString inString) {

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

	return oAgent.pOutput.mToVariantMap();
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

