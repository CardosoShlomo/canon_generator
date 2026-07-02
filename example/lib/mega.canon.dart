// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'mega.dart';

// **************************************************************************
// NavGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: invalid_use_of_internal_member
Object? _idOf(Enum s) =>
    _Screens.graph.stack.lastWhere((e) => e.screen == s).id;
bool _chainIs(List<Enum> a, List<Enum> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

final class Screen<I> {
  const Screen._(this._spec);
  final Enum _spec;

  /// This screen's name, as written in the grammar enum — the
  /// readable identity of a stack entry (`Screen.stack.current.name`).
  String get name => _spec.name;
  static const splash = Screen<Never>._(_Screens.splash);
  static const signIn = Screen<Never>._(_Screens.signIn);
  static const signUp = Screen<Never>._(_Screens.signUp);
  static const onboarding = Screen<Never>._(_Screens.onboarding);
  static const forgotPassword = Screen<Never>._(_Screens.forgotPassword);
  static const resetPassword = Screen<String>._(_Screens.resetPassword);
  static const verifyEmail = Screen<Never>._(_Screens.verifyEmail);
  static const twoFactor = Screen<Never>._(_Screens.twoFactor);
  static const home = Screen<Never>._(_Screens.home);
  static const feed = Screen<Never>._(_Screens.feed);
  static const composePost = Screen<Never>._(_Screens.composePost);
  static const story = Screen<String>._(_Screens.story);
  static const post = Screen<String>._(_Screens.post);
  static const comment = Screen<String>._(_Screens.comment);
  static const postAuthor = Screen<String>._(_Screens.postAuthor);
  static const postComments = Screen<String>._(_Screens.postComments);
  static const postLikes = Screen<String>._(_Screens.postLikes);
  static const editPost = Screen<String>._(_Screens.editPost);
  static const repost = Screen<String>._(_Screens.repost);
  static const discover = Screen<Never>._(_Screens.discover);
  static const trending = Screen<Never>._(_Screens.trending);
  static const topics = Screen<Never>._(_Screens.topics);
  static const topic = Screen<String>._(_Screens.topic);
  static const subtopic = Screen<String>._(_Screens.subtopic);
  static const hashtag = Screen<String>._(_Screens.hashtag);
  static const liveNow = Screen<Never>._(_Screens.liveNow);
  static const liveRoom = Screen<String>._(_Screens.liveRoom);
  static const nearby = Screen<Never>._(_Screens.nearby);
  static const marketplace = Screen<Never>._(_Screens.marketplace);
  static const categories = Screen<Never>._(_Screens.categories);
  static const category = Screen<String>._(_Screens.category);
  static const listing = Screen<String>._(_Screens.listing);
  static const listingVariant = Screen<String>._(_Screens.listingVariant);
  static const editListing = Screen<String>._(_Screens.editListing);
  static const sellerProfile = Screen<String>._(_Screens.sellerProfile);
  static const cart = Screen<Never>._(_Screens.cart);
  static const checkout = Screen<String>._(_Screens.checkout);
  static const orderConfirmation = Screen<String>._(_Screens.orderConfirmation);
  static const myOrders = Screen<Never>._(_Screens.myOrders);
  static const order = Screen<String>._(_Screens.order);
  static const wishlist = Screen<Never>._(_Screens.wishlist);
  static const messages = Screen<Never>._(_Screens.messages);
  static const chats = Screen<Never>._(_Screens.chats);
  static const chat = Screen<String>._(_Screens.chat);
  static const thread = Screen<String>._(_Screens.thread);
  static const message = Screen<String>._(_Screens.message);
  static const messageReply = Screen<String>._(_Screens.messageReply);
  static const voiceCall = Screen<String>._(_Screens.voiceCall);
  static const newChat = Screen<Never>._(_Screens.newChat);
  static const groupChat = Screen<String>._(_Screens.groupChat);
  static const groupInfo = Screen<String>._(_Screens.groupInfo);
  static const wallet = Screen<Never>._(_Screens.wallet);
  static const balance = Screen<Never>._(_Screens.balance);
  static const accounts = Screen<Never>._(_Screens.accounts);
  static const account = Screen<String>._(_Screens.account);
  static const transactions = Screen<Never>._(_Screens.transactions);
  static const transaction = Screen<String>._(_Screens.transaction);
  static const transactionItem = Screen<String>._(_Screens.transactionItem);
  static const sendMoney = Screen<Never>._(_Screens.sendMoney);
  static const receiveMoney = Screen<Never>._(_Screens.receiveMoney);
  static const paymentMethods = Screen<Never>._(_Screens.paymentMethods);
  static const addCard = Screen<Never>._(_Screens.addCard);
  static const card = Screen<String>._(_Screens.card);
  static const statements = Screen<Never>._(_Screens.statements);
  static const statement = Screen<String>._(_Screens.statement);
  static const profile = Screen<Never>._(_Screens.profile);
  static const userProfile = Screen<String>._(_Screens.userProfile);
  static const followers = Screen<String>._(_Screens.followers);
  static const following = Screen<String>._(_Screens.following);
  static const connection = Screen<String>._(_Screens.connection);
  static const mutualConnections = Screen<Never>._(_Screens.mutualConnections);
  static const editProfile = Screen<Never>._(_Screens.editProfile);
  static const achievements = Screen<Never>._(_Screens.achievements);
  static const badges = Screen<Never>._(_Screens.badges);
  static const badge = Screen<String>._(_Screens.badge);
  static const savedPosts = Screen<Never>._(_Screens.savedPosts);
  static const drafts = Screen<Never>._(_Screens.drafts);
  static const myListings = Screen<Never>._(_Screens.myListings);
  static const notifications = Screen<Never>._(_Screens.notifications);
  static const notificationSettings = Screen<Never>._(
    _Screens.notificationSettings,
  );
  static const search = Screen<Never>._(_Screens.search);
  static const searchResults = Screen<Never>._(_Screens.searchResults);
  static const settings = Screen<Never>._(_Screens.settings);
  static const accountSettings = Screen<Never>._(_Screens.accountSettings);
  static const security = Screen<Never>._(_Screens.security);
  static const twoFactorSettings = Screen<Never>._(_Screens.twoFactorSettings);
  static const privacy = Screen<Never>._(_Screens.privacy);
  static const appearance = Screen<Never>._(_Screens.appearance);
  static const language = Screen<Never>._(_Screens.language);
  static const connectedApps = Screen<Never>._(_Screens.connectedApps);
  static const about = Screen<Never>._(_Screens.about);
  static const help = Screen<Never>._(_Screens.help);
  static const helpCategory = Screen<String>._(_Screens.helpCategory);
  static const faq = Screen<Never>._(_Screens.faq);
  static const faqArticle = Screen<String>._(_Screens.faqArticle);
  static const feedback = Screen<Never>._(_Screens.feedback);
  static const blockedUsers = Screen<Never>._(_Screens.blockedUsers);
  static const devices = Screen<Never>._(_Screens.devices);
  static const device = Screen<String>._(_Screens.device);
  static const sessions = Screen<Never>._(_Screens.sessions);
  static const session = Screen<String>._(_Screens.session);
  static const dataExport = Screen<Never>._(_Screens.dataExport);
  static const deleteAccount = Screen<Never>._(_Screens.deleteAccount);
  static const workspace = Screen<Never>._(_Screens.workspace);
  static const project = Screen<String>._(_Screens.project);
  static const board = Screen<String>._(_Screens.board);
  static const taskList = Screen<String>._(_Screens.taskList);
  static const task = Screen<String>._(_Screens.task);
  static const subtask = Screen<String>._(_Screens.subtask);
  static const checklistItem = Screen<String>._(_Screens.checklistItem);
  static const editTask = Screen<String>._(_Screens.editTask);
  static const taskComment = Screen<String>._(_Screens.taskComment);
  static const assignee = Screen<String>._(_Screens.assignee);
  static const label = Screen<String>._(_Screens.label);
  static const milestone = Screen<String>._(_Screens.milestone);
  static const sprint = Screen<String>._(_Screens.sprint);
  static const forum = Screen<Never>._(_Screens.forum);
  static const forumCategory = Screen<String>._(_Screens.forumCategory);
  static const forumThread = Screen<String>._(_Screens.forumThread);
  static const forumReply = Screen<String>._(_Screens.forumReply);
  static const reportThread = Screen<String>._(_Screens.reportThread);
  static const learn = Screen<Never>._(_Screens.learn);
  static const course = Screen<String>._(_Screens.course);
  static const courseModule = Screen<String>._(_Screens.courseModule);
  static const lesson = Screen<String>._(_Screens.lesson);
  static const quiz = Screen<String>._(_Screens.quiz);
  static const question = Screen<String>._(_Screens.question);
  static const answer = Screen<String>._(_Screens.answer);
  static const courseReview = Screen<String>._(_Screens.courseReview);
  static const instructor = Screen<String>._(_Screens.instructor);
  static const certificate = Screen<String>._(_Screens.certificate);
  static const shop = Screen<Never>._(_Screens.shop);
  static const shopDept = Screen<String>._(_Screens.shopDept);
  static const shopCategory = Screen<String>._(_Screens.shopCategory);
  static const shopSubcategory = Screen<String>._(_Screens.shopSubcategory);
  static const product = Screen<String>._(_Screens.product);
  static const productVariant = Screen<String>._(_Screens.productVariant);
  static const productReview = Screen<String>._(_Screens.productReview);
  static const brand = Screen<String>._(_Screens.brand);
  static const compareProducts = Screen<Never>._(_Screens.compareProducts);
  static const activity = Screen<Never>._(_Screens.activity);
  static const workout = Screen<String>._(_Screens.workout);
  static const exercise = Screen<String>._(_Screens.exercise);
  static const exerciseSet = Screen<String>._(_Screens.exerciseSet);
  static const deepDemo = Screen<Never>._(_Screens.deepDemo);
  static const levelA = Screen<String>._(_Screens.levelA);
  static const levelB = Screen<String>._(_Screens.levelB);
  static const levelC = Screen<String>._(_Screens.levelC);
  static const levelD = Screen<String>._(_Screens.levelD);
  static const levelE = Screen<String>._(_Screens.levelE);
  static const levelF = Screen<String>._(_Screens.levelF);
  static const integrations = Screen<Never>._(_Screens.integrations);
  static const apiKeys = Screen<Never>._(_Screens.apiKeys);
  static const studio = Screen<Never>._(CreatorStudio.studio);
  static const analytics = Screen<Never>._(CreatorStudio.analytics);
  static const audience = Screen<Never>._(CreatorStudio.audience);
  static const scheduled = Screen<Never>._(CreatorStudio.scheduled);
  static const scheduledPost = Screen<String>._(CreatorStudio.scheduledPost);
  static const editScheduled = Screen<String>._(CreatorStudio.editScheduled);
  static const monetization = Screen<Never>._(CreatorStudio.monetization);
  static const payouts = Screen<Never>._(CreatorStudio.payouts);
  static const events = Screen<Never>._(Events.events);
  static const event = Screen<String>._(Events.event);
  static const attendees = Screen<String>._(Events.attendees);
  static const editEvent = Screen<String>._(Events.editEvent);
  static const createEvent = Screen<Never>._(Events.createEvent);
  static const tickets = Screen<String>._(Events.tickets);
  static const support = Screen<Never>._(Support.support);
  static const supportTickets = Screen<Never>._(Support.supportTickets);
  static const supportTicket = Screen<String>._(Support.supportTicket);
  static const newTicket = Screen<Never>._(Support.newTicket);
  static const knowledgeBase = Screen<Never>._(Support.knowledgeBase);
  static const article = Screen<String>._(Support.article);
  static const admin = Screen<Never>._(Admin.admin);
  static const adminUsers = Screen<Never>._(Admin.adminUsers);
  static const adminUser = Screen<String>._(Admin.adminUser);
  static const adminAuditLog = Screen<Never>._(Admin.adminAuditLog);
  static const adminRole = Screen<String>._(Admin.adminRole);
  static const adminFeatureFlags = Screen<Never>._(Admin.adminFeatureFlags);
  static const webhooks = Screen<Never>._(Admin.webhooks);
  static const webhook = Screen<String>._(Admin.webhook);
  static Screen<Object?> _forSpec(Enum spec) => _bySpec[spec]!;

  /// The [Screen] constant for a grammar row — `pageOf`'s bridge from
  /// `PageCtx.screen` to the typed surface (per-screen meta extensions
  /// switch on the constants).
  static Screen<Object?> from(Enum spec) => _bySpec[spec]!;

  /// The current foreground as a read-only view, reactively — switch
  /// it to render per screen. Null when the current screen has no
  /// view-state. (`Placement.isOn`/`Placement.isCurrent` for raw checks.)
  static AnyView? of(BuildContext context) =>
      _viewOf(Placement.current(context));

  /// Reactive: is the screen THIS context is under the current foreground
  /// top? Rebuilds only when that flips. The self-vs-current gate —
  /// `if (Screen.isCurrentOf(context)) …` to act only while visible.
  static bool isCurrentOf(BuildContext context) =>
      Placement.isCurrent(context, ScreenScope.of(context));
  static const _bySpec = <Enum, Screen<Object?>>{
    BootScreen.root: Screen<Never>._(BootScreen.root),
    _Screens.splash: splash,
    _Screens.signIn: signIn,
    _Screens.signUp: signUp,
    _Screens.onboarding: onboarding,
    _Screens.forgotPassword: forgotPassword,
    _Screens.resetPassword: resetPassword,
    _Screens.verifyEmail: verifyEmail,
    _Screens.twoFactor: twoFactor,
    _Screens.home: home,
    _Screens.feed: feed,
    _Screens.composePost: composePost,
    _Screens.story: story,
    _Screens.post: post,
    _Screens.comment: comment,
    _Screens.postAuthor: postAuthor,
    _Screens.postComments: postComments,
    _Screens.postLikes: postLikes,
    _Screens.editPost: editPost,
    _Screens.repost: repost,
    _Screens.discover: discover,
    _Screens.trending: trending,
    _Screens.topics: topics,
    _Screens.topic: topic,
    _Screens.subtopic: subtopic,
    _Screens.hashtag: hashtag,
    _Screens.liveNow: liveNow,
    _Screens.liveRoom: liveRoom,
    _Screens.nearby: nearby,
    _Screens.marketplace: marketplace,
    _Screens.categories: categories,
    _Screens.category: category,
    _Screens.listing: listing,
    _Screens.listingVariant: listingVariant,
    _Screens.editListing: editListing,
    _Screens.sellerProfile: sellerProfile,
    _Screens.cart: cart,
    _Screens.checkout: checkout,
    _Screens.orderConfirmation: orderConfirmation,
    _Screens.myOrders: myOrders,
    _Screens.order: order,
    _Screens.wishlist: wishlist,
    _Screens.messages: messages,
    _Screens.chats: chats,
    _Screens.chat: chat,
    _Screens.thread: thread,
    _Screens.message: message,
    _Screens.messageReply: messageReply,
    _Screens.voiceCall: voiceCall,
    _Screens.newChat: newChat,
    _Screens.groupChat: groupChat,
    _Screens.groupInfo: groupInfo,
    _Screens.wallet: wallet,
    _Screens.balance: balance,
    _Screens.accounts: accounts,
    _Screens.account: account,
    _Screens.transactions: transactions,
    _Screens.transaction: transaction,
    _Screens.transactionItem: transactionItem,
    _Screens.sendMoney: sendMoney,
    _Screens.receiveMoney: receiveMoney,
    _Screens.paymentMethods: paymentMethods,
    _Screens.addCard: addCard,
    _Screens.card: card,
    _Screens.statements: statements,
    _Screens.statement: statement,
    _Screens.profile: profile,
    _Screens.userProfile: userProfile,
    _Screens.followers: followers,
    _Screens.following: following,
    _Screens.connection: connection,
    _Screens.mutualConnections: mutualConnections,
    _Screens.editProfile: editProfile,
    _Screens.achievements: achievements,
    _Screens.badges: badges,
    _Screens.badge: badge,
    _Screens.savedPosts: savedPosts,
    _Screens.drafts: drafts,
    _Screens.myListings: myListings,
    _Screens.notifications: notifications,
    _Screens.notificationSettings: notificationSettings,
    _Screens.search: search,
    _Screens.searchResults: searchResults,
    _Screens.settings: settings,
    _Screens.accountSettings: accountSettings,
    _Screens.security: security,
    _Screens.twoFactorSettings: twoFactorSettings,
    _Screens.privacy: privacy,
    _Screens.appearance: appearance,
    _Screens.language: language,
    _Screens.connectedApps: connectedApps,
    _Screens.about: about,
    _Screens.help: help,
    _Screens.helpCategory: helpCategory,
    _Screens.faq: faq,
    _Screens.faqArticle: faqArticle,
    _Screens.feedback: feedback,
    _Screens.blockedUsers: blockedUsers,
    _Screens.devices: devices,
    _Screens.device: device,
    _Screens.sessions: sessions,
    _Screens.session: session,
    _Screens.dataExport: dataExport,
    _Screens.deleteAccount: deleteAccount,
    _Screens.workspace: workspace,
    _Screens.project: project,
    _Screens.board: board,
    _Screens.taskList: taskList,
    _Screens.task: task,
    _Screens.subtask: subtask,
    _Screens.checklistItem: checklistItem,
    _Screens.editTask: editTask,
    _Screens.taskComment: taskComment,
    _Screens.assignee: assignee,
    _Screens.label: label,
    _Screens.milestone: milestone,
    _Screens.sprint: sprint,
    _Screens.forum: forum,
    _Screens.forumCategory: forumCategory,
    _Screens.forumThread: forumThread,
    _Screens.forumReply: forumReply,
    _Screens.reportThread: reportThread,
    _Screens.learn: learn,
    _Screens.course: course,
    _Screens.courseModule: courseModule,
    _Screens.lesson: lesson,
    _Screens.quiz: quiz,
    _Screens.question: question,
    _Screens.answer: answer,
    _Screens.courseReview: courseReview,
    _Screens.instructor: instructor,
    _Screens.certificate: certificate,
    _Screens.shop: shop,
    _Screens.shopDept: shopDept,
    _Screens.shopCategory: shopCategory,
    _Screens.shopSubcategory: shopSubcategory,
    _Screens.product: product,
    _Screens.productVariant: productVariant,
    _Screens.productReview: productReview,
    _Screens.brand: brand,
    _Screens.compareProducts: compareProducts,
    _Screens.activity: activity,
    _Screens.workout: workout,
    _Screens.exercise: exercise,
    _Screens.exerciseSet: exerciseSet,
    _Screens.deepDemo: deepDemo,
    _Screens.levelA: levelA,
    _Screens.levelB: levelB,
    _Screens.levelC: levelC,
    _Screens.levelD: levelD,
    _Screens.levelE: levelE,
    _Screens.levelF: levelF,
    _Screens.integrations: integrations,
    _Screens.apiKeys: apiKeys,
    CreatorStudio.studio: studio,
    CreatorStudio.analytics: analytics,
    CreatorStudio.audience: audience,
    CreatorStudio.scheduled: scheduled,
    CreatorStudio.scheduledPost: scheduledPost,
    CreatorStudio.editScheduled: editScheduled,
    CreatorStudio.monetization: monetization,
    CreatorStudio.payouts: payouts,
    Events.events: events,
    Events.event: event,
    Events.attendees: attendees,
    Events.editEvent: editEvent,
    Events.createEvent: createEvent,
    Events.tickets: tickets,
    Support.support: support,
    Support.supportTickets: supportTickets,
    Support.supportTicket: supportTicket,
    Support.newTicket: newTicket,
    Support.knowledgeBase: knowledgeBase,
    Support.article: article,
    Admin.admin: admin,
    Admin.adminUsers: adminUsers,
    Admin.adminUser: adminUser,
    Admin.adminAuditLog: adminAuditLog,
    Admin.adminRole: adminRole,
    Admin.adminFeatureFlags: adminFeatureFlags,
    Admin.webhooks: webhooks,
    Admin.webhook: webhook,
  };

  /// The live active stack as wrappers: .current/.currentId/.tab/
  /// .screens/.reachable, extensible without touching Screen.
  static NavStack<Screen<Object?>> get stack => NavStack([
    for (final e in _Screens.graph.stack) NavEntry(_forSpec(e.screen), e.id),
  ]);

  /// The active top screen's QUERY view-state, read-only and
  /// context-free (the headless peer of `Query.of(context, ...)`).
  static Map<String, Object?> get query => _Screens.graph.activeView('q');

  /// The active top screen's FRAGMENT view-state, read-only and
  /// context-free.
  static Map<String, Object?> get fragment => _Screens.graph.activeView('f');
  static const _treeSignature =
      'activityK(workout(exercise(exerciseSet(exerciseSetA()))));deepDemoK(levelA(levelB(levelC(levelD(levelE(levelF(levelAA(),levelBA(),levelCA(),levelDA(),levelEA(),levelFA())))))));discoverK(events(createEvent(),event(attendees(),editEvent(),tickets())),liveNow(liveRoom(liveRoomA())),nearby(),topics(),trending(hashtag(hashtagA()),topic(subtopic(subtopicA(),topicA()),topicA()),userProfile()));forgotPassword(resetPassword());forumK(forumCategory(forumThread(forumReply(forumReplyA(),userProfile()),forumThreadA(),reportThread())));homeK(feed(composePost(),post(comment(commentA(),postA()),editPost(),postA(),postAuthor(postA(),postAuthorA()),postComments(),postLikes(),repost()),story(storyA()),userProfile()),studio(analytics(audience()),monetization(payouts()),scheduled(scheduledPost(editScheduled()))));learnK(course(certificate(),courseModule(instructor(),lesson(courseReview(),quiz(question(answer(),questionA()))))));marketplaceK(cart(checkout(orderConfirmation())),categories(category(categoryA(),listing(editListing(),listingA(),listingVariant(listingVariantA()),sellerProfile(listingA(),sellerProfileA())))),myOrders(order(orderA())),wishlist());messagesK(chats(chat(thread(message(chatA(),messageReply(messageReplyA())),threadA()),userProfile(),voiceCall())),groupChat(groupChatA(),groupInfo()),newChat());notificationsK(notificationSettings());onboarding();profileK(achievements(),badges(badge(badgeA())),drafts(),editProfile(),followers(connection(connectionA(),mutualConnections())),following(),myListings(),savedPosts(),userProfile());searchK(searchResults());settingsK(about(feedback(),help(helpCategory(faq(faqArticle())))),accountSettings(),admin(adminAuditLog(),adminFeatureFlags(),adminUsers(adminUser(adminRole())),webhooks(webhook())),appearance(),blockedUsers(),connectedApps(),dataExport(),deleteAccount(),devices(device(session(sessionA()),sessions())),integrations(apiKeys()),language(),privacy(),security(twoFactorSettings()),support(knowledgeBase(article()),newTicket(),supportTickets(supportTicket())));shopK(compareProducts(),shopDept(shopCategory(shopSubcategory(product(brand(),productA(),productReview(),productVariant(productVariantA()))))));signIn();signUp();splash();twoFactor();verifyEmail();walletK(accounts(account(accountA(),statements(statement()),transactions(transaction(transactionA(),transactionItem(transactionItemA()))))),balance(),paymentMethods(addCard(),card()),receiveMoney(),sendMoney());workspaceK(project(board(taskList(milestone(),sprint(),task(assignee(),editTask(),label(),subtask(checklistItem(checklistItemA()),subtaskA()),taskA(),taskComment()))),userProfile()))';

  /// True when this generated code still matches the live tree.
  /// Assert it in a test to fail CI on a stale (un-regenerated) tree:
  /// `test('nav codegen fresh', () => expect(Screen.isCodegenFresh, true));`
  static bool get isCodegenFresh =>
      _Screens.graph.structureSignature == _treeSignature;
  static final bool _fresh = () {
    assert(
      isCodegenFresh,
      'canon: the navigation tree changed but generated code is stale — run build_runner.',
    );
    return true;
  }();

  /// THE app host — a `RouterDelegate`. Wire it once:
  /// `MaterialApp.router(routerDelegate: Screen.manager)`. It owns the
  /// in-memory stack, drives browser back/forward + the URL channel on
  /// web, and system back on mobile. (The placement may change; the name
  /// stays — always pass it where a `RouterDelegate` goes.)
  static NavDelegate? _manager;
  static NavDelegate get manager {
    assert(_fresh);
    return _manager ??= NavDelegate(_Screens.graph);
  }

  /// A restoration-serializable snapshot of the whole nav state
  /// (no URLs; ids via each screen codec). Persist + [restore] it.
  static Map<String, Object?> snapshot() => _Screens.graph.toState();

  /// Rebuilds the stack from a [snapshot], best-effort. Returns
  /// false on a stale/incompatible snapshot.
  static bool restore(Map<String, Object?> state) =>
      _Screens.graph.restore(state);

  /// Executes a resolved [Hop] — the path a parsed [Place] carries.
  /// This is how a resolver commits an inbound link:
  /// `Screen.resolver = (url) { if (url case Place p) Screen.go(p); };`.
  static N go<N extends AnyNav>(Hop<N> hop) {
    for (final (s, i) in hop.chain) _Screens.graph.go<Object?>(s, i);
    return hop.nav;
  }

  /// If the live stack ends with this selector path (every pinned id and,
  /// for a cyclic terminal, its depth matching), its nav — else null.
  static N? on<N extends AnyNav, V>(On<N, V> which) {
    if (which is OnParentOf) {
      return (which as OnParentOf).parents.contains(_Screens.graph.current)
          ? which.nav
          : null;
    }
    final st = _Screens.graph.stack;
    final specs = which.specs;
    if (specs.isEmpty) {
      for (final c in which.conds) {
        if (!c.test(_Screens.graph.viewGet(_Screens.graph.current, c.key)))
          return null;
      }
      return _atOf(_Screens.graph.current) as N;
    }
    if (st.length < specs.length) return null;
    final off = st.length - specs.length;
    for (var i = 0; i < specs.length; i++) {
      if (st[off + i].screen != specs[i]) return null;
      final wid = which.ids[i];
      if (wid != null && st[off + i].id != wid) return null;
    }
    if (which is OnDepth &&
        _Screens.graph.countOf(specs.last, which.ids.last) !=
            (which as OnDepth).depth) {
      return null;
    }
    for (final c in which.conds) {
      if (!c.test(_Screens.graph.viewGet(specs.last, c.key))) return null;
    }
    return _atOf(specs.last) as N;
  }

  /// The placement if this selector path is anywhere on the live stack
  /// (front OR buried) — for `Screen.at(.x)?.surface()`. Else null.
  static N? at<N extends AnyNav, V>(On<N, V> which) {
    final st = _Screens.graph.stack;
    final specs = which.specs;
    if (which is OnParentOf) return null;
    if (specs.isEmpty) {
      for (final entry in st) {
        if (which.conds.every(
          (c) => c.test(_Screens.graph.viewGet(entry.screen, c.key)),
        )) {
          return _atOf(entry.screen) as N;
        }
      }
      return null;
    }
    outer:
    for (var e = st.length - 1; e >= specs.length - 1; e--) {
      final off = e - specs.length + 1;
      for (var i = 0; i < specs.length; i++) {
        if (st[off + i].screen != specs[i]) continue outer;
        final wid = which.ids[i];
        if (wid != null && st[off + i].id != wid) continue outer;
      }
      for (final c in which.conds) {
        if (!c.test(_Screens.graph.viewGet(specs.last, c.key))) continue outer;
      }
      return _atOf(specs.last) as N;
    }
    return null;
  }

  /// The placement OWNING [context] (this widget's screen), reactive.
  static AnyPlacement ownerOf(BuildContext context) {
    Placement.isOn(context, ScreenScope.of(context));
    return _atOf(ScreenScope.of(context));
  }

  /// Is the screen owning [context] the current foreground? Reactive.
  static bool isForegroundOf(BuildContext context) =>
      Placement.isCurrent(context, ScreenScope.of(context));

  /// The read-only view of the screen owning [context] (or null if it
  /// has no view-state) — `switch` it for the typed view. Reactive.
  static AnyView? viewOf(BuildContext context) {
    Placement.isOn(context, ScreenScope.of(context));
    return _viewOf(ScreenScope.of(context));
  }

  /// Live-stack redirect: the chained verb REPLACES the current history
  /// entry instead of pushing. Decide it at the start —
  /// `Screen.replace.goHome()`, `Screen.replace.on(.user)?.goChat(id)`.
  static const replace = Replace._();

  /// The root (history bottom) controls: `Screen.root.anchor()` keeps the
  /// launch position returnable; `Screen.root.passthrough()` makes it a
  /// throwaway that exits on back.
  static const root = RootControls._();

  /// The current foreground placement (the front), as the sealed
  /// [AnyPlacement] — `switch (Screen.current) { … }` is exhaustive.
  static AnyPlacement get current => _atOf(_Screens.graph.current);

  /// The cold-start link, parsed from the launch URL — read it in the
  /// `root` boot UI to vary the loading screen by destination. Eager:
  /// available from the first build, independent of the Router callback.
  /// Null when the launch URL isn't a representable link.
  static Url? get rootUrl {
    final u =
        _Screens.graph.bootUrl ??
        WidgetsBinding.instance.platformDispatcher.defaultRouteName;
    return parseUrl(u);
  }

  /// THE navigation resolver — assign once (ideally in `main` before
  /// `runApp`). Fires with the cold-start link (or null), then on every
  /// deep link — web URL + mobile app-link, one channel. Write plain
  /// `Screen.goX()` / `Screen.replace`. Single, last-wins, never disposed.
  static set resolver(void Function(Url? url) fn) =>
      _Screens.graph.setResolver((url) => fn(parseUrl(url)));

  /// The poppable handle if the active top is a non-root placement,
  /// else null (at a scope root). `.at` = current placement; `.pop()`
  /// executes the guaranteed pop and returns the destination.
  static CanPopNav? get canPop =>
      _Screens.graph.currentChain.length > 1 ? const CanPopNav._() : null;

  /// Documented sugar for `canPop?.pop()` — pops the active top if any,
  /// returns where it landed, or null at a root. Never throws.
  static PopDestPlacement? pop() => canPop?.pop();

  /// A broadcast stream of committed navigations as typed snapshots:
  /// `from`/`to` are ScreenEntry stacks; `switch (e.destination)` for
  /// the landed screen + its typed id. Filter with `.where`.
  static Stream<ScreenNavigation> get navigations =>
      _Screens.graph.navigations.map(ScreenNavigation._);

  /// Drops a kept subtree now, so its next visit rebuilds fresh —
  /// the runtime counterpart to a `keep` branch in the grammar.
  static void forget(Keep keep) => _Screens.graph.forget(keep.spec);
  static SplashNav goSplash() {
    _Screens.graph.go(_Screens.splash);
    return const SplashNav._();
  }

  static SignInNav goSignIn() {
    _Screens.graph.go(_Screens.signIn);
    return const SignInNav._();
  }

  static SignUpNav goSignUp() {
    _Screens.graph.go(_Screens.signUp);
    return const SignUpNav._();
  }

  static OnboardingNav goOnboarding() {
    _Screens.graph.go(_Screens.onboarding);
    return const OnboardingNav._();
  }

  static ForgotPasswordNav goForgotPassword() {
    _Screens.graph.go(_Screens.forgotPassword);
    return const ForgotPasswordNav._();
  }

  static ResetPasswordNav goResetPassword(String id) {
    _Screens.graph.go(_Screens.resetPassword, id);
    return const ResetPasswordNav._();
  }

  static VerifyEmailNav goVerifyEmail() {
    _Screens.graph.go(_Screens.verifyEmail);
    return const VerifyEmailNav._();
  }

  static TwoFactorNav goTwoFactor() {
    _Screens.graph.go(_Screens.twoFactor);
    return const TwoFactorNav._();
  }

  static HomeNav goHome() {
    _Screens.graph.go(_Screens.home);
    return const HomeNav._();
  }

  static FeedNav goFeed() {
    _Screens.graph.go(_Screens.feed);
    return const FeedNav._();
  }

  static ComposePostNav goComposePost() {
    _Screens.graph.go(_Screens.composePost);
    return const ComposePostNav._();
  }

  static StoryNav goStory(String id) {
    _Screens.graph.go(_Screens.story, id);
    return const StoryNav._();
  }

  static PostNav goPost(String id) {
    _Screens.graph.go(_Screens.post, id);
    return const PostNav._();
  }

  static PostCommentsNav goPostComments(String id) {
    _Screens.graph.go(_Screens.post, id);
    _Screens.graph.go(_Screens.postComments, id, true);
    return const PostCommentsNav._();
  }

  static PostLikesNav goPostLikes(String id) {
    _Screens.graph.go(_Screens.post, id);
    _Screens.graph.go(_Screens.postLikes, id, true);
    return const PostLikesNav._();
  }

  static EditPostNav goEditPost(String id) {
    _Screens.graph.go(_Screens.post, id);
    _Screens.graph.go(_Screens.editPost, id, true);
    return const EditPostNav._();
  }

  static RepostNav goRepost(String id) {
    _Screens.graph.go(_Screens.post, id);
    _Screens.graph.go(_Screens.repost, id, true);
    return const RepostNav._();
  }

  static DiscoverNav goDiscover() {
    _Screens.graph.go(_Screens.discover);
    return const DiscoverNav._();
  }

  static TrendingNav goTrending() {
    _Screens.graph.go(_Screens.trending);
    return const TrendingNav._();
  }

  static TopicsNav goTopics() {
    _Screens.graph.go(_Screens.topics);
    return const TopicsNav._();
  }

  static TopicNav goTopic(String id) {
    _Screens.graph.go(_Screens.topic, id);
    return const TopicNav._();
  }

  static HashtagNav goHashtag(String id) {
    _Screens.graph.go(_Screens.hashtag, id);
    return const HashtagNav._();
  }

  static LiveNowNav goLiveNow() {
    _Screens.graph.go(_Screens.liveNow);
    return const LiveNowNav._();
  }

  static LiveRoomNav goLiveRoom(String id) {
    _Screens.graph.go(_Screens.liveRoom, id);
    return const LiveRoomNav._();
  }

  static NearbyNav goNearby() {
    _Screens.graph.go(_Screens.nearby);
    return const NearbyNav._();
  }

  static MarketplaceNav goMarketplace() {
    _Screens.graph.go(_Screens.marketplace);
    return const MarketplaceNav._();
  }

  static CategoriesNav goCategories() {
    _Screens.graph.go(_Screens.categories);
    return const CategoriesNav._();
  }

  static CategoryNav goCategory(String id) {
    _Screens.graph.go(_Screens.category, id);
    return const CategoryNav._();
  }

  static CartNav goCart() {
    _Screens.graph.go(_Screens.cart);
    return const CartNav._();
  }

  static CheckoutNav goCheckout(String id) {
    _Screens.graph.go(_Screens.checkout, id);
    return const CheckoutNav._();
  }

  static MyOrdersNav goMyOrders() {
    _Screens.graph.go(_Screens.myOrders);
    return const MyOrdersNav._();
  }

  static OrderNav goOrder(String id) {
    _Screens.graph.go(_Screens.order, id);
    return const OrderNav._();
  }

  static WishlistNav goWishlist() {
    _Screens.graph.go(_Screens.wishlist);
    return const WishlistNav._();
  }

  static MessagesNav goMessages() {
    _Screens.graph.go(_Screens.messages);
    return const MessagesNav._();
  }

  static ChatsNav goChats() {
    _Screens.graph.go(_Screens.chats);
    return const ChatsNav._();
  }

  static ChatNav goChat(String id) {
    _Screens.graph.go(_Screens.chat, id);
    return const ChatNav._();
  }

  static VoiceCallNav goVoiceCall(String id) {
    _Screens.graph.go(_Screens.chat, id);
    _Screens.graph.go(_Screens.voiceCall, id, true);
    return const VoiceCallNav._();
  }

  static NewChatNav goNewChat() {
    _Screens.graph.go(_Screens.newChat);
    return const NewChatNav._();
  }

  static GroupChatNav goGroupChat(String id) {
    _Screens.graph.go(_Screens.groupChat, id);
    return const GroupChatNav._();
  }

  static GroupInfoNav goGroupInfo(String id) {
    _Screens.graph.go(_Screens.groupChat, id);
    _Screens.graph.go(_Screens.groupInfo, id, true);
    return const GroupInfoNav._();
  }

  static WalletNav goWallet() {
    _Screens.graph.go(_Screens.wallet);
    return const WalletNav._();
  }

  static BalanceNav goBalance() {
    _Screens.graph.go(_Screens.balance);
    return const BalanceNav._();
  }

  static AccountsNav goAccounts() {
    _Screens.graph.go(_Screens.accounts);
    return const AccountsNav._();
  }

  static AccountNav goAccount(String id) {
    _Screens.graph.go(_Screens.account, id);
    return const AccountNav._();
  }

  static SendMoneyNav goSendMoney() {
    _Screens.graph.go(_Screens.sendMoney);
    return const SendMoneyNav._();
  }

  static ReceiveMoneyNav goReceiveMoney() {
    _Screens.graph.go(_Screens.receiveMoney);
    return const ReceiveMoneyNav._();
  }

  static PaymentMethodsNav goPaymentMethods() {
    _Screens.graph.go(_Screens.paymentMethods);
    return const PaymentMethodsNav._();
  }

  static AddCardNav goAddCard() {
    _Screens.graph.go(_Screens.addCard);
    return const AddCardNav._();
  }

  static CardNav goCard(String id) {
    _Screens.graph.go(_Screens.card, id);
    return const CardNav._();
  }

  static ProfileNav goProfile() {
    _Screens.graph.go(_Screens.profile);
    return const ProfileNav._();
  }

  static FollowersNav goFollowers(String id) {
    _Screens.graph.go(_Screens.followers, id);
    return const FollowersNav._();
  }

  static FollowingNav goFollowing(String id) {
    _Screens.graph.go(_Screens.following, id);
    return const FollowingNav._();
  }

  static EditProfileNav goEditProfile() {
    _Screens.graph.go(_Screens.editProfile);
    return const EditProfileNav._();
  }

  static AchievementsNav goAchievements() {
    _Screens.graph.go(_Screens.achievements);
    return const AchievementsNav._();
  }

  static BadgesNav goBadges() {
    _Screens.graph.go(_Screens.badges);
    return const BadgesNav._();
  }

  static BadgeNav goBadge(String id) {
    _Screens.graph.go(_Screens.badge, id);
    return const BadgeNav._();
  }

  static SavedPostsNav goSavedPosts() {
    _Screens.graph.go(_Screens.savedPosts);
    return const SavedPostsNav._();
  }

  static DraftsNav goDrafts() {
    _Screens.graph.go(_Screens.drafts);
    return const DraftsNav._();
  }

  static MyListingsNav goMyListings() {
    _Screens.graph.go(_Screens.myListings);
    return const MyListingsNav._();
  }

  static NotificationsNav goNotifications() {
    _Screens.graph.go(_Screens.notifications);
    return const NotificationsNav._();
  }

  static NotificationSettingsNav goNotificationSettings() {
    _Screens.graph.go(_Screens.notificationSettings);
    return const NotificationSettingsNav._();
  }

  static SearchNav goSearch() {
    _Screens.graph.go(_Screens.search);
    return const SearchNav._();
  }

  static SearchResultsNav goSearchResults() {
    _Screens.graph.go(_Screens.searchResults);
    return const SearchResultsNav._();
  }

  static SettingsNav goSettings() {
    _Screens.graph.go(_Screens.settings);
    return const SettingsNav._();
  }

  static AccountSettingsNav goAccountSettings() {
    _Screens.graph.go(_Screens.accountSettings);
    return const AccountSettingsNav._();
  }

  static SecurityNav goSecurity() {
    _Screens.graph.go(_Screens.security);
    return const SecurityNav._();
  }

  static TwoFactorSettingsNav goTwoFactorSettings() {
    _Screens.graph.go(_Screens.twoFactorSettings);
    return const TwoFactorSettingsNav._();
  }

  static PrivacyNav goPrivacy() {
    _Screens.graph.go(_Screens.privacy);
    return const PrivacyNav._();
  }

  static AppearanceNav goAppearance() {
    _Screens.graph.go(_Screens.appearance);
    return const AppearanceNav._();
  }

  static LanguageNav goLanguage() {
    _Screens.graph.go(_Screens.language);
    return const LanguageNav._();
  }

  static ConnectedAppsNav goConnectedApps() {
    _Screens.graph.go(_Screens.connectedApps);
    return const ConnectedAppsNav._();
  }

  static AboutNav goAbout() {
    _Screens.graph.go(_Screens.about);
    return const AboutNav._();
  }

  static HelpNav goHelp() {
    _Screens.graph.go(_Screens.help);
    return const HelpNav._();
  }

  static HelpCategoryNav goHelpCategory(String id) {
    _Screens.graph.go(_Screens.helpCategory, id);
    return const HelpCategoryNav._();
  }

  static FeedbackNav goFeedback() {
    _Screens.graph.go(_Screens.feedback);
    return const FeedbackNav._();
  }

  static BlockedUsersNav goBlockedUsers() {
    _Screens.graph.go(_Screens.blockedUsers);
    return const BlockedUsersNav._();
  }

  static DevicesNav goDevices() {
    _Screens.graph.go(_Screens.devices);
    return const DevicesNav._();
  }

  static DeviceNav goDevice(String id) {
    _Screens.graph.go(_Screens.device, id);
    return const DeviceNav._();
  }

  static DataExportNav goDataExport() {
    _Screens.graph.go(_Screens.dataExport);
    return const DataExportNav._();
  }

  static DeleteAccountNav goDeleteAccount() {
    _Screens.graph.go(_Screens.deleteAccount);
    return const DeleteAccountNav._();
  }

  static WorkspaceNav goWorkspace() {
    _Screens.graph.go(_Screens.workspace);
    return const WorkspaceNav._();
  }

  static ProjectNav goProject(String id) {
    _Screens.graph.go(_Screens.project, id);
    return const ProjectNav._();
  }

  static ForumNav goForum() {
    _Screens.graph.go(_Screens.forum);
    return const ForumNav._();
  }

  static ForumCategoryNav goForumCategory(String id) {
    _Screens.graph.go(_Screens.forumCategory, id);
    return const ForumCategoryNav._();
  }

  static LearnNav goLearn() {
    _Screens.graph.go(_Screens.learn);
    return const LearnNav._();
  }

  static CourseNav goCourse(String id) {
    _Screens.graph.go(_Screens.course, id);
    return const CourseNav._();
  }

  static CertificateNav goCertificate(String id) {
    _Screens.graph.go(_Screens.course, id);
    _Screens.graph.go(_Screens.certificate, id, true);
    return const CertificateNav._();
  }

  static ShopNav goShop() {
    _Screens.graph.go(_Screens.shop);
    return const ShopNav._();
  }

  static ShopDeptNav goShopDept(String id) {
    _Screens.graph.go(_Screens.shopDept, id);
    return const ShopDeptNav._();
  }

  static CompareProductsNav goCompareProducts() {
    _Screens.graph.go(_Screens.compareProducts);
    return const CompareProductsNav._();
  }

  static ActivityNav goActivity() {
    _Screens.graph.go(_Screens.activity);
    return const ActivityNav._();
  }

  static WorkoutNav goWorkout(String id) {
    _Screens.graph.go(_Screens.workout, id);
    return const WorkoutNav._();
  }

  static DeepDemoNav goDeepDemo() {
    _Screens.graph.go(_Screens.deepDemo);
    return const DeepDemoNav._();
  }

  static LevelANav goLevelA(String id) {
    _Screens.graph.go(_Screens.levelA, id);
    return const LevelANav._();
  }

  static IntegrationsNav goIntegrations() {
    _Screens.graph.go(_Screens.integrations);
    return const IntegrationsNav._();
  }

  static ApiKeysNav goApiKeys() {
    _Screens.graph.go(_Screens.apiKeys);
    return const ApiKeysNav._();
  }

  static StudioNav goStudio() {
    _Screens.graph.go(CreatorStudio.studio);
    return const StudioNav._();
  }

  static AnalyticsNav goAnalytics() {
    _Screens.graph.go(CreatorStudio.analytics);
    return const AnalyticsNav._();
  }

  static AudienceNav goAudience() {
    _Screens.graph.go(CreatorStudio.audience);
    return const AudienceNav._();
  }

  static ScheduledNav goScheduled() {
    _Screens.graph.go(CreatorStudio.scheduled);
    return const ScheduledNav._();
  }

  static ScheduledPostNav goScheduledPost(String id) {
    _Screens.graph.go(CreatorStudio.scheduledPost, id);
    return const ScheduledPostNav._();
  }

  static EditScheduledNav goEditScheduled(String id) {
    _Screens.graph.go(CreatorStudio.scheduledPost, id);
    _Screens.graph.go(CreatorStudio.editScheduled, id, true);
    return const EditScheduledNav._();
  }

  static MonetizationNav goMonetization() {
    _Screens.graph.go(CreatorStudio.monetization);
    return const MonetizationNav._();
  }

  static PayoutsNav goPayouts() {
    _Screens.graph.go(CreatorStudio.payouts);
    return const PayoutsNav._();
  }

  static EventsNav goEvents() {
    _Screens.graph.go(Events.events);
    return const EventsNav._();
  }

  static EventNav goEvent(String id) {
    _Screens.graph.go(Events.event, id);
    return const EventNav._();
  }

  static AttendeesNav goAttendees(String id) {
    _Screens.graph.go(Events.event, id);
    _Screens.graph.go(Events.attendees, id, true);
    return const AttendeesNav._();
  }

  static EditEventNav goEditEvent(String id) {
    _Screens.graph.go(Events.event, id);
    _Screens.graph.go(Events.editEvent, id, true);
    return const EditEventNav._();
  }

  static CreateEventNav goCreateEvent() {
    _Screens.graph.go(Events.createEvent);
    return const CreateEventNav._();
  }

  static TicketsNav goTickets(String id) {
    _Screens.graph.go(Events.event, id);
    _Screens.graph.go(Events.tickets, id, true);
    return const TicketsNav._();
  }

  static SupportNav goSupport() {
    _Screens.graph.go(Support.support);
    return const SupportNav._();
  }

  static SupportTicketsNav goSupportTickets() {
    _Screens.graph.go(Support.supportTickets);
    return const SupportTicketsNav._();
  }

  static SupportTicketNav goSupportTicket(String id) {
    _Screens.graph.go(Support.supportTicket, id);
    return const SupportTicketNav._();
  }

  static NewTicketNav goNewTicket() {
    _Screens.graph.go(Support.newTicket);
    return const NewTicketNav._();
  }

  static KnowledgeBaseNav goKnowledgeBase() {
    _Screens.graph.go(Support.knowledgeBase);
    return const KnowledgeBaseNav._();
  }

  static ArticleNav goArticle(String id) {
    _Screens.graph.go(Support.article, id);
    return const ArticleNav._();
  }

  static AdminNav goAdmin() {
    _Screens.graph.go(Admin.admin);
    return const AdminNav._();
  }

  static AdminUsersNav goAdminUsers() {
    _Screens.graph.go(Admin.adminUsers);
    return const AdminUsersNav._();
  }

  static AdminUserNav goAdminUser(String id) {
    _Screens.graph.go(Admin.adminUser, id);
    return const AdminUserNav._();
  }

  static AdminAuditLogNav goAdminAuditLog() {
    _Screens.graph.go(Admin.adminAuditLog);
    return const AdminAuditLogNav._();
  }

  static AdminFeatureFlagsNav goAdminFeatureFlags() {
    _Screens.graph.go(Admin.adminFeatureFlags);
    return const AdminFeatureFlagsNav._();
  }

  static WebhooksNav goWebhooks() {
    _Screens.graph.go(Admin.webhooks);
    return const WebhooksNav._();
  }

  static WebhookNav goWebhook(String id) {
    _Screens.graph.go(Admin.webhook, id);
    return const WebhookNav._();
  }
}

/// The `Screen.root` facade — controls for the root (the history bottom):
/// whether the launch position is a returnable root or a throwaway that
/// exits on back.
final class RootControls {
  const RootControls._();

  /// Persist the launch/root position as returnable — back returns to it
  /// (then exits), and trunk-switches stack above it.
  void anchor() => _Screens.graph.anchor();

  /// Make the launch/root a throwaway that exits on back (the default).
  void passthrough() => _Screens.graph.passthrough();

  /// On a BARE root the `root` widget renders — read this to branch
  /// (a `sentinel`/`fallthrough` kind), or null while boot-loading.
  FloorKind? get kind => _Screens.graph.rootKind;

  /// The current front screen's widget — `return Screen.root.front` from
  /// the `root` widget to keep showing it on a bare root.
  Widget? get front => _Screens.graph.frontWidget as Widget?;
}

/// The `Screen.replace` redirect facade — every verb mirrors `Screen`
/// but commits as a history REPLACE (web `replaceState`).
final class Replace {
  const Replace._();
  N go<N extends AnyNav>(Hop<N> hop) {
    _Screens.graph.markReplace();
    return Screen.go(hop);
  }

  /// Scoped redirect — replace is decided here, before scoping; a miss
  /// (null) commits nothing, so the pending flag is dropped, not leaked.
  N? on<N extends AnyNav, V>(On<N, V> which) {
    _Screens.graph.markReplace();
    return Screen.on(which);
  }

  /// Replace-mode reach: the placement anywhere on the stack, so the
  /// following `surface()` / `goX()` commits as a replace (or, on a miss,
  /// nothing — the flag drops, not leaks).
  N? at<N extends AnyNav, V>(On<N, V> which) {
    _Screens.graph.markReplace();
    return Screen.at(which);
  }

  SplashNav goSplash() {
    _Screens.graph.markReplace();
    return Screen.goSplash();
  }

  SignInNav goSignIn() {
    _Screens.graph.markReplace();
    return Screen.goSignIn();
  }

  SignUpNav goSignUp() {
    _Screens.graph.markReplace();
    return Screen.goSignUp();
  }

  OnboardingNav goOnboarding() {
    _Screens.graph.markReplace();
    return Screen.goOnboarding();
  }

  ForgotPasswordNav goForgotPassword() {
    _Screens.graph.markReplace();
    return Screen.goForgotPassword();
  }

  ResetPasswordNav goResetPassword(String id) {
    _Screens.graph.markReplace();
    return Screen.goResetPassword(id);
  }

  VerifyEmailNav goVerifyEmail() {
    _Screens.graph.markReplace();
    return Screen.goVerifyEmail();
  }

  TwoFactorNav goTwoFactor() {
    _Screens.graph.markReplace();
    return Screen.goTwoFactor();
  }

  HomeNav goHome() {
    _Screens.graph.markReplace();
    return Screen.goHome();
  }

  FeedNav goFeed() {
    _Screens.graph.markReplace();
    return Screen.goFeed();
  }

  ComposePostNav goComposePost() {
    _Screens.graph.markReplace();
    return Screen.goComposePost();
  }

  StoryNav goStory(String id) {
    _Screens.graph.markReplace();
    return Screen.goStory(id);
  }

  PostNav goPost(String id) {
    _Screens.graph.markReplace();
    return Screen.goPost(id);
  }

  PostCommentsNav goPostComments(String id) {
    _Screens.graph.markReplace();
    return Screen.goPostComments(id);
  }

  PostLikesNav goPostLikes(String id) {
    _Screens.graph.markReplace();
    return Screen.goPostLikes(id);
  }

  EditPostNav goEditPost(String id) {
    _Screens.graph.markReplace();
    return Screen.goEditPost(id);
  }

  RepostNav goRepost(String id) {
    _Screens.graph.markReplace();
    return Screen.goRepost(id);
  }

  DiscoverNav goDiscover() {
    _Screens.graph.markReplace();
    return Screen.goDiscover();
  }

  TrendingNav goTrending() {
    _Screens.graph.markReplace();
    return Screen.goTrending();
  }

  TopicsNav goTopics() {
    _Screens.graph.markReplace();
    return Screen.goTopics();
  }

  TopicNav goTopic(String id) {
    _Screens.graph.markReplace();
    return Screen.goTopic(id);
  }

  HashtagNav goHashtag(String id) {
    _Screens.graph.markReplace();
    return Screen.goHashtag(id);
  }

  LiveNowNav goLiveNow() {
    _Screens.graph.markReplace();
    return Screen.goLiveNow();
  }

  LiveRoomNav goLiveRoom(String id) {
    _Screens.graph.markReplace();
    return Screen.goLiveRoom(id);
  }

  NearbyNav goNearby() {
    _Screens.graph.markReplace();
    return Screen.goNearby();
  }

  MarketplaceNav goMarketplace() {
    _Screens.graph.markReplace();
    return Screen.goMarketplace();
  }

  CategoriesNav goCategories() {
    _Screens.graph.markReplace();
    return Screen.goCategories();
  }

  CategoryNav goCategory(String id) {
    _Screens.graph.markReplace();
    return Screen.goCategory(id);
  }

  CartNav goCart() {
    _Screens.graph.markReplace();
    return Screen.goCart();
  }

  CheckoutNav goCheckout(String id) {
    _Screens.graph.markReplace();
    return Screen.goCheckout(id);
  }

  MyOrdersNav goMyOrders() {
    _Screens.graph.markReplace();
    return Screen.goMyOrders();
  }

  OrderNav goOrder(String id) {
    _Screens.graph.markReplace();
    return Screen.goOrder(id);
  }

  WishlistNav goWishlist() {
    _Screens.graph.markReplace();
    return Screen.goWishlist();
  }

  MessagesNav goMessages() {
    _Screens.graph.markReplace();
    return Screen.goMessages();
  }

  ChatsNav goChats() {
    _Screens.graph.markReplace();
    return Screen.goChats();
  }

  ChatNav goChat(String id) {
    _Screens.graph.markReplace();
    return Screen.goChat(id);
  }

  VoiceCallNav goVoiceCall(String id) {
    _Screens.graph.markReplace();
    return Screen.goVoiceCall(id);
  }

  NewChatNav goNewChat() {
    _Screens.graph.markReplace();
    return Screen.goNewChat();
  }

  GroupChatNav goGroupChat(String id) {
    _Screens.graph.markReplace();
    return Screen.goGroupChat(id);
  }

  GroupInfoNav goGroupInfo(String id) {
    _Screens.graph.markReplace();
    return Screen.goGroupInfo(id);
  }

  WalletNav goWallet() {
    _Screens.graph.markReplace();
    return Screen.goWallet();
  }

  BalanceNav goBalance() {
    _Screens.graph.markReplace();
    return Screen.goBalance();
  }

  AccountsNav goAccounts() {
    _Screens.graph.markReplace();
    return Screen.goAccounts();
  }

  AccountNav goAccount(String id) {
    _Screens.graph.markReplace();
    return Screen.goAccount(id);
  }

  SendMoneyNav goSendMoney() {
    _Screens.graph.markReplace();
    return Screen.goSendMoney();
  }

  ReceiveMoneyNav goReceiveMoney() {
    _Screens.graph.markReplace();
    return Screen.goReceiveMoney();
  }

  PaymentMethodsNav goPaymentMethods() {
    _Screens.graph.markReplace();
    return Screen.goPaymentMethods();
  }

  AddCardNav goAddCard() {
    _Screens.graph.markReplace();
    return Screen.goAddCard();
  }

  CardNav goCard(String id) {
    _Screens.graph.markReplace();
    return Screen.goCard(id);
  }

  ProfileNav goProfile() {
    _Screens.graph.markReplace();
    return Screen.goProfile();
  }

  FollowersNav goFollowers(String id) {
    _Screens.graph.markReplace();
    return Screen.goFollowers(id);
  }

  FollowingNav goFollowing(String id) {
    _Screens.graph.markReplace();
    return Screen.goFollowing(id);
  }

  EditProfileNav goEditProfile() {
    _Screens.graph.markReplace();
    return Screen.goEditProfile();
  }

  AchievementsNav goAchievements() {
    _Screens.graph.markReplace();
    return Screen.goAchievements();
  }

  BadgesNav goBadges() {
    _Screens.graph.markReplace();
    return Screen.goBadges();
  }

  BadgeNav goBadge(String id) {
    _Screens.graph.markReplace();
    return Screen.goBadge(id);
  }

  SavedPostsNav goSavedPosts() {
    _Screens.graph.markReplace();
    return Screen.goSavedPosts();
  }

  DraftsNav goDrafts() {
    _Screens.graph.markReplace();
    return Screen.goDrafts();
  }

  MyListingsNav goMyListings() {
    _Screens.graph.markReplace();
    return Screen.goMyListings();
  }

  NotificationsNav goNotifications() {
    _Screens.graph.markReplace();
    return Screen.goNotifications();
  }

  NotificationSettingsNav goNotificationSettings() {
    _Screens.graph.markReplace();
    return Screen.goNotificationSettings();
  }

  SearchNav goSearch() {
    _Screens.graph.markReplace();
    return Screen.goSearch();
  }

  SearchResultsNav goSearchResults() {
    _Screens.graph.markReplace();
    return Screen.goSearchResults();
  }

  SettingsNav goSettings() {
    _Screens.graph.markReplace();
    return Screen.goSettings();
  }

  AccountSettingsNav goAccountSettings() {
    _Screens.graph.markReplace();
    return Screen.goAccountSettings();
  }

  SecurityNav goSecurity() {
    _Screens.graph.markReplace();
    return Screen.goSecurity();
  }

  TwoFactorSettingsNav goTwoFactorSettings() {
    _Screens.graph.markReplace();
    return Screen.goTwoFactorSettings();
  }

  PrivacyNav goPrivacy() {
    _Screens.graph.markReplace();
    return Screen.goPrivacy();
  }

  AppearanceNav goAppearance() {
    _Screens.graph.markReplace();
    return Screen.goAppearance();
  }

  LanguageNav goLanguage() {
    _Screens.graph.markReplace();
    return Screen.goLanguage();
  }

  ConnectedAppsNav goConnectedApps() {
    _Screens.graph.markReplace();
    return Screen.goConnectedApps();
  }

  AboutNav goAbout() {
    _Screens.graph.markReplace();
    return Screen.goAbout();
  }

  HelpNav goHelp() {
    _Screens.graph.markReplace();
    return Screen.goHelp();
  }

  HelpCategoryNav goHelpCategory(String id) {
    _Screens.graph.markReplace();
    return Screen.goHelpCategory(id);
  }

  FeedbackNav goFeedback() {
    _Screens.graph.markReplace();
    return Screen.goFeedback();
  }

  BlockedUsersNav goBlockedUsers() {
    _Screens.graph.markReplace();
    return Screen.goBlockedUsers();
  }

  DevicesNav goDevices() {
    _Screens.graph.markReplace();
    return Screen.goDevices();
  }

  DeviceNav goDevice(String id) {
    _Screens.graph.markReplace();
    return Screen.goDevice(id);
  }

  DataExportNav goDataExport() {
    _Screens.graph.markReplace();
    return Screen.goDataExport();
  }

  DeleteAccountNav goDeleteAccount() {
    _Screens.graph.markReplace();
    return Screen.goDeleteAccount();
  }

  WorkspaceNav goWorkspace() {
    _Screens.graph.markReplace();
    return Screen.goWorkspace();
  }

  ProjectNav goProject(String id) {
    _Screens.graph.markReplace();
    return Screen.goProject(id);
  }

  ForumNav goForum() {
    _Screens.graph.markReplace();
    return Screen.goForum();
  }

  ForumCategoryNav goForumCategory(String id) {
    _Screens.graph.markReplace();
    return Screen.goForumCategory(id);
  }

  LearnNav goLearn() {
    _Screens.graph.markReplace();
    return Screen.goLearn();
  }

  CourseNav goCourse(String id) {
    _Screens.graph.markReplace();
    return Screen.goCourse(id);
  }

  CertificateNav goCertificate(String id) {
    _Screens.graph.markReplace();
    return Screen.goCertificate(id);
  }

  ShopNav goShop() {
    _Screens.graph.markReplace();
    return Screen.goShop();
  }

  ShopDeptNav goShopDept(String id) {
    _Screens.graph.markReplace();
    return Screen.goShopDept(id);
  }

  CompareProductsNav goCompareProducts() {
    _Screens.graph.markReplace();
    return Screen.goCompareProducts();
  }

  ActivityNav goActivity() {
    _Screens.graph.markReplace();
    return Screen.goActivity();
  }

  WorkoutNav goWorkout(String id) {
    _Screens.graph.markReplace();
    return Screen.goWorkout(id);
  }

  DeepDemoNav goDeepDemo() {
    _Screens.graph.markReplace();
    return Screen.goDeepDemo();
  }

  LevelANav goLevelA(String id) {
    _Screens.graph.markReplace();
    return Screen.goLevelA(id);
  }

  IntegrationsNav goIntegrations() {
    _Screens.graph.markReplace();
    return Screen.goIntegrations();
  }

  ApiKeysNav goApiKeys() {
    _Screens.graph.markReplace();
    return Screen.goApiKeys();
  }

  StudioNav goStudio() {
    _Screens.graph.markReplace();
    return Screen.goStudio();
  }

  AnalyticsNav goAnalytics() {
    _Screens.graph.markReplace();
    return Screen.goAnalytics();
  }

  AudienceNav goAudience() {
    _Screens.graph.markReplace();
    return Screen.goAudience();
  }

  ScheduledNav goScheduled() {
    _Screens.graph.markReplace();
    return Screen.goScheduled();
  }

  ScheduledPostNav goScheduledPost(String id) {
    _Screens.graph.markReplace();
    return Screen.goScheduledPost(id);
  }

  EditScheduledNav goEditScheduled(String id) {
    _Screens.graph.markReplace();
    return Screen.goEditScheduled(id);
  }

  MonetizationNav goMonetization() {
    _Screens.graph.markReplace();
    return Screen.goMonetization();
  }

  PayoutsNav goPayouts() {
    _Screens.graph.markReplace();
    return Screen.goPayouts();
  }

  EventsNav goEvents() {
    _Screens.graph.markReplace();
    return Screen.goEvents();
  }

  EventNav goEvent(String id) {
    _Screens.graph.markReplace();
    return Screen.goEvent(id);
  }

  AttendeesNav goAttendees(String id) {
    _Screens.graph.markReplace();
    return Screen.goAttendees(id);
  }

  EditEventNav goEditEvent(String id) {
    _Screens.graph.markReplace();
    return Screen.goEditEvent(id);
  }

  CreateEventNav goCreateEvent() {
    _Screens.graph.markReplace();
    return Screen.goCreateEvent();
  }

  TicketsNav goTickets(String id) {
    _Screens.graph.markReplace();
    return Screen.goTickets(id);
  }

  SupportNav goSupport() {
    _Screens.graph.markReplace();
    return Screen.goSupport();
  }

  SupportTicketsNav goSupportTickets() {
    _Screens.graph.markReplace();
    return Screen.goSupportTickets();
  }

  SupportTicketNav goSupportTicket(String id) {
    _Screens.graph.markReplace();
    return Screen.goSupportTicket(id);
  }

  NewTicketNav goNewTicket() {
    _Screens.graph.markReplace();
    return Screen.goNewTicket();
  }

  KnowledgeBaseNav goKnowledgeBase() {
    _Screens.graph.markReplace();
    return Screen.goKnowledgeBase();
  }

  ArticleNav goArticle(String id) {
    _Screens.graph.markReplace();
    return Screen.goArticle(id);
  }

  AdminNav goAdmin() {
    _Screens.graph.markReplace();
    return Screen.goAdmin();
  }

  AdminUsersNav goAdminUsers() {
    _Screens.graph.markReplace();
    return Screen.goAdminUsers();
  }

  AdminUserNav goAdminUser(String id) {
    _Screens.graph.markReplace();
    return Screen.goAdminUser(id);
  }

  AdminAuditLogNav goAdminAuditLog() {
    _Screens.graph.markReplace();
    return Screen.goAdminAuditLog();
  }

  AdminFeatureFlagsNav goAdminFeatureFlags() {
    _Screens.graph.markReplace();
    return Screen.goAdminFeatureFlags();
  }

  WebhooksNav goWebhooks() {
    _Screens.graph.markReplace();
    return Screen.goWebhooks();
  }

  WebhookNav goWebhook(String id) {
    _Screens.graph.markReplace();
    return Screen.goWebhook(id);
  }
}

/// One committed navigation as typed [ScreenEntry] stacks.
final class ScreenNavigation {
  ScreenNavigation._(this._n);
  final Navigation _n;
  List<ScreenEntry> get from => [for (final e in _n.from) _entryOf(e.$1, e.$2)];
  List<ScreenEntry> get to => [for (final e in _n.to) _entryOf(e.$1, e.$2)];
  ScreenEntry get source => _entryOf(_n.source.$1, _n.source.$2);
  ScreenEntry get destination => _entryOf(_n.destination.$1, _n.destination.$2);
  NavDirection get direction => _n.direction;
  bool get isForward => _n.isForward;
  bool get isBackward => _n.isBackward;
  bool get isRoundTrip => _n.isRoundTrip;
  bool get isJump => _n.isJump;
}

/// One typed entry per screen — `switch` it for the screen-specific id.
sealed class ScreenEntry {
  const ScreenEntry();
}

final class SplashEntry extends ScreenEntry {
  const SplashEntry();
}

final class SignInEntry extends ScreenEntry {
  const SignInEntry();
}

final class SignUpEntry extends ScreenEntry {
  const SignUpEntry();
}

final class OnboardingEntry extends ScreenEntry {
  const OnboardingEntry();
}

final class ForgotPasswordEntry extends ScreenEntry {
  const ForgotPasswordEntry();
}

final class ResetPasswordEntry extends ScreenEntry {
  const ResetPasswordEntry(this.id);
  final String id;
}

final class VerifyEmailEntry extends ScreenEntry {
  const VerifyEmailEntry();
}

final class TwoFactorEntry extends ScreenEntry {
  const TwoFactorEntry();
}

final class HomeEntry extends ScreenEntry {
  const HomeEntry();
}

final class FeedEntry extends ScreenEntry {
  const FeedEntry();
}

final class ComposePostEntry extends ScreenEntry {
  const ComposePostEntry();
}

final class StoryEntry extends ScreenEntry {
  const StoryEntry(this.id);
  final String id;
}

final class PostEntry extends ScreenEntry {
  const PostEntry(this.id);
  final String id;
}

final class CommentEntry extends ScreenEntry {
  const CommentEntry(this.id);
  final String id;
}

final class PostAuthorEntry extends ScreenEntry {
  const PostAuthorEntry(this.id);
  final String id;
}

final class PostCommentsEntry extends ScreenEntry {
  const PostCommentsEntry(this.id);
  final String id;
}

final class PostLikesEntry extends ScreenEntry {
  const PostLikesEntry(this.id);
  final String id;
}

final class EditPostEntry extends ScreenEntry {
  const EditPostEntry(this.id);
  final String id;
}

final class RepostEntry extends ScreenEntry {
  const RepostEntry(this.id);
  final String id;
}

final class DiscoverEntry extends ScreenEntry {
  const DiscoverEntry();
}

final class TrendingEntry extends ScreenEntry {
  const TrendingEntry();
}

final class TopicsEntry extends ScreenEntry {
  const TopicsEntry();
}

final class TopicEntry extends ScreenEntry {
  const TopicEntry(this.id);
  final String id;
}

final class SubtopicEntry extends ScreenEntry {
  const SubtopicEntry(this.id);
  final String id;
}

final class HashtagEntry extends ScreenEntry {
  const HashtagEntry(this.id);
  final String id;
}

final class LiveNowEntry extends ScreenEntry {
  const LiveNowEntry();
}

final class LiveRoomEntry extends ScreenEntry {
  const LiveRoomEntry(this.id);
  final String id;
}

final class NearbyEntry extends ScreenEntry {
  const NearbyEntry();
}

final class MarketplaceEntry extends ScreenEntry {
  const MarketplaceEntry();
}

final class CategoriesEntry extends ScreenEntry {
  const CategoriesEntry();
}

final class CategoryEntry extends ScreenEntry {
  const CategoryEntry(this.id);
  final String id;
}

final class ListingEntry extends ScreenEntry {
  const ListingEntry(this.id);
  final String id;
}

final class ListingVariantEntry extends ScreenEntry {
  const ListingVariantEntry(this.id);
  final String id;
}

final class EditListingEntry extends ScreenEntry {
  const EditListingEntry(this.id);
  final String id;
}

final class SellerProfileEntry extends ScreenEntry {
  const SellerProfileEntry(this.id);
  final String id;
}

final class CartEntry extends ScreenEntry {
  const CartEntry();
}

final class CheckoutEntry extends ScreenEntry {
  const CheckoutEntry(this.id);
  final String id;
}

final class OrderConfirmationEntry extends ScreenEntry {
  const OrderConfirmationEntry(this.id);
  final String id;
}

final class MyOrdersEntry extends ScreenEntry {
  const MyOrdersEntry();
}

final class OrderEntry extends ScreenEntry {
  const OrderEntry(this.id);
  final String id;
}

final class WishlistEntry extends ScreenEntry {
  const WishlistEntry();
}

final class MessagesEntry extends ScreenEntry {
  const MessagesEntry();
}

final class ChatsEntry extends ScreenEntry {
  const ChatsEntry();
}

final class ChatEntry extends ScreenEntry {
  const ChatEntry(this.id);
  final String id;
}

final class ThreadEntry extends ScreenEntry {
  const ThreadEntry(this.id);
  final String id;
}

final class MessageEntry extends ScreenEntry {
  const MessageEntry(this.id);
  final String id;
}

final class MessageReplyEntry extends ScreenEntry {
  const MessageReplyEntry(this.id);
  final String id;
}

final class VoiceCallEntry extends ScreenEntry {
  const VoiceCallEntry(this.id);
  final String id;
}

final class NewChatEntry extends ScreenEntry {
  const NewChatEntry();
}

final class GroupChatEntry extends ScreenEntry {
  const GroupChatEntry(this.id);
  final String id;
}

final class GroupInfoEntry extends ScreenEntry {
  const GroupInfoEntry(this.id);
  final String id;
}

final class WalletEntry extends ScreenEntry {
  const WalletEntry();
}

final class BalanceEntry extends ScreenEntry {
  const BalanceEntry();
}

final class AccountsEntry extends ScreenEntry {
  const AccountsEntry();
}

final class AccountEntry extends ScreenEntry {
  const AccountEntry(this.id);
  final String id;
}

final class TransactionsEntry extends ScreenEntry {
  const TransactionsEntry();
}

final class TransactionEntry extends ScreenEntry {
  const TransactionEntry(this.id);
  final String id;
}

final class TransactionItemEntry extends ScreenEntry {
  const TransactionItemEntry(this.id);
  final String id;
}

final class SendMoneyEntry extends ScreenEntry {
  const SendMoneyEntry();
}

final class ReceiveMoneyEntry extends ScreenEntry {
  const ReceiveMoneyEntry();
}

final class PaymentMethodsEntry extends ScreenEntry {
  const PaymentMethodsEntry();
}

final class AddCardEntry extends ScreenEntry {
  const AddCardEntry();
}

final class CardEntry extends ScreenEntry {
  const CardEntry(this.id);
  final String id;
}

final class StatementsEntry extends ScreenEntry {
  const StatementsEntry();
}

final class StatementEntry extends ScreenEntry {
  const StatementEntry(this.id);
  final String id;
}

final class ProfileEntry extends ScreenEntry {
  const ProfileEntry();
}

final class UserProfileEntry extends ScreenEntry {
  const UserProfileEntry(this.id);
  final String id;
}

final class FollowersEntry extends ScreenEntry {
  const FollowersEntry(this.id);
  final String id;
}

final class FollowingEntry extends ScreenEntry {
  const FollowingEntry(this.id);
  final String id;
}

final class ConnectionEntry extends ScreenEntry {
  const ConnectionEntry(this.id);
  final String id;
}

final class MutualConnectionsEntry extends ScreenEntry {
  const MutualConnectionsEntry();
}

final class EditProfileEntry extends ScreenEntry {
  const EditProfileEntry();
}

final class AchievementsEntry extends ScreenEntry {
  const AchievementsEntry();
}

final class BadgesEntry extends ScreenEntry {
  const BadgesEntry();
}

final class BadgeEntry extends ScreenEntry {
  const BadgeEntry(this.id);
  final String id;
}

final class SavedPostsEntry extends ScreenEntry {
  const SavedPostsEntry();
}

final class DraftsEntry extends ScreenEntry {
  const DraftsEntry();
}

final class MyListingsEntry extends ScreenEntry {
  const MyListingsEntry();
}

final class NotificationsEntry extends ScreenEntry {
  const NotificationsEntry();
}

final class NotificationSettingsEntry extends ScreenEntry {
  const NotificationSettingsEntry();
}

final class SearchEntry extends ScreenEntry {
  const SearchEntry();
}

final class SearchResultsEntry extends ScreenEntry {
  const SearchResultsEntry();
}

final class SettingsEntry extends ScreenEntry {
  const SettingsEntry();
}

final class AccountSettingsEntry extends ScreenEntry {
  const AccountSettingsEntry();
}

final class SecurityEntry extends ScreenEntry {
  const SecurityEntry();
}

final class TwoFactorSettingsEntry extends ScreenEntry {
  const TwoFactorSettingsEntry();
}

final class PrivacyEntry extends ScreenEntry {
  const PrivacyEntry();
}

final class AppearanceEntry extends ScreenEntry {
  const AppearanceEntry();
}

final class LanguageEntry extends ScreenEntry {
  const LanguageEntry();
}

final class ConnectedAppsEntry extends ScreenEntry {
  const ConnectedAppsEntry();
}

final class AboutEntry extends ScreenEntry {
  const AboutEntry();
}

final class HelpEntry extends ScreenEntry {
  const HelpEntry();
}

final class HelpCategoryEntry extends ScreenEntry {
  const HelpCategoryEntry(this.id);
  final String id;
}

final class FaqEntry extends ScreenEntry {
  const FaqEntry();
}

final class FaqArticleEntry extends ScreenEntry {
  const FaqArticleEntry(this.id);
  final String id;
}

final class FeedbackEntry extends ScreenEntry {
  const FeedbackEntry();
}

final class BlockedUsersEntry extends ScreenEntry {
  const BlockedUsersEntry();
}

final class DevicesEntry extends ScreenEntry {
  const DevicesEntry();
}

final class DeviceEntry extends ScreenEntry {
  const DeviceEntry(this.id);
  final String id;
}

final class SessionsEntry extends ScreenEntry {
  const SessionsEntry();
}

final class SessionEntry extends ScreenEntry {
  const SessionEntry(this.id);
  final String id;
}

final class DataExportEntry extends ScreenEntry {
  const DataExportEntry();
}

final class DeleteAccountEntry extends ScreenEntry {
  const DeleteAccountEntry();
}

final class WorkspaceEntry extends ScreenEntry {
  const WorkspaceEntry();
}

final class ProjectEntry extends ScreenEntry {
  const ProjectEntry(this.id);
  final String id;
}

final class BoardEntry extends ScreenEntry {
  const BoardEntry(this.id);
  final String id;
}

final class TaskListEntry extends ScreenEntry {
  const TaskListEntry(this.id);
  final String id;
}

final class TaskEntry extends ScreenEntry {
  const TaskEntry(this.id);
  final String id;
}

final class SubtaskEntry extends ScreenEntry {
  const SubtaskEntry(this.id);
  final String id;
}

final class ChecklistItemEntry extends ScreenEntry {
  const ChecklistItemEntry(this.id);
  final String id;
}

final class EditTaskEntry extends ScreenEntry {
  const EditTaskEntry(this.id);
  final String id;
}

final class TaskCommentEntry extends ScreenEntry {
  const TaskCommentEntry(this.id);
  final String id;
}

final class AssigneeEntry extends ScreenEntry {
  const AssigneeEntry(this.id);
  final String id;
}

final class LabelEntry extends ScreenEntry {
  const LabelEntry(this.id);
  final String id;
}

final class MilestoneEntry extends ScreenEntry {
  const MilestoneEntry(this.id);
  final String id;
}

final class SprintEntry extends ScreenEntry {
  const SprintEntry(this.id);
  final String id;
}

final class ForumEntry extends ScreenEntry {
  const ForumEntry();
}

final class ForumCategoryEntry extends ScreenEntry {
  const ForumCategoryEntry(this.id);
  final String id;
}

final class ForumThreadEntry extends ScreenEntry {
  const ForumThreadEntry(this.id);
  final String id;
}

final class ForumReplyEntry extends ScreenEntry {
  const ForumReplyEntry(this.id);
  final String id;
}

final class ReportThreadEntry extends ScreenEntry {
  const ReportThreadEntry(this.id);
  final String id;
}

final class LearnEntry extends ScreenEntry {
  const LearnEntry();
}

final class CourseEntry extends ScreenEntry {
  const CourseEntry(this.id);
  final String id;
}

final class CourseModuleEntry extends ScreenEntry {
  const CourseModuleEntry(this.id);
  final String id;
}

final class LessonEntry extends ScreenEntry {
  const LessonEntry(this.id);
  final String id;
}

final class QuizEntry extends ScreenEntry {
  const QuizEntry(this.id);
  final String id;
}

final class QuestionEntry extends ScreenEntry {
  const QuestionEntry(this.id);
  final String id;
}

final class AnswerEntry extends ScreenEntry {
  const AnswerEntry(this.id);
  final String id;
}

final class CourseReviewEntry extends ScreenEntry {
  const CourseReviewEntry(this.id);
  final String id;
}

final class InstructorEntry extends ScreenEntry {
  const InstructorEntry(this.id);
  final String id;
}

final class CertificateEntry extends ScreenEntry {
  const CertificateEntry(this.id);
  final String id;
}

final class ShopEntry extends ScreenEntry {
  const ShopEntry();
}

final class ShopDeptEntry extends ScreenEntry {
  const ShopDeptEntry(this.id);
  final String id;
}

final class ShopCategoryEntry extends ScreenEntry {
  const ShopCategoryEntry(this.id);
  final String id;
}

final class ShopSubcategoryEntry extends ScreenEntry {
  const ShopSubcategoryEntry(this.id);
  final String id;
}

final class ProductEntry extends ScreenEntry {
  const ProductEntry(this.id);
  final String id;
}

final class ProductVariantEntry extends ScreenEntry {
  const ProductVariantEntry(this.id);
  final String id;
}

final class ProductReviewEntry extends ScreenEntry {
  const ProductReviewEntry(this.id);
  final String id;
}

final class BrandEntry extends ScreenEntry {
  const BrandEntry(this.id);
  final String id;
}

final class CompareProductsEntry extends ScreenEntry {
  const CompareProductsEntry();
}

final class ActivityEntry extends ScreenEntry {
  const ActivityEntry();
}

final class WorkoutEntry extends ScreenEntry {
  const WorkoutEntry(this.id);
  final String id;
}

final class ExerciseEntry extends ScreenEntry {
  const ExerciseEntry(this.id);
  final String id;
}

final class ExerciseSetEntry extends ScreenEntry {
  const ExerciseSetEntry(this.id);
  final String id;
}

final class DeepDemoEntry extends ScreenEntry {
  const DeepDemoEntry();
}

final class LevelAEntry extends ScreenEntry {
  const LevelAEntry(this.id);
  final String id;
}

final class LevelBEntry extends ScreenEntry {
  const LevelBEntry(this.id);
  final String id;
}

final class LevelCEntry extends ScreenEntry {
  const LevelCEntry(this.id);
  final String id;
}

final class LevelDEntry extends ScreenEntry {
  const LevelDEntry(this.id);
  final String id;
}

final class LevelEEntry extends ScreenEntry {
  const LevelEEntry(this.id);
  final String id;
}

final class LevelFEntry extends ScreenEntry {
  const LevelFEntry(this.id);
  final String id;
}

final class IntegrationsEntry extends ScreenEntry {
  const IntegrationsEntry();
}

final class ApiKeysEntry extends ScreenEntry {
  const ApiKeysEntry();
}

final class StudioEntry extends ScreenEntry {
  const StudioEntry();
}

final class AnalyticsEntry extends ScreenEntry {
  const AnalyticsEntry();
}

final class AudienceEntry extends ScreenEntry {
  const AudienceEntry();
}

final class ScheduledEntry extends ScreenEntry {
  const ScheduledEntry();
}

final class ScheduledPostEntry extends ScreenEntry {
  const ScheduledPostEntry(this.id);
  final String id;
}

final class EditScheduledEntry extends ScreenEntry {
  const EditScheduledEntry(this.id);
  final String id;
}

final class MonetizationEntry extends ScreenEntry {
  const MonetizationEntry();
}

final class PayoutsEntry extends ScreenEntry {
  const PayoutsEntry();
}

final class EventsEntry extends ScreenEntry {
  const EventsEntry();
}

final class EventEntry extends ScreenEntry {
  const EventEntry(this.id);
  final String id;
}

final class AttendeesEntry extends ScreenEntry {
  const AttendeesEntry(this.id);
  final String id;
}

final class EditEventEntry extends ScreenEntry {
  const EditEventEntry(this.id);
  final String id;
}

final class CreateEventEntry extends ScreenEntry {
  const CreateEventEntry();
}

final class TicketsEntry extends ScreenEntry {
  const TicketsEntry(this.id);
  final String id;
}

final class SupportEntry extends ScreenEntry {
  const SupportEntry();
}

final class SupportTicketsEntry extends ScreenEntry {
  const SupportTicketsEntry();
}

final class SupportTicketEntry extends ScreenEntry {
  const SupportTicketEntry(this.id);
  final String id;
}

final class NewTicketEntry extends ScreenEntry {
  const NewTicketEntry();
}

final class KnowledgeBaseEntry extends ScreenEntry {
  const KnowledgeBaseEntry();
}

final class ArticleEntry extends ScreenEntry {
  const ArticleEntry(this.id);
  final String id;
}

final class AdminEntry extends ScreenEntry {
  const AdminEntry();
}

final class AdminUsersEntry extends ScreenEntry {
  const AdminUsersEntry();
}

final class AdminUserEntry extends ScreenEntry {
  const AdminUserEntry(this.id);
  final String id;
}

final class AdminAuditLogEntry extends ScreenEntry {
  const AdminAuditLogEntry();
}

final class AdminRoleEntry extends ScreenEntry {
  const AdminRoleEntry(this.id);
  final String id;
}

final class AdminFeatureFlagsEntry extends ScreenEntry {
  const AdminFeatureFlagsEntry();
}

final class WebhooksEntry extends ScreenEntry {
  const WebhooksEntry();
}

final class WebhookEntry extends ScreenEntry {
  const WebhookEntry(this.id);
  final String id;
}

ScreenEntry _entryOf(Enum s, Object? id) => switch (s) {
  _Screens.splash => const SplashEntry(),
  _Screens.signIn => const SignInEntry(),
  _Screens.signUp => const SignUpEntry(),
  _Screens.onboarding => const OnboardingEntry(),
  _Screens.forgotPassword => const ForgotPasswordEntry(),
  _Screens.resetPassword => ResetPasswordEntry(id as String),
  _Screens.verifyEmail => const VerifyEmailEntry(),
  _Screens.twoFactor => const TwoFactorEntry(),
  _Screens.home => const HomeEntry(),
  _Screens.feed => const FeedEntry(),
  _Screens.composePost => const ComposePostEntry(),
  _Screens.story => StoryEntry(id as String),
  _Screens.post => PostEntry(id as String),
  _Screens.comment => CommentEntry(id as String),
  _Screens.postAuthor => PostAuthorEntry(id as String),
  _Screens.postComments => PostCommentsEntry(id as String),
  _Screens.postLikes => PostLikesEntry(id as String),
  _Screens.editPost => EditPostEntry(id as String),
  _Screens.repost => RepostEntry(id as String),
  _Screens.discover => const DiscoverEntry(),
  _Screens.trending => const TrendingEntry(),
  _Screens.topics => const TopicsEntry(),
  _Screens.topic => TopicEntry(id as String),
  _Screens.subtopic => SubtopicEntry(id as String),
  _Screens.hashtag => HashtagEntry(id as String),
  _Screens.liveNow => const LiveNowEntry(),
  _Screens.liveRoom => LiveRoomEntry(id as String),
  _Screens.nearby => const NearbyEntry(),
  _Screens.marketplace => const MarketplaceEntry(),
  _Screens.categories => const CategoriesEntry(),
  _Screens.category => CategoryEntry(id as String),
  _Screens.listing => ListingEntry(id as String),
  _Screens.listingVariant => ListingVariantEntry(id as String),
  _Screens.editListing => EditListingEntry(id as String),
  _Screens.sellerProfile => SellerProfileEntry(id as String),
  _Screens.cart => const CartEntry(),
  _Screens.checkout => CheckoutEntry(id as String),
  _Screens.orderConfirmation => OrderConfirmationEntry(id as String),
  _Screens.myOrders => const MyOrdersEntry(),
  _Screens.order => OrderEntry(id as String),
  _Screens.wishlist => const WishlistEntry(),
  _Screens.messages => const MessagesEntry(),
  _Screens.chats => const ChatsEntry(),
  _Screens.chat => ChatEntry(id as String),
  _Screens.thread => ThreadEntry(id as String),
  _Screens.message => MessageEntry(id as String),
  _Screens.messageReply => MessageReplyEntry(id as String),
  _Screens.voiceCall => VoiceCallEntry(id as String),
  _Screens.newChat => const NewChatEntry(),
  _Screens.groupChat => GroupChatEntry(id as String),
  _Screens.groupInfo => GroupInfoEntry(id as String),
  _Screens.wallet => const WalletEntry(),
  _Screens.balance => const BalanceEntry(),
  _Screens.accounts => const AccountsEntry(),
  _Screens.account => AccountEntry(id as String),
  _Screens.transactions => const TransactionsEntry(),
  _Screens.transaction => TransactionEntry(id as String),
  _Screens.transactionItem => TransactionItemEntry(id as String),
  _Screens.sendMoney => const SendMoneyEntry(),
  _Screens.receiveMoney => const ReceiveMoneyEntry(),
  _Screens.paymentMethods => const PaymentMethodsEntry(),
  _Screens.addCard => const AddCardEntry(),
  _Screens.card => CardEntry(id as String),
  _Screens.statements => const StatementsEntry(),
  _Screens.statement => StatementEntry(id as String),
  _Screens.profile => const ProfileEntry(),
  _Screens.userProfile => UserProfileEntry(id as String),
  _Screens.followers => FollowersEntry(id as String),
  _Screens.following => FollowingEntry(id as String),
  _Screens.connection => ConnectionEntry(id as String),
  _Screens.mutualConnections => const MutualConnectionsEntry(),
  _Screens.editProfile => const EditProfileEntry(),
  _Screens.achievements => const AchievementsEntry(),
  _Screens.badges => const BadgesEntry(),
  _Screens.badge => BadgeEntry(id as String),
  _Screens.savedPosts => const SavedPostsEntry(),
  _Screens.drafts => const DraftsEntry(),
  _Screens.myListings => const MyListingsEntry(),
  _Screens.notifications => const NotificationsEntry(),
  _Screens.notificationSettings => const NotificationSettingsEntry(),
  _Screens.search => const SearchEntry(),
  _Screens.searchResults => const SearchResultsEntry(),
  _Screens.settings => const SettingsEntry(),
  _Screens.accountSettings => const AccountSettingsEntry(),
  _Screens.security => const SecurityEntry(),
  _Screens.twoFactorSettings => const TwoFactorSettingsEntry(),
  _Screens.privacy => const PrivacyEntry(),
  _Screens.appearance => const AppearanceEntry(),
  _Screens.language => const LanguageEntry(),
  _Screens.connectedApps => const ConnectedAppsEntry(),
  _Screens.about => const AboutEntry(),
  _Screens.help => const HelpEntry(),
  _Screens.helpCategory => HelpCategoryEntry(id as String),
  _Screens.faq => const FaqEntry(),
  _Screens.faqArticle => FaqArticleEntry(id as String),
  _Screens.feedback => const FeedbackEntry(),
  _Screens.blockedUsers => const BlockedUsersEntry(),
  _Screens.devices => const DevicesEntry(),
  _Screens.device => DeviceEntry(id as String),
  _Screens.sessions => const SessionsEntry(),
  _Screens.session => SessionEntry(id as String),
  _Screens.dataExport => const DataExportEntry(),
  _Screens.deleteAccount => const DeleteAccountEntry(),
  _Screens.workspace => const WorkspaceEntry(),
  _Screens.project => ProjectEntry(id as String),
  _Screens.board => BoardEntry(id as String),
  _Screens.taskList => TaskListEntry(id as String),
  _Screens.task => TaskEntry(id as String),
  _Screens.subtask => SubtaskEntry(id as String),
  _Screens.checklistItem => ChecklistItemEntry(id as String),
  _Screens.editTask => EditTaskEntry(id as String),
  _Screens.taskComment => TaskCommentEntry(id as String),
  _Screens.assignee => AssigneeEntry(id as String),
  _Screens.label => LabelEntry(id as String),
  _Screens.milestone => MilestoneEntry(id as String),
  _Screens.sprint => SprintEntry(id as String),
  _Screens.forum => const ForumEntry(),
  _Screens.forumCategory => ForumCategoryEntry(id as String),
  _Screens.forumThread => ForumThreadEntry(id as String),
  _Screens.forumReply => ForumReplyEntry(id as String),
  _Screens.reportThread => ReportThreadEntry(id as String),
  _Screens.learn => const LearnEntry(),
  _Screens.course => CourseEntry(id as String),
  _Screens.courseModule => CourseModuleEntry(id as String),
  _Screens.lesson => LessonEntry(id as String),
  _Screens.quiz => QuizEntry(id as String),
  _Screens.question => QuestionEntry(id as String),
  _Screens.answer => AnswerEntry(id as String),
  _Screens.courseReview => CourseReviewEntry(id as String),
  _Screens.instructor => InstructorEntry(id as String),
  _Screens.certificate => CertificateEntry(id as String),
  _Screens.shop => const ShopEntry(),
  _Screens.shopDept => ShopDeptEntry(id as String),
  _Screens.shopCategory => ShopCategoryEntry(id as String),
  _Screens.shopSubcategory => ShopSubcategoryEntry(id as String),
  _Screens.product => ProductEntry(id as String),
  _Screens.productVariant => ProductVariantEntry(id as String),
  _Screens.productReview => ProductReviewEntry(id as String),
  _Screens.brand => BrandEntry(id as String),
  _Screens.compareProducts => const CompareProductsEntry(),
  _Screens.activity => const ActivityEntry(),
  _Screens.workout => WorkoutEntry(id as String),
  _Screens.exercise => ExerciseEntry(id as String),
  _Screens.exerciseSet => ExerciseSetEntry(id as String),
  _Screens.deepDemo => const DeepDemoEntry(),
  _Screens.levelA => LevelAEntry(id as String),
  _Screens.levelB => LevelBEntry(id as String),
  _Screens.levelC => LevelCEntry(id as String),
  _Screens.levelD => LevelDEntry(id as String),
  _Screens.levelE => LevelEEntry(id as String),
  _Screens.levelF => LevelFEntry(id as String),
  _Screens.integrations => const IntegrationsEntry(),
  _Screens.apiKeys => const ApiKeysEntry(),
  CreatorStudio.studio => const StudioEntry(),
  CreatorStudio.analytics => const AnalyticsEntry(),
  CreatorStudio.audience => const AudienceEntry(),
  CreatorStudio.scheduled => const ScheduledEntry(),
  CreatorStudio.scheduledPost => ScheduledPostEntry(id as String),
  CreatorStudio.editScheduled => EditScheduledEntry(id as String),
  CreatorStudio.monetization => const MonetizationEntry(),
  CreatorStudio.payouts => const PayoutsEntry(),
  Events.events => const EventsEntry(),
  Events.event => EventEntry(id as String),
  Events.attendees => AttendeesEntry(id as String),
  Events.editEvent => EditEventEntry(id as String),
  Events.createEvent => const CreateEventEntry(),
  Events.tickets => TicketsEntry(id as String),
  Support.support => const SupportEntry(),
  Support.supportTickets => const SupportTicketsEntry(),
  Support.supportTicket => SupportTicketEntry(id as String),
  Support.newTicket => const NewTicketEntry(),
  Support.knowledgeBase => const KnowledgeBaseEntry(),
  Support.article => ArticleEntry(id as String),
  Admin.admin => const AdminEntry(),
  Admin.adminUsers => const AdminUsersEntry(),
  Admin.adminUser => AdminUserEntry(id as String),
  Admin.adminAuditLog => const AdminAuditLogEntry(),
  Admin.adminRole => AdminRoleEntry(id as String),
  Admin.adminFeatureFlags => const AdminFeatureFlagsEntry(),
  Admin.webhooks => const WebhooksEntry(),
  Admin.webhook => WebhookEntry(id as String),
  _ => throw StateError('not a _Screens screen'),
};

final class Hop<N extends AnyNav> {
  const Hop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;

  /// The root-down chain this hop replays. A single kick-start is one
  /// segment; a navigable `Place` (a `Place`) overrides it with its
  /// full path, so `Screen.go` lands the whole placement.
  List<(Enum, Object?)> get chain => [(spec, id)];
  static const splash = Hop<SplashNav>._(_Screens.splash, null, SplashNav._());
  static const signIn = Hop<SignInNav>._(_Screens.signIn, null, SignInNav._());
  static const signUp = Hop<SignUpNav>._(_Screens.signUp, null, SignUpNav._());
  static const onboarding = Hop<OnboardingNav>._(
    _Screens.onboarding,
    null,
    OnboardingNav._(),
  );
  static const forgotPassword = Hop<ForgotPasswordNav>._(
    _Screens.forgotPassword,
    null,
    ForgotPasswordNav._(),
  );
  static Hop<ResetPasswordNav> resetPassword(String id) =>
      Hop._(_Screens.resetPassword, id, const ResetPasswordNav._());
  static const verifyEmail = Hop<VerifyEmailNav>._(
    _Screens.verifyEmail,
    null,
    VerifyEmailNav._(),
  );
  static const twoFactor = Hop<TwoFactorNav>._(
    _Screens.twoFactor,
    null,
    TwoFactorNav._(),
  );
  static const home = Hop<HomeNav>._(_Screens.home, null, HomeNav._());
  static const feed = Hop<FeedNav>._(_Screens.feed, null, FeedNav._());
  static const composePost = Hop<ComposePostNav>._(
    _Screens.composePost,
    null,
    ComposePostNav._(),
  );
  static Hop<StoryNav> story(String id) =>
      Hop._(_Screens.story, id, const StoryNav._());
  static Hop<PostNav> post(String id) =>
      Hop._(_Screens.post, id, const PostNav._());
  static const discover = Hop<DiscoverNav>._(
    _Screens.discover,
    null,
    DiscoverNav._(),
  );
  static const trending = Hop<TrendingNav>._(
    _Screens.trending,
    null,
    TrendingNav._(),
  );
  static const topics = Hop<TopicsNav>._(_Screens.topics, null, TopicsNav._());
  static Hop<TopicNav> topic(String id) =>
      Hop._(_Screens.topic, id, const TopicNav._());
  static Hop<HashtagNav> hashtag(String id) =>
      Hop._(_Screens.hashtag, id, const HashtagNav._());
  static const liveNow = Hop<LiveNowNav>._(
    _Screens.liveNow,
    null,
    LiveNowNav._(),
  );
  static Hop<LiveRoomNav> liveRoom(String id) =>
      Hop._(_Screens.liveRoom, id, const LiveRoomNav._());
  static const nearby = Hop<NearbyNav>._(_Screens.nearby, null, NearbyNav._());
  static const marketplace = Hop<MarketplaceNav>._(
    _Screens.marketplace,
    null,
    MarketplaceNav._(),
  );
  static const categories = Hop<CategoriesNav>._(
    _Screens.categories,
    null,
    CategoriesNav._(),
  );
  static Hop<CategoryNav> category(String id) =>
      Hop._(_Screens.category, id, const CategoryNav._());
  static const cart = Hop<CartNav>._(_Screens.cart, null, CartNav._());
  static Hop<CheckoutNav> checkout(String id) =>
      Hop._(_Screens.checkout, id, const CheckoutNav._());
  static const myOrders = Hop<MyOrdersNav>._(
    _Screens.myOrders,
    null,
    MyOrdersNav._(),
  );
  static Hop<OrderNav> order(String id) =>
      Hop._(_Screens.order, id, const OrderNav._());
  static const wishlist = Hop<WishlistNav>._(
    _Screens.wishlist,
    null,
    WishlistNav._(),
  );
  static const messages = Hop<MessagesNav>._(
    _Screens.messages,
    null,
    MessagesNav._(),
  );
  static const chats = Hop<ChatsNav>._(_Screens.chats, null, ChatsNav._());
  static Hop<ChatNav> chat(String id) =>
      Hop._(_Screens.chat, id, const ChatNav._());
  static const newChat = Hop<NewChatNav>._(
    _Screens.newChat,
    null,
    NewChatNav._(),
  );
  static Hop<GroupChatNav> groupChat(String id) =>
      Hop._(_Screens.groupChat, id, const GroupChatNav._());
  static const wallet = Hop<WalletNav>._(_Screens.wallet, null, WalletNav._());
  static const balance = Hop<BalanceNav>._(
    _Screens.balance,
    null,
    BalanceNav._(),
  );
  static const accounts = Hop<AccountsNav>._(
    _Screens.accounts,
    null,
    AccountsNav._(),
  );
  static Hop<AccountNav> account(String id) =>
      Hop._(_Screens.account, id, const AccountNav._());
  static const sendMoney = Hop<SendMoneyNav>._(
    _Screens.sendMoney,
    null,
    SendMoneyNav._(),
  );
  static const receiveMoney = Hop<ReceiveMoneyNav>._(
    _Screens.receiveMoney,
    null,
    ReceiveMoneyNav._(),
  );
  static const paymentMethods = Hop<PaymentMethodsNav>._(
    _Screens.paymentMethods,
    null,
    PaymentMethodsNav._(),
  );
  static const addCard = Hop<AddCardNav>._(
    _Screens.addCard,
    null,
    AddCardNav._(),
  );
  static Hop<CardNav> card(String id) =>
      Hop._(_Screens.card, id, const CardNav._());
  static const profile = Hop<ProfileNav>._(
    _Screens.profile,
    null,
    ProfileNav._(),
  );
  static Hop<FollowersNav> followers(String id) =>
      Hop._(_Screens.followers, id, const FollowersNav._());
  static Hop<FollowingNav> following(String id) =>
      Hop._(_Screens.following, id, const FollowingNav._());
  static const editProfile = Hop<EditProfileNav>._(
    _Screens.editProfile,
    null,
    EditProfileNav._(),
  );
  static const achievements = Hop<AchievementsNav>._(
    _Screens.achievements,
    null,
    AchievementsNav._(),
  );
  static const badges = Hop<BadgesNav>._(_Screens.badges, null, BadgesNav._());
  static Hop<BadgeNav> badge(String id) =>
      Hop._(_Screens.badge, id, const BadgeNav._());
  static const savedPosts = Hop<SavedPostsNav>._(
    _Screens.savedPosts,
    null,
    SavedPostsNav._(),
  );
  static const drafts = Hop<DraftsNav>._(_Screens.drafts, null, DraftsNav._());
  static const myListings = Hop<MyListingsNav>._(
    _Screens.myListings,
    null,
    MyListingsNav._(),
  );
  static const notifications = Hop<NotificationsNav>._(
    _Screens.notifications,
    null,
    NotificationsNav._(),
  );
  static const notificationSettings = Hop<NotificationSettingsNav>._(
    _Screens.notificationSettings,
    null,
    NotificationSettingsNav._(),
  );
  static const search = Hop<SearchNav>._(_Screens.search, null, SearchNav._());
  static const searchResults = Hop<SearchResultsNav>._(
    _Screens.searchResults,
    null,
    SearchResultsNav._(),
  );
  static const settings = Hop<SettingsNav>._(
    _Screens.settings,
    null,
    SettingsNav._(),
  );
  static const accountSettings = Hop<AccountSettingsNav>._(
    _Screens.accountSettings,
    null,
    AccountSettingsNav._(),
  );
  static const security = Hop<SecurityNav>._(
    _Screens.security,
    null,
    SecurityNav._(),
  );
  static const twoFactorSettings = Hop<TwoFactorSettingsNav>._(
    _Screens.twoFactorSettings,
    null,
    TwoFactorSettingsNav._(),
  );
  static const privacy = Hop<PrivacyNav>._(
    _Screens.privacy,
    null,
    PrivacyNav._(),
  );
  static const appearance = Hop<AppearanceNav>._(
    _Screens.appearance,
    null,
    AppearanceNav._(),
  );
  static const language = Hop<LanguageNav>._(
    _Screens.language,
    null,
    LanguageNav._(),
  );
  static const connectedApps = Hop<ConnectedAppsNav>._(
    _Screens.connectedApps,
    null,
    ConnectedAppsNav._(),
  );
  static const about = Hop<AboutNav>._(_Screens.about, null, AboutNav._());
  static const help = Hop<HelpNav>._(_Screens.help, null, HelpNav._());
  static Hop<HelpCategoryNav> helpCategory(String id) =>
      Hop._(_Screens.helpCategory, id, const HelpCategoryNav._());
  static const feedback = Hop<FeedbackNav>._(
    _Screens.feedback,
    null,
    FeedbackNav._(),
  );
  static const blockedUsers = Hop<BlockedUsersNav>._(
    _Screens.blockedUsers,
    null,
    BlockedUsersNav._(),
  );
  static const devices = Hop<DevicesNav>._(
    _Screens.devices,
    null,
    DevicesNav._(),
  );
  static Hop<DeviceNav> device(String id) =>
      Hop._(_Screens.device, id, const DeviceNav._());
  static const dataExport = Hop<DataExportNav>._(
    _Screens.dataExport,
    null,
    DataExportNav._(),
  );
  static const deleteAccount = Hop<DeleteAccountNav>._(
    _Screens.deleteAccount,
    null,
    DeleteAccountNav._(),
  );
  static const workspace = Hop<WorkspaceNav>._(
    _Screens.workspace,
    null,
    WorkspaceNav._(),
  );
  static Hop<ProjectNav> project(String id) =>
      Hop._(_Screens.project, id, const ProjectNav._());
  static const forum = Hop<ForumNav>._(_Screens.forum, null, ForumNav._());
  static Hop<ForumCategoryNav> forumCategory(String id) =>
      Hop._(_Screens.forumCategory, id, const ForumCategoryNav._());
  static const learn = Hop<LearnNav>._(_Screens.learn, null, LearnNav._());
  static Hop<CourseNav> course(String id) =>
      Hop._(_Screens.course, id, const CourseNav._());
  static const shop = Hop<ShopNav>._(_Screens.shop, null, ShopNav._());
  static Hop<ShopDeptNav> shopDept(String id) =>
      Hop._(_Screens.shopDept, id, const ShopDeptNav._());
  static const compareProducts = Hop<CompareProductsNav>._(
    _Screens.compareProducts,
    null,
    CompareProductsNav._(),
  );
  static const activity = Hop<ActivityNav>._(
    _Screens.activity,
    null,
    ActivityNav._(),
  );
  static Hop<WorkoutNav> workout(String id) =>
      Hop._(_Screens.workout, id, const WorkoutNav._());
  static const deepDemo = Hop<DeepDemoNav>._(
    _Screens.deepDemo,
    null,
    DeepDemoNav._(),
  );
  static Hop<LevelANav> levelA(String id) =>
      Hop._(_Screens.levelA, id, const LevelANav._());
  static const integrations = Hop<IntegrationsNav>._(
    _Screens.integrations,
    null,
    IntegrationsNav._(),
  );
  static const apiKeys = Hop<ApiKeysNav>._(
    _Screens.apiKeys,
    null,
    ApiKeysNav._(),
  );
  static const studio = Hop<StudioNav>._(
    CreatorStudio.studio,
    null,
    StudioNav._(),
  );
  static const analytics = Hop<AnalyticsNav>._(
    CreatorStudio.analytics,
    null,
    AnalyticsNav._(),
  );
  static const audience = Hop<AudienceNav>._(
    CreatorStudio.audience,
    null,
    AudienceNav._(),
  );
  static const scheduled = Hop<ScheduledNav>._(
    CreatorStudio.scheduled,
    null,
    ScheduledNav._(),
  );
  static Hop<ScheduledPostNav> scheduledPost(String id) =>
      Hop._(CreatorStudio.scheduledPost, id, const ScheduledPostNav._());
  static const monetization = Hop<MonetizationNav>._(
    CreatorStudio.monetization,
    null,
    MonetizationNav._(),
  );
  static const payouts = Hop<PayoutsNav>._(
    CreatorStudio.payouts,
    null,
    PayoutsNav._(),
  );
  static const events = Hop<EventsNav>._(Events.events, null, EventsNav._());
  static Hop<EventNav> event(String id) =>
      Hop._(Events.event, id, const EventNav._());
  static const createEvent = Hop<CreateEventNav>._(
    Events.createEvent,
    null,
    CreateEventNav._(),
  );
  static const support = Hop<SupportNav>._(
    Support.support,
    null,
    SupportNav._(),
  );
  static const supportTickets = Hop<SupportTicketsNav>._(
    Support.supportTickets,
    null,
    SupportTicketsNav._(),
  );
  static Hop<SupportTicketNav> supportTicket(String id) =>
      Hop._(Support.supportTicket, id, const SupportTicketNav._());
  static const newTicket = Hop<NewTicketNav>._(
    Support.newTicket,
    null,
    NewTicketNav._(),
  );
  static const knowledgeBase = Hop<KnowledgeBaseNav>._(
    Support.knowledgeBase,
    null,
    KnowledgeBaseNav._(),
  );
  static Hop<ArticleNav> article(String id) =>
      Hop._(Support.article, id, const ArticleNav._());
  static const admin = Hop<AdminNav>._(Admin.admin, null, AdminNav._());
  static const adminUsers = Hop<AdminUsersNav>._(
    Admin.adminUsers,
    null,
    AdminUsersNav._(),
  );
  static Hop<AdminUserNav> adminUser(String id) =>
      Hop._(Admin.adminUser, id, const AdminUserNav._());
  static const adminAuditLog = Hop<AdminAuditLogNav>._(
    Admin.adminAuditLog,
    null,
    AdminAuditLogNav._(),
  );
  static const adminFeatureFlags = Hop<AdminFeatureFlagsNav>._(
    Admin.adminFeatureFlags,
    null,
    AdminFeatureFlagsNav._(),
  );
  static const webhooks = Hop<WebhooksNav>._(
    Admin.webhooks,
    null,
    WebhooksNav._(),
  );
  static Hop<WebhookNav> webhook(String id) =>
      Hop._(Admin.webhook, id, const WebhookNav._());
}

/// The root/boot placement: `Screen.current` returns it until the first
/// commit. `if (Screen.current case Root()) ...` gates blob-null cold-boot UI.
final class Root extends AnyPlacement {
  const Root._() : super._();
}

final class On<N extends AnyNav, V> {
  const On._(this.specs, this.ids, this.nav, [this.conds = const []]);
  final List<Enum> specs;
  final List<Object?> ids;

  /// The exact nav for a single-placement terminal; null for a multi-
  /// placement one — `Screen.on` resolves it from the live chain.
  final N? nav;

  /// View-state conditions on the terminal screen (`.query`/`.fragment`).
  final List<ViewCond> conds;
  static On<SplashNav, AnyView> get splash =>
      On._([_Screens.splash], [null], const SplashNav._());
  static On<SignInNav, AnyView> get signIn =>
      On._([_Screens.signIn], [null], const SignInNav._());
  static On<SignUpNav, AnyView> get signUp =>
      On._([_Screens.signUp], [null], const SignUpNav._());
  static On<OnboardingNav, AnyView> get onboarding =>
      On._([_Screens.onboarding], [null], const OnboardingNav._());
  static OnForgotPassword get forgotPassword => OnForgotPassword._(
    [_Screens.forgotPassword],
    [null],
    const ForgotPasswordNav._(),
  );
  static OnResetPassword get resetPassword => OnResetPassword._(
    [_Screens.resetPassword],
    [null],
    const ResetPasswordNav._(),
  );
  static On<VerifyEmailNav, AnyView> get verifyEmail =>
      On._([_Screens.verifyEmail], [null], const VerifyEmailNav._());
  static On<TwoFactorNav, AnyView> get twoFactor =>
      On._([_Screens.twoFactor], [null], const TwoFactorNav._());
  static OnHome get home =>
      OnHome._([_Screens.home], [null], const HomeNav._());
  static OnFeed get feed =>
      OnFeed._([_Screens.feed], [null], const FeedNav._());
  static On<ComposePostNav, AnyView> get composePost =>
      On._([_Screens.composePost], [null], const ComposePostNav._());
  static OnStory get story =>
      OnStory._([_Screens.story], [null], const StoryNav._());
  static OnPost get post =>
      OnPost._([_Screens.post], [null], const PostNav._());
  static OnComment get comment =>
      OnComment._([_Screens.comment], [null], const CommentNav._());
  static OnPostAuthor get postAuthor =>
      OnPostAuthor._([_Screens.postAuthor], [null], const PostAuthorNav._());
  static OnPostComments get postComments => OnPostComments._(
    [_Screens.postComments],
    [null],
    const PostCommentsNav._(),
  );
  static OnPostLikes get postLikes =>
      OnPostLikes._([_Screens.postLikes], [null], const PostLikesNav._());
  static OnEditPost get editPost =>
      OnEditPost._([_Screens.editPost], [null], const EditPostNav._());
  static OnRepost get repost =>
      OnRepost._([_Screens.repost], [null], const RepostNav._());
  static OnDiscover get discover =>
      OnDiscover._([_Screens.discover], [null], const DiscoverNav._());
  static OnTrending get trending =>
      OnTrending._([_Screens.trending], [null], const TrendingNav._());
  static On<TopicsNav, AnyView> get topics =>
      On._([_Screens.topics], [null], const TopicsNav._());
  static OnTopic get topic =>
      OnTopic._([_Screens.topic], [null], const TopicNav._());
  static OnSubtopic get subtopic =>
      OnSubtopic._([_Screens.subtopic], [null], const SubtopicNav._());
  static OnHashtag get hashtag =>
      OnHashtag._([_Screens.hashtag], [null], const HashtagNav._());
  static OnLiveNow get liveNow =>
      OnLiveNow._([_Screens.liveNow], [null], const LiveNowNav._());
  static OnLiveRoom get liveRoom =>
      OnLiveRoom._([_Screens.liveRoom], [null], const LiveRoomNav._());
  static On<NearbyNav, AnyView> get nearby =>
      On._([_Screens.nearby], [null], const NearbyNav._());
  static OnMarketplace get marketplace =>
      OnMarketplace._([_Screens.marketplace], [null], const MarketplaceNav._());
  static OnCategories get categories =>
      OnCategories._([_Screens.categories], [null], const CategoriesNav._());
  static OnCategory get category =>
      OnCategory._([_Screens.category], [null], const CategoryNav._());
  static OnListing get listing =>
      OnListing._([_Screens.listing], [null], const ListingNav._());
  static OnListingVariant get listingVariant => OnListingVariant._(
    [_Screens.listingVariant],
    [null],
    const ListingVariantNav._(),
  );
  static OnEditListing get editListing =>
      OnEditListing._([_Screens.editListing], [null], const EditListingNav._());
  static OnSellerProfile get sellerProfile => OnSellerProfile._(
    [_Screens.sellerProfile],
    [null],
    const SellerProfileNav._(),
  );
  static OnCart get cart =>
      OnCart._([_Screens.cart], [null], const CartNav._());
  static OnCheckout get checkout =>
      OnCheckout._([_Screens.checkout], [null], const CheckoutNav._());
  static OnOrderConfirmation get orderConfirmation => OnOrderConfirmation._(
    [_Screens.orderConfirmation],
    [null],
    const OrderConfirmationNav._(),
  );
  static OnMyOrders get myOrders =>
      OnMyOrders._([_Screens.myOrders], [null], const MyOrdersNav._());
  static OnOrder get order =>
      OnOrder._([_Screens.order], [null], const OrderNav._());
  static On<WishlistNav, AnyView> get wishlist =>
      On._([_Screens.wishlist], [null], const WishlistNav._());
  static OnMessages get messages =>
      OnMessages._([_Screens.messages], [null], const MessagesNav._());
  static OnChats get chats =>
      OnChats._([_Screens.chats], [null], const ChatsNav._());
  static OnChat get chat =>
      OnChat._([_Screens.chat], [null], const ChatNav._());
  static OnThread get thread =>
      OnThread._([_Screens.thread], [null], const ThreadNav._());
  static OnMessage get message =>
      OnMessage._([_Screens.message], [null], const MessageNav._());
  static OnMessageReply get messageReply => OnMessageReply._(
    [_Screens.messageReply],
    [null],
    const MessageReplyNav._(),
  );
  static OnVoiceCall get voiceCall =>
      OnVoiceCall._([_Screens.voiceCall], [null], const VoiceCallNav._());
  static On<NewChatNav, AnyView> get newChat =>
      On._([_Screens.newChat], [null], const NewChatNav._());
  static OnGroupChat get groupChat =>
      OnGroupChat._([_Screens.groupChat], [null], const GroupChatNav._());
  static OnGroupInfo get groupInfo =>
      OnGroupInfo._([_Screens.groupInfo], [null], const GroupInfoNav._());
  static OnWallet get wallet =>
      OnWallet._([_Screens.wallet], [null], const WalletNav._());
  static On<BalanceNav, AnyView> get balance =>
      On._([_Screens.balance], [null], const BalanceNav._());
  static OnAccounts get accounts =>
      OnAccounts._([_Screens.accounts], [null], const AccountsNav._());
  static OnAccount get account =>
      OnAccount._([_Screens.account], [null], const AccountNav._());
  static OnTransactions get transactions => OnTransactions._(
    [_Screens.transactions],
    [null],
    const TransactionsNav._(),
  );
  static OnTransaction get transaction =>
      OnTransaction._([_Screens.transaction], [null], const TransactionNav._());
  static OnTransactionItem get transactionItem => OnTransactionItem._(
    [_Screens.transactionItem],
    [null],
    const TransactionItemNav._(),
  );
  static On<SendMoneyNav, AnyView> get sendMoney =>
      On._([_Screens.sendMoney], [null], const SendMoneyNav._());
  static On<ReceiveMoneyNav, AnyView> get receiveMoney =>
      On._([_Screens.receiveMoney], [null], const ReceiveMoneyNav._());
  static OnPaymentMethods get paymentMethods => OnPaymentMethods._(
    [_Screens.paymentMethods],
    [null],
    const PaymentMethodsNav._(),
  );
  static On<AddCardNav, AnyView> get addCard =>
      On._([_Screens.addCard], [null], const AddCardNav._());
  static OnCard get card =>
      OnCard._([_Screens.card], [null], const CardNav._());
  static OnStatements get statements =>
      OnStatements._([_Screens.statements], [null], const StatementsNav._());
  static OnStatement get statement =>
      OnStatement._([_Screens.statement], [null], const StatementNav._());
  static OnProfile get profile =>
      OnProfile._([_Screens.profile], [null], const ProfileNav._());
  static OnUserProfile get userProfile =>
      OnUserProfile._([_Screens.userProfile], [null], null);
  static OnFollowers get followers =>
      OnFollowers._([_Screens.followers], [null], const FollowersNav._());
  static OnFollowing get following =>
      OnFollowing._([_Screens.following], [null], const FollowingNav._());
  static OnConnection get connection =>
      OnConnection._([_Screens.connection], [null], const ConnectionNav._());
  static On<MutualConnectionsNav, AnyView> get mutualConnections => On._(
    [_Screens.mutualConnections],
    [null],
    const MutualConnectionsNav._(),
  );
  static On<EditProfileNav, AnyView> get editProfile =>
      On._([_Screens.editProfile], [null], const EditProfileNav._());
  static On<AchievementsNav, AnyView> get achievements =>
      On._([_Screens.achievements], [null], const AchievementsNav._());
  static OnBadges get badges =>
      OnBadges._([_Screens.badges], [null], const BadgesNav._());
  static OnBadge get badge =>
      OnBadge._([_Screens.badge], [null], const BadgeNav._());
  static On<SavedPostsNav, AnyView> get savedPosts =>
      On._([_Screens.savedPosts], [null], const SavedPostsNav._());
  static On<DraftsNav, AnyView> get drafts =>
      On._([_Screens.drafts], [null], const DraftsNav._());
  static On<MyListingsNav, AnyView> get myListings =>
      On._([_Screens.myListings], [null], const MyListingsNav._());
  static OnNotifications get notifications => OnNotifications._(
    [_Screens.notifications],
    [null],
    const NotificationsNav._(),
  );
  static On<NotificationSettingsNav, AnyView> get notificationSettings => On._(
    [_Screens.notificationSettings],
    [null],
    const NotificationSettingsNav._(),
  );
  static OnSearch get search =>
      OnSearch._([_Screens.search], [null], const SearchNav._());
  static On<SearchResultsNav, AnyView> get searchResults =>
      On._([_Screens.searchResults], [null], const SearchResultsNav._());
  static OnSettings get settings =>
      OnSettings._([_Screens.settings], [null], const SettingsNav._());
  static On<AccountSettingsNav, AnyView> get accountSettings =>
      On._([_Screens.accountSettings], [null], const AccountSettingsNav._());
  static OnSecurity get security =>
      OnSecurity._([_Screens.security], [null], const SecurityNav._());
  static On<TwoFactorSettingsNav, AnyView> get twoFactorSettings => On._(
    [_Screens.twoFactorSettings],
    [null],
    const TwoFactorSettingsNav._(),
  );
  static On<PrivacyNav, AnyView> get privacy =>
      On._([_Screens.privacy], [null], const PrivacyNav._());
  static On<AppearanceNav, AnyView> get appearance =>
      On._([_Screens.appearance], [null], const AppearanceNav._());
  static On<LanguageNav, AnyView> get language =>
      On._([_Screens.language], [null], const LanguageNav._());
  static On<ConnectedAppsNav, AnyView> get connectedApps =>
      On._([_Screens.connectedApps], [null], const ConnectedAppsNav._());
  static OnAbout get about =>
      OnAbout._([_Screens.about], [null], const AboutNav._());
  static OnHelp get help =>
      OnHelp._([_Screens.help], [null], const HelpNav._());
  static OnHelpCategory get helpCategory => OnHelpCategory._(
    [_Screens.helpCategory],
    [null],
    const HelpCategoryNav._(),
  );
  static OnFaq get faq => OnFaq._([_Screens.faq], [null], const FaqNav._());
  static OnFaqArticle get faqArticle =>
      OnFaqArticle._([_Screens.faqArticle], [null], const FaqArticleNav._());
  static On<FeedbackNav, AnyView> get feedback =>
      On._([_Screens.feedback], [null], const FeedbackNav._());
  static On<BlockedUsersNav, AnyView> get blockedUsers =>
      On._([_Screens.blockedUsers], [null], const BlockedUsersNav._());
  static OnDevices get devices =>
      OnDevices._([_Screens.devices], [null], const DevicesNav._());
  static OnDevice get device =>
      OnDevice._([_Screens.device], [null], const DeviceNav._());
  static On<SessionsNav, AnyView> get sessions =>
      On._([_Screens.sessions], [null], const SessionsNav._());
  static OnSession get session =>
      OnSession._([_Screens.session], [null], const SessionNav._());
  static On<DataExportNav, AnyView> get dataExport =>
      On._([_Screens.dataExport], [null], const DataExportNav._());
  static On<DeleteAccountNav, AnyView> get deleteAccount =>
      On._([_Screens.deleteAccount], [null], const DeleteAccountNav._());
  static OnWorkspace get workspace =>
      OnWorkspace._([_Screens.workspace], [null], const WorkspaceNav._());
  static OnProject get project =>
      OnProject._([_Screens.project], [null], const ProjectNav._());
  static OnBoard get board =>
      OnBoard._([_Screens.board], [null], const BoardNav._());
  static OnTaskList get taskList =>
      OnTaskList._([_Screens.taskList], [null], const TaskListNav._());
  static OnTask get task =>
      OnTask._([_Screens.task], [null], const TaskNav._());
  static OnSubtask get subtask =>
      OnSubtask._([_Screens.subtask], [null], const SubtaskNav._());
  static OnChecklistItem get checklistItem => OnChecklistItem._(
    [_Screens.checklistItem],
    [null],
    const ChecklistItemNav._(),
  );
  static OnEditTask get editTask =>
      OnEditTask._([_Screens.editTask], [null], const EditTaskNav._());
  static OnTaskComment get taskComment =>
      OnTaskComment._([_Screens.taskComment], [null], const TaskCommentNav._());
  static OnAssignee get assignee =>
      OnAssignee._([_Screens.assignee], [null], const AssigneeNav._());
  static OnLabel get label =>
      OnLabel._([_Screens.label], [null], const LabelNav._());
  static OnMilestone get milestone =>
      OnMilestone._([_Screens.milestone], [null], const MilestoneNav._());
  static OnSprint get sprint =>
      OnSprint._([_Screens.sprint], [null], const SprintNav._());
  static OnForum get forum =>
      OnForum._([_Screens.forum], [null], const ForumNav._());
  static OnForumCategory get forumCategory => OnForumCategory._(
    [_Screens.forumCategory],
    [null],
    const ForumCategoryNav._(),
  );
  static OnForumThread get forumThread =>
      OnForumThread._([_Screens.forumThread], [null], const ForumThreadNav._());
  static OnForumReply get forumReply =>
      OnForumReply._([_Screens.forumReply], [null], const ForumReplyNav._());
  static OnReportThread get reportThread => OnReportThread._(
    [_Screens.reportThread],
    [null],
    const ReportThreadNav._(),
  );
  static OnLearn get learn =>
      OnLearn._([_Screens.learn], [null], const LearnNav._());
  static OnCourse get course =>
      OnCourse._([_Screens.course], [null], const CourseNav._());
  static OnCourseModule get courseModule => OnCourseModule._(
    [_Screens.courseModule],
    [null],
    const CourseModuleNav._(),
  );
  static OnLesson get lesson =>
      OnLesson._([_Screens.lesson], [null], const LessonNav._());
  static OnQuiz get quiz =>
      OnQuiz._([_Screens.quiz], [null], const QuizNav._());
  static OnQuestion get question =>
      OnQuestion._([_Screens.question], [null], const QuestionNav._());
  static OnAnswer get answer =>
      OnAnswer._([_Screens.answer], [null], const AnswerNav._());
  static OnCourseReview get courseReview => OnCourseReview._(
    [_Screens.courseReview],
    [null],
    const CourseReviewNav._(),
  );
  static OnInstructor get instructor =>
      OnInstructor._([_Screens.instructor], [null], const InstructorNav._());
  static OnCertificate get certificate =>
      OnCertificate._([_Screens.certificate], [null], const CertificateNav._());
  static OnShop get shop =>
      OnShop._([_Screens.shop], [null], const ShopNav._());
  static OnShopDept get shopDept =>
      OnShopDept._([_Screens.shopDept], [null], const ShopDeptNav._());
  static OnShopCategory get shopCategory => OnShopCategory._(
    [_Screens.shopCategory],
    [null],
    const ShopCategoryNav._(),
  );
  static OnShopSubcategory get shopSubcategory => OnShopSubcategory._(
    [_Screens.shopSubcategory],
    [null],
    const ShopSubcategoryNav._(),
  );
  static OnProduct get product =>
      OnProduct._([_Screens.product], [null], const ProductNav._());
  static OnProductVariant get productVariant => OnProductVariant._(
    [_Screens.productVariant],
    [null],
    const ProductVariantNav._(),
  );
  static OnProductReview get productReview => OnProductReview._(
    [_Screens.productReview],
    [null],
    const ProductReviewNav._(),
  );
  static OnBrand get brand =>
      OnBrand._([_Screens.brand], [null], const BrandNav._());
  static On<CompareProductsNav, AnyView> get compareProducts =>
      On._([_Screens.compareProducts], [null], const CompareProductsNav._());
  static OnActivity get activity =>
      OnActivity._([_Screens.activity], [null], const ActivityNav._());
  static OnWorkout get workout =>
      OnWorkout._([_Screens.workout], [null], const WorkoutNav._());
  static OnExercise get exercise =>
      OnExercise._([_Screens.exercise], [null], const ExerciseNav._());
  static OnExerciseSet get exerciseSet =>
      OnExerciseSet._([_Screens.exerciseSet], [null], const ExerciseSetNav._());
  static OnDeepDemo get deepDemo =>
      OnDeepDemo._([_Screens.deepDemo], [null], const DeepDemoNav._());
  static OnLevelA get levelA =>
      OnLevelA._([_Screens.levelA], [null], const LevelANav._());
  static OnLevelB get levelB =>
      OnLevelB._([_Screens.levelB], [null], const LevelBNav._());
  static OnLevelC get levelC =>
      OnLevelC._([_Screens.levelC], [null], const LevelCNav._());
  static OnLevelD get levelD =>
      OnLevelD._([_Screens.levelD], [null], const LevelDNav._());
  static OnLevelE get levelE =>
      OnLevelE._([_Screens.levelE], [null], const LevelENav._());
  static OnLevelF get levelF =>
      OnLevelF._([_Screens.levelF], [null], const LevelFNav._());
  static OnIntegrations get integrations => OnIntegrations._(
    [_Screens.integrations],
    [null],
    const IntegrationsNav._(),
  );
  static On<ApiKeysNav, AnyView> get apiKeys =>
      On._([_Screens.apiKeys], [null], const ApiKeysNav._());
  static OnStudio get studio =>
      OnStudio._([CreatorStudio.studio], [null], const StudioNav._());
  static OnAnalytics get analytics =>
      OnAnalytics._([CreatorStudio.analytics], [null], const AnalyticsNav._());
  static On<AudienceNav, AnyView> get audience =>
      On._([CreatorStudio.audience], [null], const AudienceNav._());
  static OnScheduled get scheduled =>
      OnScheduled._([CreatorStudio.scheduled], [null], const ScheduledNav._());
  static OnScheduledPost get scheduledPost => OnScheduledPost._(
    [CreatorStudio.scheduledPost],
    [null],
    const ScheduledPostNav._(),
  );
  static OnEditScheduled get editScheduled => OnEditScheduled._(
    [CreatorStudio.editScheduled],
    [null],
    const EditScheduledNav._(),
  );
  static OnMonetization get monetization => OnMonetization._(
    [CreatorStudio.monetization],
    [null],
    const MonetizationNav._(),
  );
  static On<PayoutsNav, AnyView> get payouts =>
      On._([CreatorStudio.payouts], [null], const PayoutsNav._());
  static OnEvents get events =>
      OnEvents._([Events.events], [null], const EventsNav._());
  static OnEvent get event =>
      OnEvent._([Events.event], [null], const EventNav._());
  static OnAttendees get attendees =>
      OnAttendees._([Events.attendees], [null], const AttendeesNav._());
  static OnEditEvent get editEvent =>
      OnEditEvent._([Events.editEvent], [null], const EditEventNav._());
  static On<CreateEventNav, AnyView> get createEvent =>
      On._([Events.createEvent], [null], const CreateEventNav._());
  static OnTickets get tickets =>
      OnTickets._([Events.tickets], [null], const TicketsNav._());
  static OnSupport get support =>
      OnSupport._([Support.support], [null], const SupportNav._());
  static OnSupportTickets get supportTickets => OnSupportTickets._(
    [Support.supportTickets],
    [null],
    const SupportTicketsNav._(),
  );
  static OnSupportTicket get supportTicket => OnSupportTicket._(
    [Support.supportTicket],
    [null],
    const SupportTicketNav._(),
  );
  static On<NewTicketNav, AnyView> get newTicket =>
      On._([Support.newTicket], [null], const NewTicketNav._());
  static OnKnowledgeBase get knowledgeBase => OnKnowledgeBase._(
    [Support.knowledgeBase],
    [null],
    const KnowledgeBaseNav._(),
  );
  static OnArticle get article =>
      OnArticle._([Support.article], [null], const ArticleNav._());
  static OnAdmin get admin =>
      OnAdmin._([Admin.admin], [null], const AdminNav._());
  static OnAdminUsers get adminUsers =>
      OnAdminUsers._([Admin.adminUsers], [null], const AdminUsersNav._());
  static OnAdminUser get adminUser =>
      OnAdminUser._([Admin.adminUser], [null], const AdminUserNav._());
  static On<AdminAuditLogNav, AnyView> get adminAuditLog =>
      On._([Admin.adminAuditLog], [null], const AdminAuditLogNav._());
  static OnAdminRole get adminRole =>
      OnAdminRole._([Admin.adminRole], [null], const AdminRoleNav._());
  static On<AdminFeatureFlagsNav, AnyView> get adminFeatureFlags =>
      On._([Admin.adminFeatureFlags], [null], const AdminFeatureFlagsNav._());
  static OnWebhooks get webhooks =>
      OnWebhooks._([Admin.webhooks], [null], const WebhooksNav._());
  static OnWebhook get webhook =>
      OnWebhook._([Admin.webhook], [null], const WebhookNav._());

  /// GLOBAL query conditions, unbound to a screen — `context.on(.query(
  /// {…}))` (foreground) / `context.at(.query({…}))` (anywhere on stack).
  static On<AnyPlacement, AnyView> query(Set<QueryCond> cs) =>
      On._(const [], const [], null, [...cs]);

  /// GLOBAL fragment conditions, unbound to a screen.
  static On<AnyPlacement, AnyView> fragment(Set<FragmentCond> cs) =>
      On._(const [], const [], null, [...cs]);

  /// Disambiguating push onto the current scope when a screen has
  /// 2+ parents: `Screen.on(.parentOf.x)?.goX(...)`. A namespace —
  /// `.parentOf` alone is not an `On`, so the bare form will not compile.
  static _ParentSel get parentOf => const _ParentSel._();
}

final class OnParentOf<N extends AnyNav, V> extends On<N, V> {
  const OnParentOf._(this.parents, N nav) : super._(const [], const [], nav);
  final Set<Enum> parents;
}

final class _ParentSel {
  const _ParentSel._();
  OnParentOf<StoryNavParent, AnyView> get story => OnParentOf._(const {
    _Screens.feed,
    _Screens.story,
  }, const StoryNavParent._());
  OnParentOf<PostNavParent, PostView> get post => OnParentOf._(const {
    _Screens.comment,
    _Screens.feed,
    _Screens.post,
    _Screens.postAuthor,
  }, const PostNavParent._());
  OnParentOf<CommentNavParent, AnyView> get comment => OnParentOf._(const {
    _Screens.comment,
    _Screens.post,
  }, const CommentNavParent._());
  OnParentOf<PostAuthorNavParent, AnyView> get postAuthor => OnParentOf._(
    const {_Screens.post, _Screens.postAuthor},
    const PostAuthorNavParent._(),
  );
  OnParentOf<TopicNavParent, AnyView> get topic => OnParentOf._(const {
    _Screens.subtopic,
    _Screens.topic,
    _Screens.trending,
  }, const TopicNavParent._());
  OnParentOf<SubtopicNavParent, AnyView> get subtopic => OnParentOf._(const {
    _Screens.subtopic,
    _Screens.topic,
  }, const SubtopicNavParent._());
  OnParentOf<HashtagNavParent, AnyView> get hashtag => OnParentOf._(const {
    _Screens.hashtag,
    _Screens.trending,
  }, const HashtagNavParent._());
  OnParentOf<LiveRoomNavParent, AnyView> get liveRoom => OnParentOf._(const {
    _Screens.liveNow,
    _Screens.liveRoom,
  }, const LiveRoomNavParent._());
  OnParentOf<CategoryNavParent, AnyView> get category => OnParentOf._(const {
    _Screens.categories,
    _Screens.category,
  }, const CategoryNavParent._());
  OnParentOf<ListingNavParent, AnyView> get listing => OnParentOf._(const {
    _Screens.category,
    _Screens.listing,
    _Screens.sellerProfile,
  }, const ListingNavParent._());
  OnParentOf<ListingVariantNavParent, AnyView> get listingVariant =>
      OnParentOf._(const {
        _Screens.listing,
        _Screens.listingVariant,
      }, const ListingVariantNavParent._());
  OnParentOf<SellerProfileNavParent, AnyView> get sellerProfile => OnParentOf._(
    const {_Screens.listing, _Screens.sellerProfile},
    const SellerProfileNavParent._(),
  );
  OnParentOf<OrderNavParent, AnyView> get order => OnParentOf._(const {
    _Screens.myOrders,
    _Screens.order,
  }, const OrderNavParent._());
  OnParentOf<ChatNavParent, AnyView> get chat => OnParentOf._(const {
    _Screens.chats,
    _Screens.message,
  }, const ChatNavParent._());
  OnParentOf<ThreadNavParent, AnyView> get thread => OnParentOf._(const {
    _Screens.chat,
    _Screens.thread,
  }, const ThreadNavParent._());
  OnParentOf<MessageReplyNavParent, AnyView> get messageReply => OnParentOf._(
    const {_Screens.message, _Screens.messageReply},
    const MessageReplyNavParent._(),
  );
  OnParentOf<GroupChatNavParent, AnyView> get groupChat => OnParentOf._(const {
    _Screens.groupChat,
    _Screens.messages,
  }, const GroupChatNavParent._());
  OnParentOf<AccountNavParent, AnyView> get account => OnParentOf._(const {
    _Screens.account,
    _Screens.accounts,
  }, const AccountNavParent._());
  OnParentOf<TransactionNavParent, AnyView> get transaction => OnParentOf._(
    const {_Screens.transaction, _Screens.transactions},
    const TransactionNavParent._(),
  );
  OnParentOf<TransactionItemNavParent, AnyView> get transactionItem =>
      OnParentOf._(const {
        _Screens.transaction,
        _Screens.transactionItem,
      }, const TransactionItemNavParent._());
  OnParentOf<UserProfileNavParent, AnyView> get userProfile =>
      OnParentOf._(const {
        _Screens.chat,
        _Screens.feed,
        _Screens.forumReply,
        _Screens.profile,
        _Screens.project,
        _Screens.trending,
      }, const UserProfileNavParent._());
  OnParentOf<ConnectionNavParent, AnyView> get connection => OnParentOf._(
    const {_Screens.connection, _Screens.followers},
    const ConnectionNavParent._(),
  );
  OnParentOf<BadgeNavParent, AnyView> get badge => OnParentOf._(const {
    _Screens.badge,
    _Screens.badges,
  }, const BadgeNavParent._());
  OnParentOf<SessionNavParent, AnyView> get session => OnParentOf._(const {
    _Screens.device,
    _Screens.session,
  }, const SessionNavParent._());
  OnParentOf<TaskNavParent, TaskView> get task => OnParentOf._(const {
    _Screens.task,
    _Screens.taskList,
  }, const TaskNavParent._());
  OnParentOf<SubtaskNavParent, AnyView> get subtask => OnParentOf._(const {
    _Screens.subtask,
    _Screens.task,
  }, const SubtaskNavParent._());
  OnParentOf<ChecklistItemNavParent, AnyView> get checklistItem => OnParentOf._(
    const {_Screens.checklistItem, _Screens.subtask},
    const ChecklistItemNavParent._(),
  );
  OnParentOf<ForumThreadNavParent, ForumThreadView> get forumThread =>
      OnParentOf._(const {
        _Screens.forumCategory,
        _Screens.forumThread,
      }, const ForumThreadNavParent._());
  OnParentOf<ForumReplyNavParent, AnyView> get forumReply => OnParentOf._(
    const {_Screens.forumReply, _Screens.forumThread},
    const ForumReplyNavParent._(),
  );
  OnParentOf<QuestionNavParent, AnyView> get question => OnParentOf._(const {
    _Screens.question,
    _Screens.quiz,
  }, const QuestionNavParent._());
  OnParentOf<ProductNavParent, ProductView> get product => OnParentOf._(const {
    _Screens.product,
    _Screens.shopSubcategory,
  }, const ProductNavParent._());
  OnParentOf<ProductVariantNavParent, AnyView> get productVariant =>
      OnParentOf._(const {
        _Screens.product,
        _Screens.productVariant,
      }, const ProductVariantNavParent._());
  OnParentOf<ExerciseSetNavParent, AnyView> get exerciseSet => OnParentOf._(
    const {_Screens.exercise, _Screens.exerciseSet},
    const ExerciseSetNavParent._(),
  );
  OnParentOf<LevelANavParent, AnyView> get levelA => OnParentOf._(const {
    _Screens.deepDemo,
    _Screens.levelF,
  }, const LevelANavParent._());
  OnParentOf<LevelBNavParent, AnyView> get levelB => OnParentOf._(const {
    _Screens.levelA,
    _Screens.levelF,
  }, const LevelBNavParent._());
  OnParentOf<LevelCNavParent, AnyView> get levelC => OnParentOf._(const {
    _Screens.levelB,
    _Screens.levelF,
  }, const LevelCNavParent._());
  OnParentOf<LevelDNavParent, AnyView> get levelD => OnParentOf._(const {
    _Screens.levelC,
    _Screens.levelF,
  }, const LevelDNavParent._());
  OnParentOf<LevelENavParent, AnyView> get levelE => OnParentOf._(const {
    _Screens.levelD,
    _Screens.levelF,
  }, const LevelENavParent._());
  OnParentOf<LevelFNavParent, AnyView> get levelF => OnParentOf._(const {
    _Screens.levelE,
    _Screens.levelF,
  }, const LevelFNavParent._());
}

final class StoryNavParent extends AnyNav {
  const StoryNavParent._() : super._();
  StoryNav goStory(String id) {
    _Screens.graph.go(_Screens.story, id, true);
    return const StoryNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class PostNavParent extends AnyNav {
  const PostNavParent._() : super._();
  PostNav goPost(String id) {
    _Screens.graph.go(_Screens.post, id, true);
    return const PostNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class CommentNavParent extends AnyNav {
  const CommentNavParent._() : super._();
  CommentNav goComment(String id) {
    _Screens.graph.go(_Screens.comment, id, true);
    return const CommentNav._();
  }

  PostNav goPost(String id) {
    _Screens.graph.go(_Screens.post, id, true);
    return const PostNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class PostAuthorNavParent extends AnyNav {
  const PostAuthorNavParent._() : super._();
  PostNav goPost(String id) {
    _Screens.graph.go(_Screens.post, id, true);
    return const PostNav._();
  }

  PostAuthorNav goPostAuthor(String id) {
    _Screens.graph.go(_Screens.postAuthor, id, true);
    return const PostAuthorNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class TopicNavParent extends AnyNav {
  const TopicNavParent._() : super._();
  TopicNav goTopic(String id) {
    _Screens.graph.go(_Screens.topic, id, true);
    return const TopicNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class SubtopicNavParent extends AnyNav {
  const SubtopicNavParent._() : super._();
  SubtopicNav goSubtopic(String id) {
    _Screens.graph.go(_Screens.subtopic, id, true);
    return const SubtopicNav._();
  }

  TopicNav goTopic(String id) {
    _Screens.graph.go(_Screens.topic, id, true);
    return const TopicNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class HashtagNavParent extends AnyNav {
  const HashtagNavParent._() : super._();
  HashtagNav goHashtag(String id) {
    _Screens.graph.go(_Screens.hashtag, id, true);
    return const HashtagNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class LiveRoomNavParent extends AnyNav {
  const LiveRoomNavParent._() : super._();
  LiveRoomNav goLiveRoom(String id) {
    _Screens.graph.go(_Screens.liveRoom, id, true);
    return const LiveRoomNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class CategoryNavParent extends AnyNav {
  const CategoryNavParent._() : super._();
  CategoryNav goCategory(String id) {
    _Screens.graph.go(_Screens.category, id, true);
    return const CategoryNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class ListingNavParent extends AnyNav {
  const ListingNavParent._() : super._();
  ListingNav goListing(String id) {
    _Screens.graph.go(_Screens.listing, id, true);
    return const ListingNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class ListingVariantNavParent extends AnyNav {
  const ListingVariantNavParent._() : super._();
  ListingVariantNav goListingVariant(String id) {
    _Screens.graph.go(_Screens.listingVariant, id, true);
    return const ListingVariantNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class SellerProfileNavParent extends AnyNav {
  const SellerProfileNavParent._() : super._();
  ListingNav goListing(String id) {
    _Screens.graph.go(_Screens.listing, id, true);
    return const ListingNav._();
  }

  SellerProfileNav goSellerProfile(String id) {
    _Screens.graph.go(_Screens.sellerProfile, id, true);
    return const SellerProfileNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class OrderNavParent extends AnyNav {
  const OrderNavParent._() : super._();
  OrderNav goOrder(String id) {
    _Screens.graph.go(_Screens.order, id, true);
    return const OrderNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class ChatNavParent extends AnyNav {
  const ChatNavParent._() : super._();
  ChatNav goChat(String id) {
    _Screens.graph.go(_Screens.chat, id, true);
    return const ChatNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class ThreadNavParent extends AnyNav {
  const ThreadNavParent._() : super._();
  ThreadNav goThread(String id) {
    _Screens.graph.go(_Screens.thread, id, true);
    return const ThreadNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class MessageReplyNavParent extends AnyNav {
  const MessageReplyNavParent._() : super._();
  MessageReplyNav goMessageReply(String id) {
    _Screens.graph.go(_Screens.messageReply, id, true);
    return const MessageReplyNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class GroupChatNavParent extends AnyNav {
  const GroupChatNavParent._() : super._();
  GroupChatNav goGroupChat(String id) {
    _Screens.graph.go(_Screens.groupChat, id, true);
    return const GroupChatNav._();
  }
}

final class AccountNavParent extends AnyNav {
  const AccountNavParent._() : super._();
  AccountNav goAccount(String id) {
    _Screens.graph.go(_Screens.account, id, true);
    return const AccountNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class TransactionNavParent extends AnyNav {
  const TransactionNavParent._() : super._();
  TransactionNav goTransaction(String id) {
    _Screens.graph.go(_Screens.transaction, id, true);
    return const TransactionNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class TransactionItemNavParent extends AnyNav {
  const TransactionItemNavParent._() : super._();
  TransactionItemNav goTransactionItem(String id) {
    _Screens.graph.go(_Screens.transactionItem, id, true);
    return const TransactionItemNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class UserProfileNavParent extends AnyNav {
  const UserProfileNavParent._() : super._();
  UserProfilePlacement goUserProfile(String id) {
    _Screens.graph.go(_Screens.userProfile, id, true);
    return _atOf(_Screens.userProfile) as UserProfilePlacement;
  }
}

final class ConnectionNavParent extends AnyNav {
  const ConnectionNavParent._() : super._();
  ConnectionNav goConnection(String id) {
    _Screens.graph.go(_Screens.connection, id, true);
    return const ConnectionNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class BadgeNavParent extends AnyNav {
  const BadgeNavParent._() : super._();
  BadgeNav goBadge(String id) {
    _Screens.graph.go(_Screens.badge, id, true);
    return const BadgeNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class SessionNavParent extends AnyNav {
  const SessionNavParent._() : super._();
  SessionNav goSession(String id) {
    _Screens.graph.go(_Screens.session, id, true);
    return const SessionNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class TaskNavParent extends AnyNav {
  const TaskNavParent._() : super._();
  TaskNav goTask(String id) {
    _Screens.graph.go(_Screens.task, id, true);
    return const TaskNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class SubtaskNavParent extends AnyNav {
  const SubtaskNavParent._() : super._();
  SubtaskNav goSubtask(String id) {
    _Screens.graph.go(_Screens.subtask, id, true);
    return const SubtaskNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class ChecklistItemNavParent extends AnyNav {
  const ChecklistItemNavParent._() : super._();
  ChecklistItemNav goChecklistItem(String id) {
    _Screens.graph.go(_Screens.checklistItem, id, true);
    return const ChecklistItemNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class ForumThreadNavParent extends AnyNav {
  const ForumThreadNavParent._() : super._();
  ForumThreadNav goForumThread(String id) {
    _Screens.graph.go(_Screens.forumThread, id, true);
    return const ForumThreadNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class ForumReplyNavParent extends AnyNav {
  const ForumReplyNavParent._() : super._();
  ForumReplyNav goForumReply(String id) {
    _Screens.graph.go(_Screens.forumReply, id, true);
    return const ForumReplyNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class QuestionNavParent extends AnyNav {
  const QuestionNavParent._() : super._();
  QuestionNav goQuestion(String id) {
    _Screens.graph.go(_Screens.question, id, true);
    return const QuestionNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class ProductNavParent extends AnyNav {
  const ProductNavParent._() : super._();
  ProductNav goProduct(String id) {
    _Screens.graph.go(_Screens.product, id, true);
    return const ProductNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class ProductVariantNavParent extends AnyNav {
  const ProductVariantNavParent._() : super._();
  ProductVariantNav goProductVariant(String id) {
    _Screens.graph.go(_Screens.productVariant, id, true);
    return const ProductVariantNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class ExerciseSetNavParent extends AnyNav {
  const ExerciseSetNavParent._() : super._();
  ExerciseSetNav goExerciseSet(String id) {
    _Screens.graph.go(_Screens.exerciseSet, id, true);
    return const ExerciseSetNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class LevelANavParent extends AnyNav {
  const LevelANavParent._() : super._();
  LevelANav goLevelA(String id) {
    _Screens.graph.go(_Screens.levelA, id, true);
    return const LevelANav._();
  }
}

final class LevelBNavParent extends AnyNav {
  const LevelBNavParent._() : super._();
  LevelBNav goLevelB(String id) {
    _Screens.graph.go(_Screens.levelB, id, true);
    return const LevelBNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class LevelCNavParent extends AnyNav {
  const LevelCNavParent._() : super._();
  LevelCNav goLevelC(String id) {
    _Screens.graph.go(_Screens.levelC, id, true);
    return const LevelCNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class LevelDNavParent extends AnyNav {
  const LevelDNavParent._() : super._();
  LevelDNav goLevelD(String id) {
    _Screens.graph.go(_Screens.levelD, id, true);
    return const LevelDNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class LevelENavParent extends AnyNav {
  const LevelENavParent._() : super._();
  LevelENav goLevelE(String id) {
    _Screens.graph.go(_Screens.levelE, id, true);
    return const LevelENav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class LevelFNavParent extends AnyNav {
  const LevelFNavParent._() : super._();
  LevelFNav goLevelF(String id) {
    _Screens.graph.go(_Screens.levelF, id, true);
    return const LevelFNav._();
  }

  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

final class OnDepth<N extends AnyNav, V> extends On<N, V> {
  const OnDepth._(super.specs, super.ids, this.depth, super.nav) : super._();
  final int depth;
}

final class OnForgotPassword extends On<ForgotPasswordNav, AnyView> {
  const OnForgotPassword._(super.specs, super.ids, super.nav) : super._();
  OnResetPassword get resetPassword => OnResetPassword._(
    [...specs, _Screens.resetPassword],
    [...ids, null],
    const ResetPasswordNav._(),
  );
}

final class OnResetPassword extends On<ResetPasswordNav, AnyView> {
  const OnResetPassword._(super.specs, super.ids, super.nav) : super._();
  OnResetPassword call(String id) =>
      OnResetPassword._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnHome extends On<HomeNav, AnyView> {
  const OnHome._(super.specs, super.ids, super.nav) : super._();
  OnFeed get feed =>
      OnFeed._([...specs, _Screens.feed], [...ids, null], const FeedNav._());
  OnStudio get studio => OnStudio._(
    [...specs, CreatorStudio.studio],
    [...ids, null],
    const StudioNav._(),
  );
}

final class OnFeed extends On<FeedNav, FeedView> {
  const OnFeed._(super.specs, super.ids, super.nav, [super.conds]) : super._();
  OnFeed query(Set<FeedQueryCond> cs) =>
      OnFeed._(specs, ids, nav, [...conds, ...cs]);
  OnFeed fragment(Set<FeedFragmentCond> cs) =>
      OnFeed._(specs, ids, nav, [...conds, ...cs]);
  OnPost get post =>
      OnPost._([...specs, _Screens.post], [...ids, null], const PostNav._());
  OnStory get story =>
      OnStory._([...specs, _Screens.story], [...ids, null], const StoryNav._());
  On<ComposePostNav, AnyView> get composePost => On._(
    [...specs, _Screens.composePost],
    [...ids, null],
    const ComposePostNav._(),
  );
  OnHomeFeedUserProfile get userProfile => OnHomeFeedUserProfile._(
    [...specs, _Screens.userProfile],
    [...ids, null],
    const HomeFeedUserProfileNav._(),
  );
  On<PostCommentsNav, AnyView> postComments(String id) => On._(
    [...specs, _Screens.post, _Screens.postComments],
    [...ids, id, null],
    const PostCommentsNav._(),
  );
  On<PostLikesNav, AnyView> postLikes(String id) => On._(
    [...specs, _Screens.post, _Screens.postLikes],
    [...ids, id, null],
    const PostLikesNav._(),
  );
  On<EditPostNav, AnyView> editPost(String id) => On._(
    [...specs, _Screens.post, _Screens.editPost],
    [...ids, id, null],
    const EditPostNav._(),
  );
  On<RepostNav, AnyView> repost(String id) => On._(
    [...specs, _Screens.post, _Screens.repost],
    [...ids, id, null],
    const RepostNav._(),
  );
}

final class OnPost extends On<PostNav, PostView> {
  const OnPost._(super.specs, super.ids, super.nav, [super.conds]) : super._();
  OnPost query(Set<PostQueryCond> cs) =>
      OnPost._(specs, ids, nav, [...conds, ...cs]);
  OnComment get comment => OnComment._(
    [...specs, _Screens.comment],
    [...ids, null],
    const CommentNav._(),
  );
  OnPostAuthor get postAuthor => OnPostAuthor._(
    [...specs, _Screens.postAuthor],
    [...ids, null],
    const PostAuthorNav._(),
  );
  OnPost call(String id) =>
      OnPost._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<PostNav, PostView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnComment extends On<CommentNav, AnyView> {
  const OnComment._(super.specs, super.ids, super.nav) : super._();
  OnComment call(String id) =>
      OnComment._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<CommentNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnPostAuthor extends On<PostAuthorNav, AnyView> {
  const OnPostAuthor._(super.specs, super.ids, super.nav) : super._();
  OnPostAuthor call(String id) =>
      OnPostAuthor._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<PostAuthorNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnStory extends On<StoryNav, AnyView> {
  const OnStory._(super.specs, super.ids, super.nav) : super._();
  OnStory call(String id) =>
      OnStory._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<StoryNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnHomeFeedUserProfile extends On<HomeFeedUserProfileNav, AnyView> {
  const OnHomeFeedUserProfile._(super.specs, super.ids, super.nav) : super._();
  OnHomeFeedUserProfile call(String id) => OnHomeFeedUserProfile._(specs, [
    ...ids.sublist(0, ids.length - 1),
    id,
  ], nav);
}

final class OnStudio extends On<StudioNav, AnyView> {
  const OnStudio._(super.specs, super.ids, super.nav) : super._();
  OnAnalytics get analytics => OnAnalytics._(
    [...specs, CreatorStudio.analytics],
    [...ids, null],
    const AnalyticsNav._(),
  );
  OnScheduled get scheduled => OnScheduled._(
    [...specs, CreatorStudio.scheduled],
    [...ids, null],
    const ScheduledNav._(),
  );
  OnMonetization get monetization => OnMonetization._(
    [...specs, CreatorStudio.monetization],
    [...ids, null],
    const MonetizationNav._(),
  );
}

final class OnAnalytics extends On<AnalyticsNav, AnyView> {
  const OnAnalytics._(super.specs, super.ids, super.nav) : super._();
  On<AudienceNav, AnyView> get audience => On._(
    [...specs, CreatorStudio.audience],
    [...ids, null],
    const AudienceNav._(),
  );
}

final class OnScheduled extends On<ScheduledNav, AnyView> {
  const OnScheduled._(super.specs, super.ids, super.nav) : super._();
  OnScheduledPost get scheduledPost => OnScheduledPost._(
    [...specs, CreatorStudio.scheduledPost],
    [...ids, null],
    const ScheduledPostNav._(),
  );
  On<EditScheduledNav, AnyView> editScheduled(String id) => On._(
    [...specs, CreatorStudio.scheduledPost, CreatorStudio.editScheduled],
    [...ids, id, null],
    const EditScheduledNav._(),
  );
}

final class OnScheduledPost extends On<ScheduledPostNav, AnyView> {
  const OnScheduledPost._(super.specs, super.ids, super.nav) : super._();
  OnScheduledPost call(String id) =>
      OnScheduledPost._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnMonetization extends On<MonetizationNav, AnyView> {
  const OnMonetization._(super.specs, super.ids, super.nav) : super._();
  On<PayoutsNav, AnyView> get payouts => On._(
    [...specs, CreatorStudio.payouts],
    [...ids, null],
    const PayoutsNav._(),
  );
}

final class OnPostComments extends On<PostCommentsNav, AnyView> {
  const OnPostComments._(super.specs, super.ids, super.nav) : super._();
  OnPostComments call(String id) =>
      OnPostComments._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnPostLikes extends On<PostLikesNav, AnyView> {
  const OnPostLikes._(super.specs, super.ids, super.nav) : super._();
  OnPostLikes call(String id) =>
      OnPostLikes._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnEditPost extends On<EditPostNav, AnyView> {
  const OnEditPost._(super.specs, super.ids, super.nav) : super._();
  OnEditPost call(String id) =>
      OnEditPost._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnRepost extends On<RepostNav, AnyView> {
  const OnRepost._(super.specs, super.ids, super.nav) : super._();
  OnRepost call(String id) =>
      OnRepost._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnDiscover extends On<DiscoverNav, DiscoverView> {
  const OnDiscover._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnDiscover query(Set<DiscoverQueryCond> cs) =>
      OnDiscover._(specs, ids, nav, [...conds, ...cs]);
  OnTrending get trending => OnTrending._(
    [...specs, _Screens.trending],
    [...ids, null],
    const TrendingNav._(),
  );
  On<TopicsNav, AnyView> get topics =>
      On._([...specs, _Screens.topics], [...ids, null], const TopicsNav._());
  OnLiveNow get liveNow => OnLiveNow._(
    [...specs, _Screens.liveNow],
    [...ids, null],
    const LiveNowNav._(),
  );
  On<NearbyNav, AnyView> get nearby =>
      On._([...specs, _Screens.nearby], [...ids, null], const NearbyNav._());
  OnEvents get events => OnEvents._(
    [...specs, Events.events],
    [...ids, null],
    const EventsNav._(),
  );
}

final class OnTrending extends On<TrendingNav, AnyView> {
  const OnTrending._(super.specs, super.ids, super.nav) : super._();
  OnHashtag get hashtag => OnHashtag._(
    [...specs, _Screens.hashtag],
    [...ids, null],
    const HashtagNav._(),
  );
  OnTopic get topic =>
      OnTopic._([...specs, _Screens.topic], [...ids, null], const TopicNav._());
  OnDiscoverTrendingUserProfile get userProfile =>
      OnDiscoverTrendingUserProfile._(
        [...specs, _Screens.userProfile],
        [...ids, null],
        const DiscoverTrendingUserProfileNav._(),
      );
}

final class OnHashtag extends On<HashtagNav, AnyView> {
  const OnHashtag._(super.specs, super.ids, super.nav) : super._();
  OnHashtag call(String id) =>
      OnHashtag._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<HashtagNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnTopic extends On<TopicNav, AnyView> {
  const OnTopic._(super.specs, super.ids, super.nav) : super._();
  OnSubtopic get subtopic => OnSubtopic._(
    [...specs, _Screens.subtopic],
    [...ids, null],
    const SubtopicNav._(),
  );
  OnTopic call(String id) =>
      OnTopic._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<TopicNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnSubtopic extends On<SubtopicNav, AnyView> {
  const OnSubtopic._(super.specs, super.ids, super.nav) : super._();
  OnSubtopic call(String id) =>
      OnSubtopic._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<SubtopicNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnDiscoverTrendingUserProfile
    extends On<DiscoverTrendingUserProfileNav, AnyView> {
  const OnDiscoverTrendingUserProfile._(super.specs, super.ids, super.nav)
    : super._();
  OnDiscoverTrendingUserProfile call(String id) =>
      OnDiscoverTrendingUserProfile._(specs, [
        ...ids.sublist(0, ids.length - 1),
        id,
      ], nav);
}

final class OnLiveNow extends On<LiveNowNav, AnyView> {
  const OnLiveNow._(super.specs, super.ids, super.nav) : super._();
  OnLiveRoom get liveRoom => OnLiveRoom._(
    [...specs, _Screens.liveRoom],
    [...ids, null],
    const LiveRoomNav._(),
  );
}

final class OnLiveRoom extends On<LiveRoomNav, AnyView> {
  const OnLiveRoom._(super.specs, super.ids, super.nav) : super._();
  OnLiveRoom call(String id) =>
      OnLiveRoom._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<LiveRoomNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnEvents extends On<EventsNav, AnyView> {
  const OnEvents._(super.specs, super.ids, super.nav) : super._();
  OnEvent get event =>
      OnEvent._([...specs, Events.event], [...ids, null], const EventNav._());
  On<CreateEventNav, AnyView> get createEvent => On._(
    [...specs, Events.createEvent],
    [...ids, null],
    const CreateEventNav._(),
  );
  On<AttendeesNav, AnyView> attendees(String id) => On._(
    [...specs, Events.event, Events.attendees],
    [...ids, id, null],
    const AttendeesNav._(),
  );
  On<EditEventNav, AnyView> editEvent(String id) => On._(
    [...specs, Events.event, Events.editEvent],
    [...ids, id, null],
    const EditEventNav._(),
  );
  On<TicketsNav, AnyView> tickets(String id) => On._(
    [...specs, Events.event, Events.tickets],
    [...ids, id, null],
    const TicketsNav._(),
  );
}

final class OnEvent extends On<EventNav, AnyView> {
  const OnEvent._(super.specs, super.ids, super.nav) : super._();
  OnEvent call(String id) =>
      OnEvent._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnMarketplace extends On<MarketplaceNav, MarketplaceView> {
  const OnMarketplace._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnMarketplace query(Set<MarketplaceQueryCond> cs) =>
      OnMarketplace._(specs, ids, nav, [...conds, ...cs]);
  OnCategories get categories => OnCategories._(
    [...specs, _Screens.categories],
    [...ids, null],
    const CategoriesNav._(),
  );
  OnCart get cart =>
      OnCart._([...specs, _Screens.cart], [...ids, null], const CartNav._());
  OnMyOrders get myOrders => OnMyOrders._(
    [...specs, _Screens.myOrders],
    [...ids, null],
    const MyOrdersNav._(),
  );
  On<WishlistNav, AnyView> get wishlist => On._(
    [...specs, _Screens.wishlist],
    [...ids, null],
    const WishlistNav._(),
  );
}

final class OnCategories extends On<CategoriesNav, AnyView> {
  const OnCategories._(super.specs, super.ids, super.nav) : super._();
  OnCategory get category => OnCategory._(
    [...specs, _Screens.category],
    [...ids, null],
    const CategoryNav._(),
  );
}

final class OnCategory extends On<CategoryNav, AnyView> {
  const OnCategory._(super.specs, super.ids, super.nav) : super._();
  OnListing get listing => OnListing._(
    [...specs, _Screens.listing],
    [...ids, null],
    const ListingNav._(),
  );
  On<EditListingNav, AnyView> editListing(String id) => On._(
    [...specs, _Screens.listing, _Screens.editListing],
    [...ids, id, null],
    const EditListingNav._(),
  );
  OnCategory call(String id) =>
      OnCategory._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<CategoryNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnListing extends On<ListingNav, AnyView> {
  const OnListing._(super.specs, super.ids, super.nav) : super._();
  OnSellerProfile get sellerProfile => OnSellerProfile._(
    [...specs, _Screens.sellerProfile],
    [...ids, null],
    const SellerProfileNav._(),
  );
  OnListingVariant get listingVariant => OnListingVariant._(
    [...specs, _Screens.listingVariant],
    [...ids, null],
    const ListingVariantNav._(),
  );
  OnListing call(String id) =>
      OnListing._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<ListingNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnSellerProfile extends On<SellerProfileNav, AnyView> {
  const OnSellerProfile._(super.specs, super.ids, super.nav) : super._();
  OnSellerProfile call(String id) =>
      OnSellerProfile._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<SellerProfileNav, AnyView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnListingVariant extends On<ListingVariantNav, AnyView> {
  const OnListingVariant._(super.specs, super.ids, super.nav) : super._();
  OnListingVariant call(String id) =>
      OnListingVariant._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<ListingVariantNav, AnyView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnCart extends On<CartNav, AnyView> {
  const OnCart._(super.specs, super.ids, super.nav) : super._();
  OnCheckout get checkout => OnCheckout._(
    [...specs, _Screens.checkout],
    [...ids, null],
    const CheckoutNav._(),
  );
}

final class OnCheckout extends On<CheckoutNav, AnyView> {
  const OnCheckout._(super.specs, super.ids, super.nav) : super._();
  OnOrderConfirmation get orderConfirmation => OnOrderConfirmation._(
    [...specs, _Screens.orderConfirmation],
    [...ids, null],
    const OrderConfirmationNav._(),
  );
  OnCheckout call(String id) =>
      OnCheckout._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnOrderConfirmation extends On<OrderConfirmationNav, AnyView> {
  const OnOrderConfirmation._(super.specs, super.ids, super.nav) : super._();
  OnOrderConfirmation call(String id) => OnOrderConfirmation._(specs, [
    ...ids.sublist(0, ids.length - 1),
    id,
  ], nav);
}

final class OnMyOrders extends On<MyOrdersNav, AnyView> {
  const OnMyOrders._(super.specs, super.ids, super.nav) : super._();
  OnOrder get order =>
      OnOrder._([...specs, _Screens.order], [...ids, null], const OrderNav._());
}

final class OnOrder extends On<OrderNav, AnyView> {
  const OnOrder._(super.specs, super.ids, super.nav) : super._();
  OnOrder call(String id) =>
      OnOrder._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<OrderNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnEditListing extends On<EditListingNav, AnyView> {
  const OnEditListing._(super.specs, super.ids, super.nav) : super._();
  OnEditListing call(String id) =>
      OnEditListing._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnMessages extends On<MessagesNav, AnyView> {
  const OnMessages._(super.specs, super.ids, super.nav) : super._();
  OnChats get chats =>
      OnChats._([...specs, _Screens.chats], [...ids, null], const ChatsNav._());
  On<NewChatNav, AnyView> get newChat =>
      On._([...specs, _Screens.newChat], [...ids, null], const NewChatNav._());
  OnGroupChat get groupChat => OnGroupChat._(
    [...specs, _Screens.groupChat],
    [...ids, null],
    const GroupChatNav._(),
  );
  On<GroupInfoNav, AnyView> groupInfo(String id) => On._(
    [...specs, _Screens.groupChat, _Screens.groupInfo],
    [...ids, id, null],
    const GroupInfoNav._(),
  );
}

final class OnChats extends On<ChatsNav, AnyView> {
  const OnChats._(super.specs, super.ids, super.nav) : super._();
  OnChat get chat =>
      OnChat._([...specs, _Screens.chat], [...ids, null], const ChatNav._());
  On<VoiceCallNav, AnyView> voiceCall(String id) => On._(
    [...specs, _Screens.chat, _Screens.voiceCall],
    [...ids, id, null],
    const VoiceCallNav._(),
  );
}

final class OnChat extends On<ChatNav, AnyView> {
  const OnChat._(super.specs, super.ids, super.nav) : super._();
  OnThread get thread => OnThread._(
    [...specs, _Screens.thread],
    [...ids, null],
    const ThreadNav._(),
  );
  OnMessagesChatsChatUserProfile get userProfile =>
      OnMessagesChatsChatUserProfile._(
        [...specs, _Screens.userProfile],
        [...ids, null],
        const MessagesChatsChatUserProfileNav._(),
      );
  OnChat call(String id) =>
      OnChat._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<ChatNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnThread extends On<ThreadNav, AnyView> {
  const OnThread._(super.specs, super.ids, super.nav) : super._();
  OnMessage get message => OnMessage._(
    [...specs, _Screens.message],
    [...ids, null],
    const MessageNav._(),
  );
  OnThread call(String id) =>
      OnThread._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<ThreadNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnMessage extends On<MessageNav, AnyView> {
  const OnMessage._(super.specs, super.ids, super.nav) : super._();
  OnMessageReply get messageReply => OnMessageReply._(
    [...specs, _Screens.messageReply],
    [...ids, null],
    const MessageReplyNav._(),
  );
  OnMessage call(String id) =>
      OnMessage._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<MessageNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnMessageReply extends On<MessageReplyNav, AnyView> {
  const OnMessageReply._(super.specs, super.ids, super.nav) : super._();
  OnMessageReply call(String id) =>
      OnMessageReply._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<MessageReplyNav, AnyView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnMessagesChatsChatUserProfile
    extends On<MessagesChatsChatUserProfileNav, AnyView> {
  const OnMessagesChatsChatUserProfile._(super.specs, super.ids, super.nav)
    : super._();
  OnMessagesChatsChatUserProfile call(String id) =>
      OnMessagesChatsChatUserProfile._(specs, [
        ...ids.sublist(0, ids.length - 1),
        id,
      ], nav);
}

final class OnGroupChat extends On<GroupChatNav, AnyView> {
  const OnGroupChat._(super.specs, super.ids, super.nav) : super._();
  OnGroupChat call(String id) =>
      OnGroupChat._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<GroupChatNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnVoiceCall extends On<VoiceCallNav, AnyView> {
  const OnVoiceCall._(super.specs, super.ids, super.nav) : super._();
  OnVoiceCall call(String id) =>
      OnVoiceCall._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnGroupInfo extends On<GroupInfoNav, AnyView> {
  const OnGroupInfo._(super.specs, super.ids, super.nav) : super._();
  OnGroupInfo call(String id) =>
      OnGroupInfo._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnWallet extends On<WalletNav, AnyView> {
  const OnWallet._(super.specs, super.ids, super.nav) : super._();
  On<BalanceNav, AnyView> get balance =>
      On._([...specs, _Screens.balance], [...ids, null], const BalanceNav._());
  OnAccounts get accounts => OnAccounts._(
    [...specs, _Screens.accounts],
    [...ids, null],
    const AccountsNav._(),
  );
  On<SendMoneyNav, AnyView> get sendMoney => On._(
    [...specs, _Screens.sendMoney],
    [...ids, null],
    const SendMoneyNav._(),
  );
  On<ReceiveMoneyNav, AnyView> get receiveMoney => On._(
    [...specs, _Screens.receiveMoney],
    [...ids, null],
    const ReceiveMoneyNav._(),
  );
  OnPaymentMethods get paymentMethods => OnPaymentMethods._(
    [...specs, _Screens.paymentMethods],
    [...ids, null],
    const PaymentMethodsNav._(),
  );
}

final class OnAccounts extends On<AccountsNav, AnyView> {
  const OnAccounts._(super.specs, super.ids, super.nav) : super._();
  OnAccount get account => OnAccount._(
    [...specs, _Screens.account],
    [...ids, null],
    const AccountNav._(),
  );
}

final class OnAccount extends On<AccountNav, AnyView> {
  const OnAccount._(super.specs, super.ids, super.nav) : super._();
  OnTransactions get transactions => OnTransactions._(
    [...specs, _Screens.transactions],
    [...ids, null],
    const TransactionsNav._(),
  );
  OnStatements get statements => OnStatements._(
    [...specs, _Screens.statements],
    [...ids, null],
    const StatementsNav._(),
  );
  OnAccount call(String id) =>
      OnAccount._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<AccountNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnTransactions extends On<TransactionsNav, AnyView> {
  const OnTransactions._(super.specs, super.ids, super.nav) : super._();
  OnTransaction get transaction => OnTransaction._(
    [...specs, _Screens.transaction],
    [...ids, null],
    const TransactionNav._(),
  );
}

final class OnTransaction extends On<TransactionNav, AnyView> {
  const OnTransaction._(super.specs, super.ids, super.nav) : super._();
  OnTransactionItem get transactionItem => OnTransactionItem._(
    [...specs, _Screens.transactionItem],
    [...ids, null],
    const TransactionItemNav._(),
  );
  OnTransaction call(String id) =>
      OnTransaction._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<TransactionNav, AnyView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnTransactionItem extends On<TransactionItemNav, AnyView> {
  const OnTransactionItem._(super.specs, super.ids, super.nav) : super._();
  OnTransactionItem call(String id) =>
      OnTransactionItem._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<TransactionItemNav, AnyView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnStatements extends On<StatementsNav, AnyView> {
  const OnStatements._(super.specs, super.ids, super.nav) : super._();
  OnStatement get statement => OnStatement._(
    [...specs, _Screens.statement],
    [...ids, null],
    const StatementNav._(),
  );
}

final class OnStatement extends On<StatementNav, AnyView> {
  const OnStatement._(super.specs, super.ids, super.nav) : super._();
  OnStatement call(String id) =>
      OnStatement._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnPaymentMethods extends On<PaymentMethodsNav, AnyView> {
  const OnPaymentMethods._(super.specs, super.ids, super.nav) : super._();
  On<AddCardNav, AnyView> get addCard =>
      On._([...specs, _Screens.addCard], [...ids, null], const AddCardNav._());
  OnCard get card =>
      OnCard._([...specs, _Screens.card], [...ids, null], const CardNav._());
}

final class OnCard extends On<CardNav, AnyView> {
  const OnCard._(super.specs, super.ids, super.nav) : super._();
  OnCard call(String id) =>
      OnCard._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnProfile extends On<ProfileNav, AnyView> {
  const OnProfile._(super.specs, super.ids, super.nav) : super._();
  OnProfileUserProfile get userProfile => OnProfileUserProfile._(
    [...specs, _Screens.userProfile],
    [...ids, null],
    const ProfileUserProfileNav._(),
  );
  OnFollowers get followers => OnFollowers._(
    [...specs, _Screens.followers],
    [...ids, null],
    const FollowersNav._(),
  );
  OnFollowing get following => OnFollowing._(
    [...specs, _Screens.following],
    [...ids, null],
    const FollowingNav._(),
  );
  On<EditProfileNav, AnyView> get editProfile => On._(
    [...specs, _Screens.editProfile],
    [...ids, null],
    const EditProfileNav._(),
  );
  On<AchievementsNav, AnyView> get achievements => On._(
    [...specs, _Screens.achievements],
    [...ids, null],
    const AchievementsNav._(),
  );
  OnBadges get badges => OnBadges._(
    [...specs, _Screens.badges],
    [...ids, null],
    const BadgesNav._(),
  );
  On<SavedPostsNav, AnyView> get savedPosts => On._(
    [...specs, _Screens.savedPosts],
    [...ids, null],
    const SavedPostsNav._(),
  );
  On<DraftsNav, AnyView> get drafts =>
      On._([...specs, _Screens.drafts], [...ids, null], const DraftsNav._());
  On<MyListingsNav, AnyView> get myListings => On._(
    [...specs, _Screens.myListings],
    [...ids, null],
    const MyListingsNav._(),
  );
}

final class OnProfileUserProfile extends On<ProfileUserProfileNav, AnyView> {
  const OnProfileUserProfile._(super.specs, super.ids, super.nav) : super._();
  OnProfileUserProfile call(String id) => OnProfileUserProfile._(specs, [
    ...ids.sublist(0, ids.length - 1),
    id,
  ], nav);
}

final class OnFollowers extends On<FollowersNav, AnyView> {
  const OnFollowers._(super.specs, super.ids, super.nav) : super._();
  OnConnection get connection => OnConnection._(
    [...specs, _Screens.connection],
    [...ids, null],
    const ConnectionNav._(),
  );
  OnFollowers call(String id) =>
      OnFollowers._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnConnection extends On<ConnectionNav, AnyView> {
  const OnConnection._(super.specs, super.ids, super.nav) : super._();
  On<MutualConnectionsNav, AnyView> get mutualConnections => On._(
    [...specs, _Screens.mutualConnections],
    [...ids, null],
    const MutualConnectionsNav._(),
  );
  OnConnection call(String id) =>
      OnConnection._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<ConnectionNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnFollowing extends On<FollowingNav, AnyView> {
  const OnFollowing._(super.specs, super.ids, super.nav) : super._();
  OnFollowing call(String id) =>
      OnFollowing._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnBadges extends On<BadgesNav, AnyView> {
  const OnBadges._(super.specs, super.ids, super.nav) : super._();
  OnBadge get badge =>
      OnBadge._([...specs, _Screens.badge], [...ids, null], const BadgeNav._());
}

final class OnBadge extends On<BadgeNav, AnyView> {
  const OnBadge._(super.specs, super.ids, super.nav) : super._();
  OnBadge call(String id) =>
      OnBadge._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<BadgeNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnUserProfile extends On<UserProfilePlacement, AnyView> {
  const OnUserProfile._(super.specs, super.ids, super.nav) : super._();
  OnUserProfile call(String id) =>
      OnUserProfile._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnNotifications extends On<NotificationsNav, AnyView> {
  const OnNotifications._(super.specs, super.ids, super.nav) : super._();
  On<NotificationSettingsNav, AnyView> get notificationSettings => On._(
    [...specs, _Screens.notificationSettings],
    [...ids, null],
    const NotificationSettingsNav._(),
  );
}

final class OnSearch extends On<SearchNav, SearchView> {
  const OnSearch._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnSearch query(Set<SearchQueryCond> cs) =>
      OnSearch._(specs, ids, nav, [...conds, ...cs]);
  OnSearch fragment(Set<SearchFragmentCond> cs) =>
      OnSearch._(specs, ids, nav, [...conds, ...cs]);
  On<SearchResultsNav, AnyView> get searchResults => On._(
    [...specs, _Screens.searchResults],
    [...ids, null],
    const SearchResultsNav._(),
  );
}

final class OnSettings extends On<SettingsNav, AnyView> {
  const OnSettings._(super.specs, super.ids, super.nav) : super._();
  On<AccountSettingsNav, AnyView> get accountSettings => On._(
    [...specs, _Screens.accountSettings],
    [...ids, null],
    const AccountSettingsNav._(),
  );
  OnSecurity get security => OnSecurity._(
    [...specs, _Screens.security],
    [...ids, null],
    const SecurityNav._(),
  );
  On<PrivacyNav, AnyView> get privacy =>
      On._([...specs, _Screens.privacy], [...ids, null], const PrivacyNav._());
  On<AppearanceNav, AnyView> get appearance => On._(
    [...specs, _Screens.appearance],
    [...ids, null],
    const AppearanceNav._(),
  );
  On<LanguageNav, AnyView> get language => On._(
    [...specs, _Screens.language],
    [...ids, null],
    const LanguageNav._(),
  );
  On<ConnectedAppsNav, AnyView> get connectedApps => On._(
    [...specs, _Screens.connectedApps],
    [...ids, null],
    const ConnectedAppsNav._(),
  );
  OnAbout get about =>
      OnAbout._([...specs, _Screens.about], [...ids, null], const AboutNav._());
  On<BlockedUsersNav, AnyView> get blockedUsers => On._(
    [...specs, _Screens.blockedUsers],
    [...ids, null],
    const BlockedUsersNav._(),
  );
  OnDevices get devices => OnDevices._(
    [...specs, _Screens.devices],
    [...ids, null],
    const DevicesNav._(),
  );
  On<DataExportNav, AnyView> get dataExport => On._(
    [...specs, _Screens.dataExport],
    [...ids, null],
    const DataExportNav._(),
  );
  On<DeleteAccountNav, AnyView> get deleteAccount => On._(
    [...specs, _Screens.deleteAccount],
    [...ids, null],
    const DeleteAccountNav._(),
  );
  OnIntegrations get integrations => OnIntegrations._(
    [...specs, _Screens.integrations],
    [...ids, null],
    const IntegrationsNav._(),
  );
  OnSupport get support => OnSupport._(
    [...specs, Support.support],
    [...ids, null],
    const SupportNav._(),
  );
  OnAdmin get admin =>
      OnAdmin._([...specs, Admin.admin], [...ids, null], const AdminNav._());
}

final class OnSecurity extends On<SecurityNav, AnyView> {
  const OnSecurity._(super.specs, super.ids, super.nav) : super._();
  On<TwoFactorSettingsNav, AnyView> get twoFactorSettings => On._(
    [...specs, _Screens.twoFactorSettings],
    [...ids, null],
    const TwoFactorSettingsNav._(),
  );
}

final class OnAbout extends On<AboutNav, AnyView> {
  const OnAbout._(super.specs, super.ids, super.nav) : super._();
  OnHelp get help =>
      OnHelp._([...specs, _Screens.help], [...ids, null], const HelpNav._());
  On<FeedbackNav, AnyView> get feedback => On._(
    [...specs, _Screens.feedback],
    [...ids, null],
    const FeedbackNav._(),
  );
}

final class OnHelp extends On<HelpNav, AnyView> {
  const OnHelp._(super.specs, super.ids, super.nav) : super._();
  OnHelpCategory get helpCategory => OnHelpCategory._(
    [...specs, _Screens.helpCategory],
    [...ids, null],
    const HelpCategoryNav._(),
  );
}

final class OnHelpCategory extends On<HelpCategoryNav, AnyView> {
  const OnHelpCategory._(super.specs, super.ids, super.nav) : super._();
  OnFaq get faq =>
      OnFaq._([...specs, _Screens.faq], [...ids, null], const FaqNav._());
  OnHelpCategory call(String id) =>
      OnHelpCategory._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnFaq extends On<FaqNav, AnyView> {
  const OnFaq._(super.specs, super.ids, super.nav) : super._();
  OnFaqArticle get faqArticle => OnFaqArticle._(
    [...specs, _Screens.faqArticle],
    [...ids, null],
    const FaqArticleNav._(),
  );
}

final class OnFaqArticle extends On<FaqArticleNav, AnyView> {
  const OnFaqArticle._(super.specs, super.ids, super.nav) : super._();
  OnFaqArticle call(String id) =>
      OnFaqArticle._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnDevices extends On<DevicesNav, AnyView> {
  const OnDevices._(super.specs, super.ids, super.nav) : super._();
  OnDevice get device => OnDevice._(
    [...specs, _Screens.device],
    [...ids, null],
    const DeviceNav._(),
  );
}

final class OnDevice extends On<DeviceNav, AnyView> {
  const OnDevice._(super.specs, super.ids, super.nav) : super._();
  On<SessionsNav, AnyView> get sessions => On._(
    [...specs, _Screens.sessions],
    [...ids, null],
    const SessionsNav._(),
  );
  OnSession get session => OnSession._(
    [...specs, _Screens.session],
    [...ids, null],
    const SessionNav._(),
  );
  OnDevice call(String id) =>
      OnDevice._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnSession extends On<SessionNav, AnyView> {
  const OnSession._(super.specs, super.ids, super.nav) : super._();
  OnSession call(String id) =>
      OnSession._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<SessionNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnIntegrations extends On<IntegrationsNav, AnyView> {
  const OnIntegrations._(super.specs, super.ids, super.nav) : super._();
  On<ApiKeysNav, AnyView> get apiKeys =>
      On._([...specs, _Screens.apiKeys], [...ids, null], const ApiKeysNav._());
}

final class OnSupport extends On<SupportNav, AnyView> {
  const OnSupport._(super.specs, super.ids, super.nav) : super._();
  OnSupportTickets get supportTickets => OnSupportTickets._(
    [...specs, Support.supportTickets],
    [...ids, null],
    const SupportTicketsNav._(),
  );
  On<NewTicketNav, AnyView> get newTicket => On._(
    [...specs, Support.newTicket],
    [...ids, null],
    const NewTicketNav._(),
  );
  OnKnowledgeBase get knowledgeBase => OnKnowledgeBase._(
    [...specs, Support.knowledgeBase],
    [...ids, null],
    const KnowledgeBaseNav._(),
  );
}

final class OnSupportTickets extends On<SupportTicketsNav, AnyView> {
  const OnSupportTickets._(super.specs, super.ids, super.nav) : super._();
  OnSupportTicket get supportTicket => OnSupportTicket._(
    [...specs, Support.supportTicket],
    [...ids, null],
    const SupportTicketNav._(),
  );
}

final class OnSupportTicket extends On<SupportTicketNav, AnyView> {
  const OnSupportTicket._(super.specs, super.ids, super.nav) : super._();
  OnSupportTicket call(String id) =>
      OnSupportTicket._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnKnowledgeBase extends On<KnowledgeBaseNav, AnyView> {
  const OnKnowledgeBase._(super.specs, super.ids, super.nav) : super._();
  OnArticle get article => OnArticle._(
    [...specs, Support.article],
    [...ids, null],
    const ArticleNav._(),
  );
}

final class OnArticle extends On<ArticleNav, AnyView> {
  const OnArticle._(super.specs, super.ids, super.nav) : super._();
  OnArticle call(String id) =>
      OnArticle._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnAdmin extends On<AdminNav, AnyView> {
  const OnAdmin._(super.specs, super.ids, super.nav) : super._();
  OnAdminUsers get adminUsers => OnAdminUsers._(
    [...specs, Admin.adminUsers],
    [...ids, null],
    const AdminUsersNav._(),
  );
  On<AdminAuditLogNav, AnyView> get adminAuditLog => On._(
    [...specs, Admin.adminAuditLog],
    [...ids, null],
    const AdminAuditLogNav._(),
  );
  On<AdminFeatureFlagsNav, AnyView> get adminFeatureFlags => On._(
    [...specs, Admin.adminFeatureFlags],
    [...ids, null],
    const AdminFeatureFlagsNav._(),
  );
  OnWebhooks get webhooks => OnWebhooks._(
    [...specs, Admin.webhooks],
    [...ids, null],
    const WebhooksNav._(),
  );
}

final class OnAdminUsers extends On<AdminUsersNav, AnyView> {
  const OnAdminUsers._(super.specs, super.ids, super.nav) : super._();
  OnAdminUser get adminUser => OnAdminUser._(
    [...specs, Admin.adminUser],
    [...ids, null],
    const AdminUserNav._(),
  );
}

final class OnAdminUser extends On<AdminUserNav, AnyView> {
  const OnAdminUser._(super.specs, super.ids, super.nav) : super._();
  OnAdminRole get adminRole => OnAdminRole._(
    [...specs, Admin.adminRole],
    [...ids, null],
    const AdminRoleNav._(),
  );
  OnAdminUser call(String id) =>
      OnAdminUser._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnAdminRole extends On<AdminRoleNav, AnyView> {
  const OnAdminRole._(super.specs, super.ids, super.nav) : super._();
  OnAdminRole call(String id) =>
      OnAdminRole._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnWebhooks extends On<WebhooksNav, AnyView> {
  const OnWebhooks._(super.specs, super.ids, super.nav) : super._();
  OnWebhook get webhook => OnWebhook._(
    [...specs, Admin.webhook],
    [...ids, null],
    const WebhookNav._(),
  );
}

final class OnWebhook extends On<WebhookNav, AnyView> {
  const OnWebhook._(super.specs, super.ids, super.nav) : super._();
  OnWebhook call(String id) =>
      OnWebhook._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnWorkspace extends On<WorkspaceNav, WorkspaceView> {
  const OnWorkspace._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnWorkspace query(Set<WorkspaceQueryCond> cs) =>
      OnWorkspace._(specs, ids, nav, [...conds, ...cs]);
  OnProject get project => OnProject._(
    [...specs, _Screens.project],
    [...ids, null],
    const ProjectNav._(),
  );
}

final class OnProject extends On<ProjectNav, ProjectView> {
  const OnProject._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnProject query(Set<ProjectQueryCond> cs) =>
      OnProject._(specs, ids, nav, [...conds, ...cs]);
  OnBoard get board =>
      OnBoard._([...specs, _Screens.board], [...ids, null], const BoardNav._());
  OnWorkspaceProjectUserProfile get userProfile =>
      OnWorkspaceProjectUserProfile._(
        [...specs, _Screens.userProfile],
        [...ids, null],
        const WorkspaceProjectUserProfileNav._(),
      );
  OnProject call(String id) =>
      OnProject._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnBoard extends On<BoardNav, BoardView> {
  const OnBoard._(super.specs, super.ids, super.nav, [super.conds]) : super._();
  OnBoard query(Set<BoardQueryCond> cs) =>
      OnBoard._(specs, ids, nav, [...conds, ...cs]);
  OnTaskList get taskList => OnTaskList._(
    [...specs, _Screens.taskList],
    [...ids, null],
    const TaskListNav._(),
  );
  OnBoard call(String id) =>
      OnBoard._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnTaskList extends On<TaskListNav, TaskListView> {
  const OnTaskList._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnTaskList query(Set<TaskListQueryCond> cs) =>
      OnTaskList._(specs, ids, nav, [...conds, ...cs]);
  OnTask get task =>
      OnTask._([...specs, _Screens.task], [...ids, null], const TaskNav._());
  OnMilestone get milestone => OnMilestone._(
    [...specs, _Screens.milestone],
    [...ids, null],
    const MilestoneNav._(),
  );
  OnSprint get sprint => OnSprint._(
    [...specs, _Screens.sprint],
    [...ids, null],
    const SprintNav._(),
  );
  On<EditTaskNav, AnyView> editTask(String id) => On._(
    [...specs, _Screens.task, _Screens.editTask],
    [...ids, id, null],
    const EditTaskNav._(),
  );
  On<TaskCommentNav, AnyView> taskComment(String id) => On._(
    [...specs, _Screens.task, _Screens.taskComment],
    [...ids, id, null],
    const TaskCommentNav._(),
  );
  OnTaskList call(String id) =>
      OnTaskList._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnTask extends On<TaskNav, TaskView> {
  const OnTask._(super.specs, super.ids, super.nav, [super.conds]) : super._();
  OnTask query(Set<TaskQueryCond> cs) =>
      OnTask._(specs, ids, nav, [...conds, ...cs]);
  OnSubtask get subtask => OnSubtask._(
    [...specs, _Screens.subtask],
    [...ids, null],
    const SubtaskNav._(),
  );
  OnAssignee get assignee => OnAssignee._(
    [...specs, _Screens.assignee],
    [...ids, null],
    const AssigneeNav._(),
  );
  OnLabel get label =>
      OnLabel._([...specs, _Screens.label], [...ids, null], const LabelNav._());
  OnTask call(String id) =>
      OnTask._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<TaskNav, TaskView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnSubtask extends On<SubtaskNav, AnyView> {
  const OnSubtask._(super.specs, super.ids, super.nav) : super._();
  OnChecklistItem get checklistItem => OnChecklistItem._(
    [...specs, _Screens.checklistItem],
    [...ids, null],
    const ChecklistItemNav._(),
  );
  OnSubtask call(String id) =>
      OnSubtask._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<SubtaskNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnChecklistItem extends On<ChecklistItemNav, AnyView> {
  const OnChecklistItem._(super.specs, super.ids, super.nav) : super._();
  OnChecklistItem call(String id) =>
      OnChecklistItem._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<ChecklistItemNav, AnyView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnAssignee extends On<AssigneeNav, AnyView> {
  const OnAssignee._(super.specs, super.ids, super.nav) : super._();
  OnAssignee call(String id) =>
      OnAssignee._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnLabel extends On<LabelNav, AnyView> {
  const OnLabel._(super.specs, super.ids, super.nav) : super._();
  OnLabel call(String id) =>
      OnLabel._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnMilestone extends On<MilestoneNav, AnyView> {
  const OnMilestone._(super.specs, super.ids, super.nav) : super._();
  OnMilestone call(String id) =>
      OnMilestone._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnSprint extends On<SprintNav, AnyView> {
  const OnSprint._(super.specs, super.ids, super.nav) : super._();
  OnSprint call(String id) =>
      OnSprint._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnWorkspaceProjectUserProfile
    extends On<WorkspaceProjectUserProfileNav, AnyView> {
  const OnWorkspaceProjectUserProfile._(super.specs, super.ids, super.nav)
    : super._();
  OnWorkspaceProjectUserProfile call(String id) =>
      OnWorkspaceProjectUserProfile._(specs, [
        ...ids.sublist(0, ids.length - 1),
        id,
      ], nav);
}

final class OnEditTask extends On<EditTaskNav, AnyView> {
  const OnEditTask._(super.specs, super.ids, super.nav) : super._();
  OnEditTask call(String id) =>
      OnEditTask._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnTaskComment extends On<TaskCommentNav, AnyView> {
  const OnTaskComment._(super.specs, super.ids, super.nav) : super._();
  OnTaskComment call(String id) =>
      OnTaskComment._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnForum extends On<ForumNav, AnyView> {
  const OnForum._(super.specs, super.ids, super.nav) : super._();
  OnForumCategory get forumCategory => OnForumCategory._(
    [...specs, _Screens.forumCategory],
    [...ids, null],
    const ForumCategoryNav._(),
  );
}

final class OnForumCategory extends On<ForumCategoryNav, ForumCategoryView> {
  const OnForumCategory._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnForumCategory query(Set<ForumCategoryQueryCond> cs) =>
      OnForumCategory._(specs, ids, nav, [...conds, ...cs]);
  OnForumThread get forumThread => OnForumThread._(
    [...specs, _Screens.forumThread],
    [...ids, null],
    const ForumThreadNav._(),
  );
  On<ReportThreadNav, AnyView> reportThread(String id) => On._(
    [...specs, _Screens.forumThread, _Screens.reportThread],
    [...ids, id, null],
    const ReportThreadNav._(),
  );
  OnForumCategory call(String id) =>
      OnForumCategory._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnForumThread extends On<ForumThreadNav, ForumThreadView> {
  const OnForumThread._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnForumThread query(Set<ForumThreadQueryCond> cs) =>
      OnForumThread._(specs, ids, nav, [...conds, ...cs]);
  OnForumReply get forumReply => OnForumReply._(
    [...specs, _Screens.forumReply],
    [...ids, null],
    const ForumReplyNav._(),
  );
  OnForumThread call(String id) =>
      OnForumThread._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<ForumThreadNav, ForumThreadView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnForumReply extends On<ForumReplyNav, AnyView> {
  const OnForumReply._(super.specs, super.ids, super.nav) : super._();
  OnForumForumCategoryForumThreadForumReplyUserProfile get userProfile =>
      OnForumForumCategoryForumThreadForumReplyUserProfile._(
        [...specs, _Screens.userProfile],
        [...ids, null],
        const ForumForumCategoryForumThreadForumReplyUserProfileNav._(),
      );
  OnForumReply call(String id) =>
      OnForumReply._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<ForumReplyNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnForumForumCategoryForumThreadForumReplyUserProfile
    extends On<ForumForumCategoryForumThreadForumReplyUserProfileNav, AnyView> {
  const OnForumForumCategoryForumThreadForumReplyUserProfile._(
    super.specs,
    super.ids,
    super.nav,
  ) : super._();
  OnForumForumCategoryForumThreadForumReplyUserProfile call(String id) =>
      OnForumForumCategoryForumThreadForumReplyUserProfile._(specs, [
        ...ids.sublist(0, ids.length - 1),
        id,
      ], nav);
}

final class OnReportThread extends On<ReportThreadNav, AnyView> {
  const OnReportThread._(super.specs, super.ids, super.nav) : super._();
  OnReportThread call(String id) =>
      OnReportThread._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnLearn extends On<LearnNav, AnyView> {
  const OnLearn._(super.specs, super.ids, super.nav) : super._();
  OnCourse get course => OnCourse._(
    [...specs, _Screens.course],
    [...ids, null],
    const CourseNav._(),
  );
  On<CertificateNav, AnyView> certificate(String id) => On._(
    [...specs, _Screens.course, _Screens.certificate],
    [...ids, id, null],
    const CertificateNav._(),
  );
}

final class OnCourse extends On<CourseNav, CourseView> {
  const OnCourse._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnCourse query(Set<CourseQueryCond> cs) =>
      OnCourse._(specs, ids, nav, [...conds, ...cs]);
  OnCourseModule get courseModule => OnCourseModule._(
    [...specs, _Screens.courseModule],
    [...ids, null],
    const CourseModuleNav._(),
  );
  OnCourse call(String id) =>
      OnCourse._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnCourseModule extends On<CourseModuleNav, AnyView> {
  const OnCourseModule._(super.specs, super.ids, super.nav) : super._();
  OnLesson get lesson => OnLesson._(
    [...specs, _Screens.lesson],
    [...ids, null],
    const LessonNav._(),
  );
  OnInstructor get instructor => OnInstructor._(
    [...specs, _Screens.instructor],
    [...ids, null],
    const InstructorNav._(),
  );
  OnCourseModule call(String id) =>
      OnCourseModule._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnLesson extends On<LessonNav, AnyView> {
  const OnLesson._(super.specs, super.ids, super.nav) : super._();
  OnQuiz get quiz =>
      OnQuiz._([...specs, _Screens.quiz], [...ids, null], const QuizNav._());
  OnCourseReview get courseReview => OnCourseReview._(
    [...specs, _Screens.courseReview],
    [...ids, null],
    const CourseReviewNav._(),
  );
  OnLesson call(String id) =>
      OnLesson._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnQuiz extends On<QuizNav, AnyView> {
  const OnQuiz._(super.specs, super.ids, super.nav) : super._();
  OnQuestion get question => OnQuestion._(
    [...specs, _Screens.question],
    [...ids, null],
    const QuestionNav._(),
  );
  On<AnswerNav, AnyView> answer(String id) => On._(
    [...specs, _Screens.question, _Screens.answer],
    [...ids, id, null],
    const AnswerNav._(),
  );
  OnQuiz call(String id) =>
      OnQuiz._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnQuestion extends On<QuestionNav, AnyView> {
  const OnQuestion._(super.specs, super.ids, super.nav) : super._();
  OnQuestion call(String id) =>
      OnQuestion._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<QuestionNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnCourseReview extends On<CourseReviewNav, AnyView> {
  const OnCourseReview._(super.specs, super.ids, super.nav) : super._();
  OnCourseReview call(String id) =>
      OnCourseReview._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnInstructor extends On<InstructorNav, AnyView> {
  const OnInstructor._(super.specs, super.ids, super.nav) : super._();
  OnInstructor call(String id) =>
      OnInstructor._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnAnswer extends On<AnswerNav, AnyView> {
  const OnAnswer._(super.specs, super.ids, super.nav) : super._();
  OnAnswer call(String id) =>
      OnAnswer._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnCertificate extends On<CertificateNav, AnyView> {
  const OnCertificate._(super.specs, super.ids, super.nav) : super._();
  OnCertificate call(String id) =>
      OnCertificate._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnShop extends On<ShopNav, AnyView> {
  const OnShop._(super.specs, super.ids, super.nav) : super._();
  OnShopDept get shopDept => OnShopDept._(
    [...specs, _Screens.shopDept],
    [...ids, null],
    const ShopDeptNav._(),
  );
  On<CompareProductsNav, AnyView> get compareProducts => On._(
    [...specs, _Screens.compareProducts],
    [...ids, null],
    const CompareProductsNav._(),
  );
}

final class OnShopDept extends On<ShopDeptNav, AnyView> {
  const OnShopDept._(super.specs, super.ids, super.nav) : super._();
  OnShopCategory get shopCategory => OnShopCategory._(
    [...specs, _Screens.shopCategory],
    [...ids, null],
    const ShopCategoryNav._(),
  );
  OnShopDept call(String id) =>
      OnShopDept._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnShopCategory extends On<ShopCategoryNav, AnyView> {
  const OnShopCategory._(super.specs, super.ids, super.nav) : super._();
  OnShopSubcategory get shopSubcategory => OnShopSubcategory._(
    [...specs, _Screens.shopSubcategory],
    [...ids, null],
    const ShopSubcategoryNav._(),
  );
  OnShopCategory call(String id) =>
      OnShopCategory._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnShopSubcategory
    extends On<ShopSubcategoryNav, ShopSubcategoryView> {
  const OnShopSubcategory._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnShopSubcategory query(Set<ShopSubcategoryQueryCond> cs) =>
      OnShopSubcategory._(specs, ids, nav, [...conds, ...cs]);
  OnProduct get product => OnProduct._(
    [...specs, _Screens.product],
    [...ids, null],
    const ProductNav._(),
  );
  OnShopSubcategory call(String id) =>
      OnShopSubcategory._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnProduct extends On<ProductNav, ProductView> {
  const OnProduct._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnProduct query(Set<ProductQueryCond> cs) =>
      OnProduct._(specs, ids, nav, [...conds, ...cs]);
  OnProductVariant get productVariant => OnProductVariant._(
    [...specs, _Screens.productVariant],
    [...ids, null],
    const ProductVariantNav._(),
  );
  OnProductReview get productReview => OnProductReview._(
    [...specs, _Screens.productReview],
    [...ids, null],
    const ProductReviewNav._(),
  );
  OnBrand get brand =>
      OnBrand._([...specs, _Screens.brand], [...ids, null], const BrandNav._());
  OnProduct call(String id) =>
      OnProduct._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<ProductNav, ProductView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnProductVariant extends On<ProductVariantNav, AnyView> {
  const OnProductVariant._(super.specs, super.ids, super.nav) : super._();
  OnProductVariant call(String id) =>
      OnProductVariant._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<ProductVariantNav, AnyView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnProductReview extends On<ProductReviewNav, AnyView> {
  const OnProductReview._(super.specs, super.ids, super.nav) : super._();
  OnProductReview call(String id) =>
      OnProductReview._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnBrand extends On<BrandNav, AnyView> {
  const OnBrand._(super.specs, super.ids, super.nav) : super._();
  OnBrand call(String id) =>
      OnBrand._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnActivity extends On<ActivityNav, AnyView> {
  const OnActivity._(super.specs, super.ids, super.nav) : super._();
  OnWorkout get workout => OnWorkout._(
    [...specs, _Screens.workout],
    [...ids, null],
    const WorkoutNav._(),
  );
}

final class OnWorkout extends On<WorkoutNav, WorkoutView> {
  const OnWorkout._(super.specs, super.ids, super.nav, [super.conds])
    : super._();
  OnWorkout query(Set<WorkoutQueryCond> cs) =>
      OnWorkout._(specs, ids, nav, [...conds, ...cs]);
  OnExercise get exercise => OnExercise._(
    [...specs, _Screens.exercise],
    [...ids, null],
    const ExerciseNav._(),
  );
  OnWorkout call(String id) =>
      OnWorkout._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnExercise extends On<ExerciseNav, AnyView> {
  const OnExercise._(super.specs, super.ids, super.nav) : super._();
  OnExerciseSet get exerciseSet => OnExerciseSet._(
    [...specs, _Screens.exerciseSet],
    [...ids, null],
    const ExerciseSetNav._(),
  );
  OnExercise call(String id) =>
      OnExercise._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnExerciseSet extends On<ExerciseSetNav, AnyView> {
  const OnExerciseSet._(super.specs, super.ids, super.nav) : super._();
  OnExerciseSet call(String id) =>
      OnExerciseSet._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<ExerciseSetNav, AnyView> depth(int d) =>
      OnDepth._(specs, ids, d, nav);
}

final class OnDeepDemo extends On<DeepDemoNav, AnyView> {
  const OnDeepDemo._(super.specs, super.ids, super.nav) : super._();
  OnLevelA get levelA => OnLevelA._(
    [...specs, _Screens.levelA],
    [...ids, null],
    const LevelANav._(),
  );
}

final class OnLevelA extends On<LevelANav, AnyView> {
  const OnLevelA._(super.specs, super.ids, super.nav) : super._();
  OnLevelB get levelB => OnLevelB._(
    [...specs, _Screens.levelB],
    [...ids, null],
    const LevelBNav._(),
  );
  OnLevelA call(String id) =>
      OnLevelA._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<LevelANav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnLevelB extends On<LevelBNav, AnyView> {
  const OnLevelB._(super.specs, super.ids, super.nav) : super._();
  OnLevelC get levelC => OnLevelC._(
    [...specs, _Screens.levelC],
    [...ids, null],
    const LevelCNav._(),
  );
  OnLevelB call(String id) =>
      OnLevelB._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<LevelBNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnLevelC extends On<LevelCNav, AnyView> {
  const OnLevelC._(super.specs, super.ids, super.nav) : super._();
  OnLevelD get levelD => OnLevelD._(
    [...specs, _Screens.levelD],
    [...ids, null],
    const LevelDNav._(),
  );
  OnLevelC call(String id) =>
      OnLevelC._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<LevelCNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnLevelD extends On<LevelDNav, AnyView> {
  const OnLevelD._(super.specs, super.ids, super.nav) : super._();
  OnLevelE get levelE => OnLevelE._(
    [...specs, _Screens.levelE],
    [...ids, null],
    const LevelENav._(),
  );
  OnLevelD call(String id) =>
      OnLevelD._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<LevelDNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnLevelE extends On<LevelENav, AnyView> {
  const OnLevelE._(super.specs, super.ids, super.nav) : super._();
  OnLevelF get levelF => OnLevelF._(
    [...specs, _Screens.levelF],
    [...ids, null],
    const LevelFNav._(),
  );
  OnLevelE call(String id) =>
      OnLevelE._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<LevelENav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnLevelF extends On<LevelFNav, AnyView> {
  const OnLevelF._(super.specs, super.ids, super.nav) : super._();
  OnLevelF call(String id) =>
      OnLevelF._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
  OnDepth<LevelFNav, AnyView> depth(int d) => OnDepth._(specs, ids, d, nav);
}

final class OnEditScheduled extends On<EditScheduledNav, AnyView> {
  const OnEditScheduled._(super.specs, super.ids, super.nav) : super._();
  OnEditScheduled call(String id) =>
      OnEditScheduled._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnAttendees extends On<AttendeesNav, AnyView> {
  const OnAttendees._(super.specs, super.ids, super.nav) : super._();
  OnAttendees call(String id) =>
      OnAttendees._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnEditEvent extends On<EditEventNav, AnyView> {
  const OnEditEvent._(super.specs, super.ids, super.nav) : super._();
  OnEditEvent call(String id) =>
      OnEditEvent._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class OnTickets extends On<TicketsNav, AnyView> {
  const OnTickets._(super.specs, super.ids, super.nav) : super._();
  OnTickets call(String id) =>
      OnTickets._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

sealed class AnyPlacement extends AnyNav {
  const AnyPlacement._() : super._();
}

AnyPlacement _atOf(Enum s) {
  final c = _Screens.graph.currentChain;
  final p = c.sublist(0, c.lastIndexOf(s) + 1);
  return switch (s) {
    _Screens.splash => const SplashNav._(),
    _Screens.signIn => const SignInNav._(),
    _Screens.signUp => const SignUpNav._(),
    _Screens.onboarding => const OnboardingNav._(),
    _Screens.forgotPassword => const ForgotPasswordNav._(),
    _Screens.resetPassword => const ResetPasswordNav._(),
    _Screens.verifyEmail => const VerifyEmailNav._(),
    _Screens.twoFactor => const TwoFactorNav._(),
    _Screens.home => const HomeNav._(),
    _Screens.feed => const FeedNav._(),
    _Screens.composePost => const ComposePostNav._(),
    _Screens.story => const StoryNav._(),
    _Screens.post => const PostNav._(),
    _Screens.comment => const CommentNav._(),
    _Screens.postAuthor => const PostAuthorNav._(),
    _Screens.postComments => const PostCommentsNav._(),
    _Screens.postLikes => const PostLikesNav._(),
    _Screens.editPost => const EditPostNav._(),
    _Screens.repost => const RepostNav._(),
    _Screens.discover => const DiscoverNav._(),
    _Screens.trending => const TrendingNav._(),
    _Screens.topics => const TopicsNav._(),
    _Screens.topic => const TopicNav._(),
    _Screens.subtopic => const SubtopicNav._(),
    _Screens.hashtag => const HashtagNav._(),
    _Screens.liveNow => const LiveNowNav._(),
    _Screens.liveRoom => const LiveRoomNav._(),
    _Screens.nearby => const NearbyNav._(),
    _Screens.marketplace => const MarketplaceNav._(),
    _Screens.categories => const CategoriesNav._(),
    _Screens.category => const CategoryNav._(),
    _Screens.listing => const ListingNav._(),
    _Screens.listingVariant => const ListingVariantNav._(),
    _Screens.editListing => const EditListingNav._(),
    _Screens.sellerProfile => const SellerProfileNav._(),
    _Screens.cart => const CartNav._(),
    _Screens.checkout => const CheckoutNav._(),
    _Screens.orderConfirmation => const OrderConfirmationNav._(),
    _Screens.myOrders => const MyOrdersNav._(),
    _Screens.order => const OrderNav._(),
    _Screens.wishlist => const WishlistNav._(),
    _Screens.messages => const MessagesNav._(),
    _Screens.chats => const ChatsNav._(),
    _Screens.chat => const ChatNav._(),
    _Screens.thread => const ThreadNav._(),
    _Screens.message => const MessageNav._(),
    _Screens.messageReply => const MessageReplyNav._(),
    _Screens.voiceCall => const VoiceCallNav._(),
    _Screens.newChat => const NewChatNav._(),
    _Screens.groupChat => const GroupChatNav._(),
    _Screens.groupInfo => const GroupInfoNav._(),
    _Screens.wallet => const WalletNav._(),
    _Screens.balance => const BalanceNav._(),
    _Screens.accounts => const AccountsNav._(),
    _Screens.account => const AccountNav._(),
    _Screens.transactions => const TransactionsNav._(),
    _Screens.transaction => const TransactionNav._(),
    _Screens.transactionItem => const TransactionItemNav._(),
    _Screens.sendMoney => const SendMoneyNav._(),
    _Screens.receiveMoney => const ReceiveMoneyNav._(),
    _Screens.paymentMethods => const PaymentMethodsNav._(),
    _Screens.addCard => const AddCardNav._(),
    _Screens.card => const CardNav._(),
    _Screens.statements => const StatementsNav._(),
    _Screens.statement => const StatementNav._(),
    _Screens.profile => const ProfileNav._(),
    _Screens.userProfile => _resolveUserProfilePlacement(p),
    _Screens.followers => const FollowersNav._(),
    _Screens.following => const FollowingNav._(),
    _Screens.connection => const ConnectionNav._(),
    _Screens.mutualConnections => const MutualConnectionsNav._(),
    _Screens.editProfile => const EditProfileNav._(),
    _Screens.achievements => const AchievementsNav._(),
    _Screens.badges => const BadgesNav._(),
    _Screens.badge => const BadgeNav._(),
    _Screens.savedPosts => const SavedPostsNav._(),
    _Screens.drafts => const DraftsNav._(),
    _Screens.myListings => const MyListingsNav._(),
    _Screens.notifications => const NotificationsNav._(),
    _Screens.notificationSettings => const NotificationSettingsNav._(),
    _Screens.search => const SearchNav._(),
    _Screens.searchResults => const SearchResultsNav._(),
    _Screens.settings => const SettingsNav._(),
    _Screens.accountSettings => const AccountSettingsNav._(),
    _Screens.security => const SecurityNav._(),
    _Screens.twoFactorSettings => const TwoFactorSettingsNav._(),
    _Screens.privacy => const PrivacyNav._(),
    _Screens.appearance => const AppearanceNav._(),
    _Screens.language => const LanguageNav._(),
    _Screens.connectedApps => const ConnectedAppsNav._(),
    _Screens.about => const AboutNav._(),
    _Screens.help => const HelpNav._(),
    _Screens.helpCategory => const HelpCategoryNav._(),
    _Screens.faq => const FaqNav._(),
    _Screens.faqArticle => const FaqArticleNav._(),
    _Screens.feedback => const FeedbackNav._(),
    _Screens.blockedUsers => const BlockedUsersNav._(),
    _Screens.devices => const DevicesNav._(),
    _Screens.device => const DeviceNav._(),
    _Screens.sessions => const SessionsNav._(),
    _Screens.session => const SessionNav._(),
    _Screens.dataExport => const DataExportNav._(),
    _Screens.deleteAccount => const DeleteAccountNav._(),
    _Screens.workspace => const WorkspaceNav._(),
    _Screens.project => const ProjectNav._(),
    _Screens.board => const BoardNav._(),
    _Screens.taskList => const TaskListNav._(),
    _Screens.task => const TaskNav._(),
    _Screens.subtask => const SubtaskNav._(),
    _Screens.checklistItem => const ChecklistItemNav._(),
    _Screens.editTask => const EditTaskNav._(),
    _Screens.taskComment => const TaskCommentNav._(),
    _Screens.assignee => const AssigneeNav._(),
    _Screens.label => const LabelNav._(),
    _Screens.milestone => const MilestoneNav._(),
    _Screens.sprint => const SprintNav._(),
    _Screens.forum => const ForumNav._(),
    _Screens.forumCategory => const ForumCategoryNav._(),
    _Screens.forumThread => const ForumThreadNav._(),
    _Screens.forumReply => const ForumReplyNav._(),
    _Screens.reportThread => const ReportThreadNav._(),
    _Screens.learn => const LearnNav._(),
    _Screens.course => const CourseNav._(),
    _Screens.courseModule => const CourseModuleNav._(),
    _Screens.lesson => const LessonNav._(),
    _Screens.quiz => const QuizNav._(),
    _Screens.question => const QuestionNav._(),
    _Screens.answer => const AnswerNav._(),
    _Screens.courseReview => const CourseReviewNav._(),
    _Screens.instructor => const InstructorNav._(),
    _Screens.certificate => const CertificateNav._(),
    _Screens.shop => const ShopNav._(),
    _Screens.shopDept => const ShopDeptNav._(),
    _Screens.shopCategory => const ShopCategoryNav._(),
    _Screens.shopSubcategory => const ShopSubcategoryNav._(),
    _Screens.product => const ProductNav._(),
    _Screens.productVariant => const ProductVariantNav._(),
    _Screens.productReview => const ProductReviewNav._(),
    _Screens.brand => const BrandNav._(),
    _Screens.compareProducts => const CompareProductsNav._(),
    _Screens.activity => const ActivityNav._(),
    _Screens.workout => const WorkoutNav._(),
    _Screens.exercise => const ExerciseNav._(),
    _Screens.exerciseSet => const ExerciseSetNav._(),
    _Screens.deepDemo => const DeepDemoNav._(),
    _Screens.levelA => const LevelANav._(),
    _Screens.levelB => const LevelBNav._(),
    _Screens.levelC => const LevelCNav._(),
    _Screens.levelD => const LevelDNav._(),
    _Screens.levelE => const LevelENav._(),
    _Screens.levelF => const LevelFNav._(),
    _Screens.integrations => const IntegrationsNav._(),
    _Screens.apiKeys => const ApiKeysNav._(),
    CreatorStudio.studio => const StudioNav._(),
    CreatorStudio.analytics => const AnalyticsNav._(),
    CreatorStudio.audience => const AudienceNav._(),
    CreatorStudio.scheduled => const ScheduledNav._(),
    CreatorStudio.scheduledPost => const ScheduledPostNav._(),
    CreatorStudio.editScheduled => const EditScheduledNav._(),
    CreatorStudio.monetization => const MonetizationNav._(),
    CreatorStudio.payouts => const PayoutsNav._(),
    Events.events => const EventsNav._(),
    Events.event => const EventNav._(),
    Events.attendees => const AttendeesNav._(),
    Events.editEvent => const EditEventNav._(),
    Events.createEvent => const CreateEventNav._(),
    Events.tickets => const TicketsNav._(),
    Support.support => const SupportNav._(),
    Support.supportTickets => const SupportTicketsNav._(),
    Support.supportTicket => const SupportTicketNav._(),
    Support.newTicket => const NewTicketNav._(),
    Support.knowledgeBase => const KnowledgeBaseNav._(),
    Support.article => const ArticleNav._(),
    Admin.admin => const AdminNav._(),
    Admin.adminUsers => const AdminUsersNav._(),
    Admin.adminUser => const AdminUserNav._(),
    Admin.adminAuditLog => const AdminAuditLogNav._(),
    Admin.adminRole => const AdminRoleNav._(),
    Admin.adminFeatureFlags => const AdminFeatureFlagsNav._(),
    Admin.webhooks => const WebhooksNav._(),
    Admin.webhook => const WebhookNav._(),
    BootScreen.root => const Root._(),
    _ => throw StateError('not a _Screens screen'),
  };
}

abstract base class AnyNav {
  const AnyNav._();
}

sealed class FeedStoryPopPlacement {}

FeedStoryPopPlacement _resolveFeedStoryPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [_Screens.home, _Screens.feed, _Screens.story]))
    return const StoryNav._();
  if (_endsWith(c, const [_Screens.home, _Screens.feed]))
    return const FeedNav._();
  throw StateError('unresolved FeedStoryPopPlacement: $c');
}

sealed class CommentFeedPostPostAuthorPopPlacement {}

CommentFeedPostPostAuthorPopPlacement
_resolveCommentFeedPostPostAuthorPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.feed,
    _Screens.post,
    _Screens.comment,
  ]))
    return const CommentNav._();
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.feed,
    _Screens.post,
    _Screens.postAuthor,
  ]))
    return const PostAuthorNav._();
  if (_endsWith(c, const [_Screens.home, _Screens.feed, _Screens.post]))
    return const PostNav._();
  if (_endsWith(c, const [_Screens.home, _Screens.feed]))
    return const FeedNav._();
  throw StateError('unresolved CommentFeedPostPostAuthorPopPlacement: $c');
}

sealed class CommentPostPopPlacement {}

CommentPostPopPlacement _resolveCommentPostPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.feed,
    _Screens.post,
    _Screens.comment,
  ]))
    return const CommentNav._();
  if (_endsWith(c, const [_Screens.home, _Screens.feed, _Screens.post]))
    return const PostNav._();
  throw StateError('unresolved CommentPostPopPlacement: $c');
}

sealed class PostPostAuthorPopPlacement {}

PostPostAuthorPopPlacement _resolvePostPostAuthorPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.home,
    _Screens.feed,
    _Screens.post,
    _Screens.postAuthor,
  ]))
    return const PostAuthorNav._();
  if (_endsWith(c, const [_Screens.home, _Screens.feed, _Screens.post]))
    return const PostNav._();
  throw StateError('unresolved PostPostAuthorPopPlacement: $c');
}

sealed class SubtopicTopicTrendingPopPlacement {}

SubtopicTopicTrendingPopPlacement _resolveSubtopicTopicTrendingPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.discover,
    _Screens.trending,
    _Screens.topic,
    _Screens.subtopic,
  ]))
    return const SubtopicNav._();
  if (_endsWith(c, const [
    _Screens.discover,
    _Screens.trending,
    _Screens.topic,
  ]))
    return const TopicNav._();
  if (_endsWith(c, const [_Screens.discover, _Screens.trending]))
    return const TrendingNav._();
  throw StateError('unresolved SubtopicTopicTrendingPopPlacement: $c');
}

sealed class SubtopicTopicPopPlacement {}

SubtopicTopicPopPlacement _resolveSubtopicTopicPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.discover,
    _Screens.trending,
    _Screens.topic,
    _Screens.subtopic,
  ]))
    return const SubtopicNav._();
  if (_endsWith(c, const [
    _Screens.discover,
    _Screens.trending,
    _Screens.topic,
  ]))
    return const TopicNav._();
  throw StateError('unresolved SubtopicTopicPopPlacement: $c');
}

sealed class HashtagTrendingPopPlacement {}

HashtagTrendingPopPlacement _resolveHashtagTrendingPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.discover,
    _Screens.trending,
    _Screens.hashtag,
  ]))
    return const HashtagNav._();
  if (_endsWith(c, const [_Screens.discover, _Screens.trending]))
    return const TrendingNav._();
  throw StateError('unresolved HashtagTrendingPopPlacement: $c');
}

sealed class LiveNowLiveRoomPopPlacement {}

LiveNowLiveRoomPopPlacement _resolveLiveNowLiveRoomPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.discover,
    _Screens.liveNow,
    _Screens.liveRoom,
  ]))
    return const LiveRoomNav._();
  if (_endsWith(c, const [_Screens.discover, _Screens.liveNow]))
    return const LiveNowNav._();
  throw StateError('unresolved LiveNowLiveRoomPopPlacement: $c');
}

sealed class CategoriesCategoryPopPlacement {}

CategoriesCategoryPopPlacement _resolveCategoriesCategoryPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.marketplace,
    _Screens.categories,
    _Screens.category,
  ]))
    return const CategoryNav._();
  if (_endsWith(c, const [_Screens.marketplace, _Screens.categories]))
    return const CategoriesNav._();
  throw StateError('unresolved CategoriesCategoryPopPlacement: $c');
}

sealed class CategoryListingSellerProfilePopPlacement {}

CategoryListingSellerProfilePopPlacement
_resolveCategoryListingSellerProfilePopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.marketplace,
    _Screens.categories,
    _Screens.category,
    _Screens.listing,
    _Screens.sellerProfile,
  ]))
    return const SellerProfileNav._();
  if (_endsWith(c, const [
    _Screens.marketplace,
    _Screens.categories,
    _Screens.category,
    _Screens.listing,
  ]))
    return const ListingNav._();
  if (_endsWith(c, const [
    _Screens.marketplace,
    _Screens.categories,
    _Screens.category,
  ]))
    return const CategoryNav._();
  throw StateError('unresolved CategoryListingSellerProfilePopPlacement: $c');
}

sealed class ListingListingVariantPopPlacement {}

ListingListingVariantPopPlacement _resolveListingListingVariantPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.marketplace,
    _Screens.categories,
    _Screens.category,
    _Screens.listing,
    _Screens.listingVariant,
  ]))
    return const ListingVariantNav._();
  if (_endsWith(c, const [
    _Screens.marketplace,
    _Screens.categories,
    _Screens.category,
    _Screens.listing,
  ]))
    return const ListingNav._();
  throw StateError('unresolved ListingListingVariantPopPlacement: $c');
}

sealed class ListingSellerProfilePopPlacement {}

ListingSellerProfilePopPlacement _resolveListingSellerProfilePopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.marketplace,
    _Screens.categories,
    _Screens.category,
    _Screens.listing,
    _Screens.sellerProfile,
  ]))
    return const SellerProfileNav._();
  if (_endsWith(c, const [
    _Screens.marketplace,
    _Screens.categories,
    _Screens.category,
    _Screens.listing,
  ]))
    return const ListingNav._();
  throw StateError('unresolved ListingSellerProfilePopPlacement: $c');
}

sealed class MyOrdersOrderPopPlacement {}

MyOrdersOrderPopPlacement _resolveMyOrdersOrderPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.marketplace,
    _Screens.myOrders,
    _Screens.order,
  ]))
    return const OrderNav._();
  if (_endsWith(c, const [_Screens.marketplace, _Screens.myOrders]))
    return const MyOrdersNav._();
  throw StateError('unresolved MyOrdersOrderPopPlacement: $c');
}

sealed class ChatsMessagePopPlacement {}

ChatsMessagePopPlacement _resolveChatsMessagePopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.messages,
    _Screens.chats,
    _Screens.chat,
    _Screens.thread,
    _Screens.message,
  ]))
    return const MessageNav._();
  if (_endsWith(c, const [_Screens.messages, _Screens.chats]))
    return const ChatsNav._();
  throw StateError('unresolved ChatsMessagePopPlacement: $c');
}

sealed class ChatThreadPopPlacement {}

ChatThreadPopPlacement _resolveChatThreadPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.messages,
    _Screens.chats,
    _Screens.chat,
    _Screens.thread,
  ]))
    return const ThreadNav._();
  if (_endsWith(c, const [_Screens.messages, _Screens.chats, _Screens.chat]))
    return const ChatNav._();
  throw StateError('unresolved ChatThreadPopPlacement: $c');
}

sealed class MessageMessageReplyPopPlacement {}

MessageMessageReplyPopPlacement _resolveMessageMessageReplyPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.messages,
    _Screens.chats,
    _Screens.chat,
    _Screens.thread,
    _Screens.message,
    _Screens.messageReply,
  ]))
    return const MessageReplyNav._();
  if (_endsWith(c, const [
    _Screens.messages,
    _Screens.chats,
    _Screens.chat,
    _Screens.thread,
    _Screens.message,
  ]))
    return const MessageNav._();
  throw StateError('unresolved MessageMessageReplyPopPlacement: $c');
}

sealed class GroupChatMessagesPopPlacement {}

GroupChatMessagesPopPlacement _resolveGroupChatMessagesPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [_Screens.messages, _Screens.groupChat]))
    return const GroupChatNav._();
  if (_endsWith(c, const [_Screens.messages])) return const MessagesNav._();
  throw StateError('unresolved GroupChatMessagesPopPlacement: $c');
}

sealed class AccountAccountsPopPlacement {}

AccountAccountsPopPlacement _resolveAccountAccountsPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.wallet,
    _Screens.accounts,
    _Screens.account,
  ]))
    return const AccountNav._();
  if (_endsWith(c, const [_Screens.wallet, _Screens.accounts]))
    return const AccountsNav._();
  throw StateError('unresolved AccountAccountsPopPlacement: $c');
}

sealed class TransactionTransactionsPopPlacement {}

TransactionTransactionsPopPlacement
_resolveTransactionTransactionsPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.wallet,
    _Screens.accounts,
    _Screens.account,
    _Screens.transactions,
    _Screens.transaction,
  ]))
    return const TransactionNav._();
  if (_endsWith(c, const [
    _Screens.wallet,
    _Screens.accounts,
    _Screens.account,
    _Screens.transactions,
  ]))
    return const TransactionsNav._();
  throw StateError('unresolved TransactionTransactionsPopPlacement: $c');
}

sealed class TransactionTransactionItemPopPlacement {}

TransactionTransactionItemPopPlacement
_resolveTransactionTransactionItemPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.wallet,
    _Screens.accounts,
    _Screens.account,
    _Screens.transactions,
    _Screens.transaction,
    _Screens.transactionItem,
  ]))
    return const TransactionItemNav._();
  if (_endsWith(c, const [
    _Screens.wallet,
    _Screens.accounts,
    _Screens.account,
    _Screens.transactions,
    _Screens.transaction,
  ]))
    return const TransactionNav._();
  throw StateError('unresolved TransactionTransactionItemPopPlacement: $c');
}

sealed class ConnectionFollowersPopPlacement {}

ConnectionFollowersPopPlacement _resolveConnectionFollowersPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.profile,
    _Screens.followers,
    _Screens.connection,
  ]))
    return const ConnectionNav._();
  if (_endsWith(c, const [_Screens.profile, _Screens.followers]))
    return const FollowersNav._();
  throw StateError('unresolved ConnectionFollowersPopPlacement: $c');
}

sealed class BadgeBadgesPopPlacement {}

BadgeBadgesPopPlacement _resolveBadgeBadgesPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [_Screens.profile, _Screens.badges, _Screens.badge]))
    return const BadgeNav._();
  if (_endsWith(c, const [_Screens.profile, _Screens.badges]))
    return const BadgesNav._();
  throw StateError('unresolved BadgeBadgesPopPlacement: $c');
}

sealed class DeviceSessionPopPlacement {}

DeviceSessionPopPlacement _resolveDeviceSessionPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.settings,
    _Screens.devices,
    _Screens.device,
    _Screens.session,
  ]))
    return const SessionNav._();
  if (_endsWith(c, const [
    _Screens.settings,
    _Screens.devices,
    _Screens.device,
  ]))
    return const DeviceNav._();
  throw StateError('unresolved DeviceSessionPopPlacement: $c');
}

sealed class TaskTaskListPopPlacement {}

TaskTaskListPopPlacement _resolveTaskTaskListPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.workspace,
    _Screens.project,
    _Screens.board,
    _Screens.taskList,
    _Screens.task,
  ]))
    return const TaskNav._();
  if (_endsWith(c, const [
    _Screens.workspace,
    _Screens.project,
    _Screens.board,
    _Screens.taskList,
  ]))
    return const TaskListNav._();
  throw StateError('unresolved TaskTaskListPopPlacement: $c');
}

sealed class SubtaskTaskPopPlacement {}

SubtaskTaskPopPlacement _resolveSubtaskTaskPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.workspace,
    _Screens.project,
    _Screens.board,
    _Screens.taskList,
    _Screens.task,
    _Screens.subtask,
  ]))
    return const SubtaskNav._();
  if (_endsWith(c, const [
    _Screens.workspace,
    _Screens.project,
    _Screens.board,
    _Screens.taskList,
    _Screens.task,
  ]))
    return const TaskNav._();
  throw StateError('unresolved SubtaskTaskPopPlacement: $c');
}

sealed class ChecklistItemSubtaskPopPlacement {}

ChecklistItemSubtaskPopPlacement _resolveChecklistItemSubtaskPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.workspace,
    _Screens.project,
    _Screens.board,
    _Screens.taskList,
    _Screens.task,
    _Screens.subtask,
    _Screens.checklistItem,
  ]))
    return const ChecklistItemNav._();
  if (_endsWith(c, const [
    _Screens.workspace,
    _Screens.project,
    _Screens.board,
    _Screens.taskList,
    _Screens.task,
    _Screens.subtask,
  ]))
    return const SubtaskNav._();
  throw StateError('unresolved ChecklistItemSubtaskPopPlacement: $c');
}

sealed class ForumCategoryForumThreadPopPlacement {}

ForumCategoryForumThreadPopPlacement
_resolveForumCategoryForumThreadPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.forum,
    _Screens.forumCategory,
    _Screens.forumThread,
  ]))
    return const ForumThreadNav._();
  if (_endsWith(c, const [_Screens.forum, _Screens.forumCategory]))
    return const ForumCategoryNav._();
  throw StateError('unresolved ForumCategoryForumThreadPopPlacement: $c');
}

sealed class ForumReplyForumThreadPopPlacement {}

ForumReplyForumThreadPopPlacement _resolveForumReplyForumThreadPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.forum,
    _Screens.forumCategory,
    _Screens.forumThread,
    _Screens.forumReply,
  ]))
    return const ForumReplyNav._();
  if (_endsWith(c, const [
    _Screens.forum,
    _Screens.forumCategory,
    _Screens.forumThread,
  ]))
    return const ForumThreadNav._();
  throw StateError('unresolved ForumReplyForumThreadPopPlacement: $c');
}

sealed class QuestionQuizPopPlacement {}

QuestionQuizPopPlacement _resolveQuestionQuizPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.learn,
    _Screens.course,
    _Screens.courseModule,
    _Screens.lesson,
    _Screens.quiz,
    _Screens.question,
  ]))
    return const QuestionNav._();
  if (_endsWith(c, const [
    _Screens.learn,
    _Screens.course,
    _Screens.courseModule,
    _Screens.lesson,
    _Screens.quiz,
  ]))
    return const QuizNav._();
  throw StateError('unresolved QuestionQuizPopPlacement: $c');
}

sealed class ProductShopSubcategoryPopPlacement {}

ProductShopSubcategoryPopPlacement
_resolveProductShopSubcategoryPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.shop,
    _Screens.shopDept,
    _Screens.shopCategory,
    _Screens.shopSubcategory,
    _Screens.product,
  ]))
    return const ProductNav._();
  if (_endsWith(c, const [
    _Screens.shop,
    _Screens.shopDept,
    _Screens.shopCategory,
    _Screens.shopSubcategory,
  ]))
    return const ShopSubcategoryNav._();
  throw StateError('unresolved ProductShopSubcategoryPopPlacement: $c');
}

sealed class ProductProductVariantPopPlacement {}

ProductProductVariantPopPlacement _resolveProductProductVariantPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.shop,
    _Screens.shopDept,
    _Screens.shopCategory,
    _Screens.shopSubcategory,
    _Screens.product,
    _Screens.productVariant,
  ]))
    return const ProductVariantNav._();
  if (_endsWith(c, const [
    _Screens.shop,
    _Screens.shopDept,
    _Screens.shopCategory,
    _Screens.shopSubcategory,
    _Screens.product,
  ]))
    return const ProductNav._();
  throw StateError('unresolved ProductProductVariantPopPlacement: $c');
}

sealed class ExerciseExerciseSetPopPlacement {}

ExerciseExerciseSetPopPlacement _resolveExerciseExerciseSetPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.activity,
    _Screens.workout,
    _Screens.exercise,
    _Screens.exerciseSet,
  ]))
    return const ExerciseSetNav._();
  if (_endsWith(c, const [
    _Screens.activity,
    _Screens.workout,
    _Screens.exercise,
  ]))
    return const ExerciseNav._();
  throw StateError('unresolved ExerciseExerciseSetPopPlacement: $c');
}

sealed class DeepDemoLevelFPopPlacement {}

DeepDemoLevelFPopPlacement _resolveDeepDemoLevelFPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.deepDemo,
    _Screens.levelA,
    _Screens.levelB,
    _Screens.levelC,
    _Screens.levelD,
    _Screens.levelE,
    _Screens.levelF,
  ]))
    return const LevelFNav._();
  if (_endsWith(c, const [_Screens.deepDemo])) return const DeepDemoNav._();
  throw StateError('unresolved DeepDemoLevelFPopPlacement: $c');
}

sealed class LevelALevelFPopPlacement {}

LevelALevelFPopPlacement _resolveLevelALevelFPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.deepDemo,
    _Screens.levelA,
    _Screens.levelB,
    _Screens.levelC,
    _Screens.levelD,
    _Screens.levelE,
    _Screens.levelF,
  ]))
    return const LevelFNav._();
  if (_endsWith(c, const [_Screens.deepDemo, _Screens.levelA]))
    return const LevelANav._();
  throw StateError('unresolved LevelALevelFPopPlacement: $c');
}

sealed class LevelBLevelFPopPlacement {}

LevelBLevelFPopPlacement _resolveLevelBLevelFPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.deepDemo,
    _Screens.levelA,
    _Screens.levelB,
    _Screens.levelC,
    _Screens.levelD,
    _Screens.levelE,
    _Screens.levelF,
  ]))
    return const LevelFNav._();
  if (_endsWith(c, const [_Screens.deepDemo, _Screens.levelA, _Screens.levelB]))
    return const LevelBNav._();
  throw StateError('unresolved LevelBLevelFPopPlacement: $c');
}

sealed class LevelCLevelFPopPlacement {}

LevelCLevelFPopPlacement _resolveLevelCLevelFPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.deepDemo,
    _Screens.levelA,
    _Screens.levelB,
    _Screens.levelC,
    _Screens.levelD,
    _Screens.levelE,
    _Screens.levelF,
  ]))
    return const LevelFNav._();
  if (_endsWith(c, const [
    _Screens.deepDemo,
    _Screens.levelA,
    _Screens.levelB,
    _Screens.levelC,
  ]))
    return const LevelCNav._();
  throw StateError('unresolved LevelCLevelFPopPlacement: $c');
}

sealed class LevelDLevelFPopPlacement {}

LevelDLevelFPopPlacement _resolveLevelDLevelFPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.deepDemo,
    _Screens.levelA,
    _Screens.levelB,
    _Screens.levelC,
    _Screens.levelD,
    _Screens.levelE,
    _Screens.levelF,
  ]))
    return const LevelFNav._();
  if (_endsWith(c, const [
    _Screens.deepDemo,
    _Screens.levelA,
    _Screens.levelB,
    _Screens.levelC,
    _Screens.levelD,
  ]))
    return const LevelDNav._();
  throw StateError('unresolved LevelDLevelFPopPlacement: $c');
}

sealed class LevelELevelFPopPlacement {}

LevelELevelFPopPlacement _resolveLevelELevelFPopPlacement() {
  final c = _Screens.graph.currentChain;
  if (_endsWith(c, const [
    _Screens.deepDemo,
    _Screens.levelA,
    _Screens.levelB,
    _Screens.levelC,
    _Screens.levelD,
    _Screens.levelE,
    _Screens.levelF,
  ]))
    return const LevelFNav._();
  if (_endsWith(c, const [
    _Screens.deepDemo,
    _Screens.levelA,
    _Screens.levelB,
    _Screens.levelC,
    _Screens.levelD,
    _Screens.levelE,
  ]))
    return const LevelENav._();
  throw StateError('unresolved LevelELevelFPopPlacement: $c');
}

sealed class PopDestPlacement {}

final class CanPopNav extends AnyNav {
  const CanPopNav._() : super._();
  PopDestPlacement pop() {
    _Screens.graph.pop();
    return _resolvePopDest();
  }
}

PopDestPlacement _resolvePopDest() {
  final c = _Screens.graph.currentChain;
  if (_chainIs(c, const [
    _Screens.deepDemo,
    _Screens.levelA,
    _Screens.levelB,
    _Screens.levelC,
    _Screens.levelD,
    _Screens.levelE,
    _Screens.levelF,
  ]))
    return const LevelFNav._();
  if (_chainIs(c, const [
    _Screens.workspace,
    _Screens.project,
    _Screens.board,
    _Screens.taskList,
    _Screens.task,
    _Screens.subtask,
    _Screens.checklistItem,
  ]))
    return const ChecklistItemNav._();
  if (_chainIs(c, const [
    _Screens.workspace,
    _Screens.project,
    _Screens.board,
    _Screens.taskList,
    _Screens.task,
    _Screens.subtask,
  ]))
    return const SubtaskNav._();
  if (_chainIs(c, const [
    _Screens.deepDemo,
    _Screens.levelA,
    _Screens.levelB,
    _Screens.levelC,
    _Screens.levelD,
    _Screens.levelE,
  ]))
    return const LevelENav._();
  if (_chainIs(c, const [
    _Screens.messages,
    _Screens.chats,
    _Screens.chat,
    _Screens.thread,
    _Screens.message,
    _Screens.messageReply,
  ]))
    return const MessageReplyNav._();
  if (_chainIs(c, const [
    _Screens.wallet,
    _Screens.accounts,
    _Screens.account,
    _Screens.transactions,
    _Screens.transaction,
    _Screens.transactionItem,
  ]))
    return const TransactionItemNav._();
  if (_chainIs(c, const [
    _Screens.shop,
    _Screens.shopDept,
    _Screens.shopCategory,
    _Screens.shopSubcategory,
    _Screens.product,
    _Screens.productVariant,
  ]))
    return const ProductVariantNav._();
  if (_chainIs(c, const [
    _Screens.learn,
    _Screens.course,
    _Screens.courseModule,
    _Screens.lesson,
    _Screens.quiz,
    _Screens.question,
  ]))
    return const QuestionNav._();
  if (_chainIs(c, const [
    _Screens.wallet,
    _Screens.accounts,
    _Screens.account,
    _Screens.transactions,
    _Screens.transaction,
  ]))
    return const TransactionNav._();
  if (_chainIs(c, const [
    _Screens.deepDemo,
    _Screens.levelA,
    _Screens.levelB,
    _Screens.levelC,
    _Screens.levelD,
  ]))
    return const LevelDNav._();
  if (_chainIs(c, const [
    _Screens.marketplace,
    _Screens.categories,
    _Screens.category,
    _Screens.listing,
    _Screens.sellerProfile,
  ]))
    return const SellerProfileNav._();
  if (_chainIs(c, const [
    _Screens.marketplace,
    _Screens.categories,
    _Screens.category,
    _Screens.listing,
    _Screens.listingVariant,
  ]))
    return const ListingVariantNav._();
  if (_chainIs(c, const [
    _Screens.messages,
    _Screens.chats,
    _Screens.chat,
    _Screens.thread,
    _Screens.message,
  ]))
    return const MessageNav._();
  if (_chainIs(c, const [
    _Screens.settings,
    _Screens.about,
    _Screens.help,
    _Screens.helpCategory,
    _Screens.faq,
  ]))
    return const FaqNav._();
  if (_chainIs(c, const [
    _Screens.workspace,
    _Screens.project,
    _Screens.board,
    _Screens.taskList,
    _Screens.task,
  ]))
    return const TaskNav._();
  if (_chainIs(c, const [
    _Screens.learn,
    _Screens.course,
    _Screens.courseModule,
    _Screens.lesson,
    _Screens.quiz,
  ]))
    return const QuizNav._();
  if (_chainIs(c, const [
    _Screens.shop,
    _Screens.shopDept,
    _Screens.shopCategory,
    _Screens.shopSubcategory,
    _Screens.product,
  ]))
    return const ProductNav._();
  if (_chainIs(c, const [
    _Screens.deepDemo,
    _Screens.levelA,
    _Screens.levelB,
    _Screens.levelC,
  ]))
    return const LevelCNav._();
  if (_chainIs(c, const [
    _Screens.learn,
    _Screens.course,
    _Screens.courseModule,
    _Screens.lesson,
  ]))
    return const LessonNav._();
  if (_chainIs(c, const [
    _Screens.home,
    CreatorStudio.studio,
    CreatorStudio.scheduled,
    CreatorStudio.scheduledPost,
  ]))
    return const ScheduledPostNav._();
  if (_chainIs(c, const [
    _Screens.marketplace,
    _Screens.categories,
    _Screens.category,
    _Screens.listing,
  ]))
    return const ListingNav._();
  if (_chainIs(c, const [
    _Screens.discover,
    _Screens.trending,
    _Screens.topic,
    _Screens.subtopic,
  ]))
    return const SubtopicNav._();
  if (_chainIs(c, const [
    _Screens.workspace,
    _Screens.project,
    _Screens.board,
    _Screens.taskList,
  ]))
    return const TaskListNav._();
  if (_chainIs(c, const [
    _Screens.forum,
    _Screens.forumCategory,
    _Screens.forumThread,
    _Screens.forumReply,
  ]))
    return const ForumReplyNav._();
  if (_chainIs(c, const [
    _Screens.settings,
    Admin.admin,
    Admin.adminUsers,
    Admin.adminUser,
  ]))
    return const AdminUserNav._();
  if (_chainIs(c, const [
    _Screens.settings,
    _Screens.devices,
    _Screens.device,
    _Screens.session,
  ]))
    return const SessionNav._();
  if (_chainIs(c, const [
    _Screens.shop,
    _Screens.shopDept,
    _Screens.shopCategory,
    _Screens.shopSubcategory,
  ]))
    return const ShopSubcategoryNav._();
  if (_chainIs(c, const [
    _Screens.messages,
    _Screens.chats,
    _Screens.chat,
    _Screens.thread,
  ]))
    return const ThreadNav._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.feed,
    _Screens.post,
    _Screens.postAuthor,
  ]))
    return const PostAuthorNav._();
  if (_chainIs(c, const [
    _Screens.wallet,
    _Screens.accounts,
    _Screens.account,
    _Screens.statements,
  ]))
    return const StatementsNav._();
  if (_chainIs(c, const [
    _Screens.activity,
    _Screens.workout,
    _Screens.exercise,
    _Screens.exerciseSet,
  ]))
    return const ExerciseSetNav._();
  if (_chainIs(c, const [
    _Screens.home,
    _Screens.feed,
    _Screens.post,
    _Screens.comment,
  ]))
    return const CommentNav._();
  if (_chainIs(c, const [
    _Screens.wallet,
    _Screens.accounts,
    _Screens.account,
    _Screens.transactions,
  ]))
    return const TransactionsNav._();
  if (_chainIs(c, const [
    _Screens.settings,
    _Screens.about,
    _Screens.help,
    _Screens.helpCategory,
  ]))
    return const HelpCategoryNav._();
  if (_chainIs(c, const [_Screens.home, _Screens.feed, _Screens.story]))
    return const StoryNav._();
  if (_chainIs(c, const [_Screens.wallet, _Screens.accounts, _Screens.account]))
    return const AccountNav._();
  if (_chainIs(c, const [_Screens.deepDemo, _Screens.levelA, _Screens.levelB]))
    return const LevelBNav._();
  if (_chainIs(c, const [
    _Screens.learn,
    _Screens.course,
    _Screens.courseModule,
  ]))
    return const CourseModuleNav._();
  if (_chainIs(c, const [_Screens.settings, Admin.admin, Admin.adminUsers]))
    return const AdminUsersNav._();
  if (_chainIs(c, const [_Screens.messages, _Screens.chats, _Screens.chat]))
    return const ChatNav._();
  if (_chainIs(c, const [_Screens.discover, _Screens.trending, _Screens.topic]))
    return const TopicNav._();
  if (_chainIs(c, const [
    _Screens.home,
    CreatorStudio.studio,
    CreatorStudio.analytics,
  ]))
    return const AnalyticsNav._();
  if (_chainIs(c, const [
    _Screens.marketplace,
    _Screens.myOrders,
    _Screens.order,
  ]))
    return const OrderNav._();
  if (_chainIs(c, const [
    _Screens.marketplace,
    _Screens.cart,
    _Screens.checkout,
  ]))
    return const CheckoutNav._();
  if (_chainIs(c, const [_Screens.profile, _Screens.badges, _Screens.badge]))
    return const BadgeNav._();
  if (_chainIs(c, const [
    _Screens.shop,
    _Screens.shopDept,
    _Screens.shopCategory,
  ]))
    return const ShopCategoryNav._();
  if (_chainIs(c, const [
    _Screens.home,
    CreatorStudio.studio,
    CreatorStudio.scheduled,
  ]))
    return const ScheduledNav._();
  if (_chainIs(c, const [_Screens.home, _Screens.feed, _Screens.post]))
    return const PostNav._();
  if (_chainIs(c, const [
    _Screens.marketplace,
    _Screens.categories,
    _Screens.category,
  ]))
    return const CategoryNav._();
  if (_chainIs(c, const [_Screens.settings, Admin.admin, Admin.webhooks]))
    return const WebhooksNav._();
  if (_chainIs(c, const [
    _Screens.forum,
    _Screens.forumCategory,
    _Screens.forumThread,
  ]))
    return const ForumThreadNav._();
  if (_chainIs(c, const [
    _Screens.home,
    CreatorStudio.studio,
    CreatorStudio.monetization,
  ]))
    return const MonetizationNav._();
  if (_chainIs(c, const [
    _Screens.profile,
    _Screens.followers,
    _Screens.connection,
  ]))
    return const ConnectionNav._();
  if (_chainIs(c, const [_Screens.discover, Events.events, Events.event]))
    return const EventNav._();
  if (_chainIs(c, const [
    _Screens.settings,
    Support.support,
    Support.knowledgeBase,
  ]))
    return const KnowledgeBaseNav._();
  if (_chainIs(c, const [_Screens.settings, _Screens.devices, _Screens.device]))
    return const DeviceNav._();
  if (_chainIs(c, const [
    _Screens.discover,
    _Screens.liveNow,
    _Screens.liveRoom,
  ]))
    return const LiveRoomNav._();
  if (_chainIs(c, const [
    _Screens.discover,
    _Screens.trending,
    _Screens.hashtag,
  ]))
    return const HashtagNav._();
  if (_chainIs(c, const [_Screens.workspace, _Screens.project, _Screens.board]))
    return const BoardNav._();
  if (_chainIs(c, const [
    _Screens.settings,
    Support.support,
    Support.supportTickets,
  ]))
    return const SupportTicketsNav._();
  if (_chainIs(c, const [
    _Screens.activity,
    _Screens.workout,
    _Screens.exercise,
  ]))
    return const ExerciseNav._();
  if (_chainIs(c, const [_Screens.settings, _Screens.about, _Screens.help]))
    return const HelpNav._();
  if (_chainIs(c, const [_Screens.wallet, _Screens.accounts]))
    return const AccountsNav._();
  if (_chainIs(c, const [_Screens.home, _Screens.feed]))
    return const FeedNav._();
  if (_chainIs(c, const [_Screens.settings, _Screens.about]))
    return const AboutNav._();
  if (_chainIs(c, const [_Screens.forum, _Screens.forumCategory]))
    return const ForumCategoryNav._();
  if (_chainIs(c, const [_Screens.settings, Admin.admin]))
    return const AdminNav._();
  if (_chainIs(c, const [_Screens.learn, _Screens.course]))
    return const CourseNav._();
  if (_chainIs(c, const [_Screens.settings, _Screens.security]))
    return const SecurityNav._();
  if (_chainIs(c, const [_Screens.profile, _Screens.followers]))
    return const FollowersNav._();
  if (_chainIs(c, const [_Screens.discover, _Screens.trending]))
    return const TrendingNav._();
  if (_chainIs(c, const [_Screens.settings, Support.support]))
    return const SupportNav._();
  if (_chainIs(c, const [_Screens.discover, Events.events]))
    return const EventsNav._();
  if (_chainIs(c, const [_Screens.shop, _Screens.shopDept]))
    return const ShopDeptNav._();
  if (_chainIs(c, const [_Screens.profile, _Screens.badges]))
    return const BadgesNav._();
  if (_chainIs(c, const [_Screens.settings, _Screens.devices]))
    return const DevicesNav._();
  if (_chainIs(c, const [_Screens.workspace, _Screens.project]))
    return const ProjectNav._();
  if (_chainIs(c, const [_Screens.marketplace, _Screens.categories]))
    return const CategoriesNav._();
  if (_chainIs(c, const [_Screens.marketplace, _Screens.cart]))
    return const CartNav._();
  if (_chainIs(c, const [_Screens.activity, _Screens.workout]))
    return const WorkoutNav._();
  if (_chainIs(c, const [_Screens.wallet, _Screens.paymentMethods]))
    return const PaymentMethodsNav._();
  if (_chainIs(c, const [_Screens.marketplace, _Screens.myOrders]))
    return const MyOrdersNav._();
  if (_chainIs(c, const [_Screens.settings, _Screens.integrations]))
    return const IntegrationsNav._();
  if (_chainIs(c, const [_Screens.home, CreatorStudio.studio]))
    return const StudioNav._();
  if (_chainIs(c, const [_Screens.deepDemo, _Screens.levelA]))
    return const LevelANav._();
  if (_chainIs(c, const [_Screens.messages, _Screens.chats]))
    return const ChatsNav._();
  if (_chainIs(c, const [_Screens.messages, _Screens.groupChat]))
    return const GroupChatNav._();
  if (_chainIs(c, const [_Screens.discover, _Screens.liveNow]))
    return const LiveNowNav._();
  if (_chainIs(c, const [_Screens.messages])) return const MessagesNav._();
  if (_chainIs(c, const [_Screens.workspace])) return const WorkspaceNav._();
  if (_chainIs(c, const [_Screens.deepDemo])) return const DeepDemoNav._();
  if (_chainIs(c, const [_Screens.forgotPassword]))
    return const ForgotPasswordNav._();
  if (_chainIs(c, const [_Screens.activity])) return const ActivityNav._();
  if (_chainIs(c, const [_Screens.profile])) return const ProfileNav._();
  if (_chainIs(c, const [_Screens.marketplace]))
    return const MarketplaceNav._();
  if (_chainIs(c, const [_Screens.shop])) return const ShopNav._();
  if (_chainIs(c, const [_Screens.settings])) return const SettingsNav._();
  if (_chainIs(c, const [_Screens.notifications]))
    return const NotificationsNav._();
  if (_chainIs(c, const [_Screens.search])) return const SearchNav._();
  if (_chainIs(c, const [_Screens.discover])) return const DiscoverNav._();
  if (_chainIs(c, const [_Screens.learn])) return const LearnNav._();
  if (_chainIs(c, const [_Screens.forum])) return const ForumNav._();
  if (_chainIs(c, const [_Screens.home])) return const HomeNav._();
  if (_chainIs(c, const [_Screens.wallet])) return const WalletNav._();
  throw StateError('unresolved pop destination: $c');
}

final class Keep {
  const Keep._(this.spec);
  final Enum spec;
  static const activity = Keep._(_Screens.activity);
  static const deepDemo = Keep._(_Screens.deepDemo);
  static const discover = Keep._(_Screens.discover);
  static const forum = Keep._(_Screens.forum);
  static const home = Keep._(_Screens.home);
  static const learn = Keep._(_Screens.learn);
  static const marketplace = Keep._(_Screens.marketplace);
  static const messages = Keep._(_Screens.messages);
  static const notifications = Keep._(_Screens.notifications);
  static const profile = Keep._(_Screens.profile);
  static const search = Keep._(_Screens.search);
  static const settings = Keep._(_Screens.settings);
  static const shop = Keep._(_Screens.shop);
  static const wallet = Keep._(_Screens.wallet);
  static const workspace = Keep._(_Screens.workspace);
}

final class SplashNav extends AnyPlacement {
  const SplashNav._() : super._();
  SplashNav surface() {
    _Screens.graph.popTo(_Screens.splash);
    return const SplashNav._();
  }
}

final class SignInNav extends AnyPlacement {
  const SignInNav._() : super._();
  SignInNav surface() {
    _Screens.graph.popTo(_Screens.signIn);
    return const SignInNav._();
  }
}

final class SignUpNav extends AnyPlacement {
  const SignUpNav._() : super._();
  SignUpNav surface() {
    _Screens.graph.popTo(_Screens.signUp);
    return const SignUpNav._();
  }
}

final class OnboardingNav extends AnyPlacement {
  const OnboardingNav._() : super._();
  OnboardingNav surface() {
    _Screens.graph.popTo(_Screens.onboarding);
    return const OnboardingNav._();
  }
}

final class ForgotPasswordNav extends AnyPlacement implements PopDestPlacement {
  const ForgotPasswordNav._() : super._();
  ForgotPasswordNav surface() {
    _Screens.graph.popTo(_Screens.forgotPassword);
    return const ForgotPasswordNav._();
  }

  ResetPasswordNav goResetPassword(String id) {
    _Screens.graph.popTo(_Screens.forgotPassword);
    _Screens.graph.go(_Screens.resetPassword, id, true);
    return const ResetPasswordNav._();
  }
}

final class ResetPasswordNav extends AnyPlacement {
  const ResetPasswordNav._() : super._();
  ResetPasswordNav surface() {
    _Screens.graph.popTo(_Screens.resetPassword);
    return const ResetPasswordNav._();
  }

  ForgotPasswordNav pop() {
    _Screens.graph.pop();
    return const ForgotPasswordNav._();
  }
}

final class VerifyEmailNav extends AnyPlacement {
  const VerifyEmailNav._() : super._();
  VerifyEmailNav surface() {
    _Screens.graph.popTo(_Screens.verifyEmail);
    return const VerifyEmailNav._();
  }
}

final class TwoFactorNav extends AnyPlacement {
  const TwoFactorNav._() : super._();
  TwoFactorNav surface() {
    _Screens.graph.popTo(_Screens.twoFactor);
    return const TwoFactorNav._();
  }
}

final class HomeNav extends AnyPlacement implements PopDestPlacement {
  const HomeNav._() : super._();
  HomeNav surface() {
    _Screens.graph.popTo(_Screens.home);
    return const HomeNav._();
  }

  FeedNav goFeed() {
    _Screens.graph.popTo(_Screens.home);
    _Screens.graph.go(_Screens.feed, null, true);
    return const FeedNav._();
  }

  StudioNav goStudio() {
    _Screens.graph.popTo(_Screens.home);
    _Screens.graph.go(CreatorStudio.studio, null, true);
    return const StudioNav._();
  }

  StoryNav goStory(String id) {
    _Screens.graph.go(_Screens.feed, null, true);
    _Screens.graph.go(_Screens.story, id, true);
    return const StoryNav._();
  }

  PostNav goPost(String id) {
    _Screens.graph.go(_Screens.feed, null, true);
    _Screens.graph.go(_Screens.post, id, true);
    return const PostNav._();
  }

  PostCommentsNav goPostComments(String id) {
    _Screens.graph.go(_Screens.feed, null, true);
    _Screens.graph.go(_Screens.post, id, true);
    _Screens.graph.go(_Screens.postComments, id, true);
    return const PostCommentsNav._();
  }

  PostLikesNav goPostLikes(String id) {
    _Screens.graph.go(_Screens.feed, null, true);
    _Screens.graph.go(_Screens.post, id, true);
    _Screens.graph.go(_Screens.postLikes, id, true);
    return const PostLikesNav._();
  }

  EditPostNav goEditPost(String id) {
    _Screens.graph.go(_Screens.feed, null, true);
    _Screens.graph.go(_Screens.post, id, true);
    _Screens.graph.go(_Screens.editPost, id, true);
    return const EditPostNav._();
  }

  RepostNav goRepost(String id) {
    _Screens.graph.go(_Screens.feed, null, true);
    _Screens.graph.go(_Screens.post, id, true);
    _Screens.graph.go(_Screens.repost, id, true);
    return const RepostNav._();
  }

  ScheduledPostNav goScheduledPost(String id) {
    _Screens.graph.go(CreatorStudio.studio, null, true);
    _Screens.graph.go(CreatorStudio.scheduled, null, true);
    _Screens.graph.go(CreatorStudio.scheduledPost, id, true);
    return const ScheduledPostNav._();
  }

  EditScheduledNav goEditScheduled(String id) {
    _Screens.graph.go(CreatorStudio.studio, null, true);
    _Screens.graph.go(CreatorStudio.scheduled, null, true);
    _Screens.graph.go(CreatorStudio.scheduledPost, id, true);
    _Screens.graph.go(CreatorStudio.editScheduled, id, true);
    return const EditScheduledNav._();
  }

  N go<N extends AnyNav>(HomeHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }
}

final class HomeHop<N extends AnyNav> {
  const HomeHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const feed = HomeHop<FeedNav>._(_Screens.feed, null, FeedNav._());
  static const studio = HomeHop<StudioNav>._(
    CreatorStudio.studio,
    null,
    StudioNav._(),
  );
}

final class FeedNav extends AnyPlacement
    implements
        FeedView,
        FeedStoryPopPlacement,
        CommentFeedPostPostAuthorPopPlacement,
        PopDestPlacement {
  const FeedNav._() : super._();
  FeedNav surface() {
    _Screens.graph.popTo(_Screens.feed);
    return const FeedNav._();
  }

  FeedQueryMut get query => const FeedQueryMut._();
  FeedFragmentMut get fragment => const FeedFragmentMut._();
  PostNav goPost(String id) {
    _Screens.graph.popTo(_Screens.feed);
    _Screens.graph.go(_Screens.post, id, true);
    return const PostNav._();
  }

  StoryNav goStory(String id) {
    _Screens.graph.popTo(_Screens.feed);
    _Screens.graph.go(_Screens.story, id, true);
    return const StoryNav._();
  }

  ComposePostNav goComposePost() {
    _Screens.graph.popTo(_Screens.feed);
    _Screens.graph.go(_Screens.composePost, null, true);
    return const ComposePostNav._();
  }

  HomeFeedUserProfileNav goUserProfile(String id) {
    _Screens.graph.popTo(_Screens.feed);
    _Screens.graph.go(_Screens.userProfile, id, true);
    return const HomeFeedUserProfileNav._();
  }

  PostCommentsNav goPostComments(String id) {
    _Screens.graph.go(_Screens.post, id, true);
    _Screens.graph.go(_Screens.postComments, id, true);
    return const PostCommentsNav._();
  }

  PostLikesNav goPostLikes(String id) {
    _Screens.graph.go(_Screens.post, id, true);
    _Screens.graph.go(_Screens.postLikes, id, true);
    return const PostLikesNav._();
  }

  EditPostNav goEditPost(String id) {
    _Screens.graph.go(_Screens.post, id, true);
    _Screens.graph.go(_Screens.editPost, id, true);
    return const EditPostNav._();
  }

  RepostNav goRepost(String id) {
    _Screens.graph.go(_Screens.post, id, true);
    _Screens.graph.go(_Screens.repost, id, true);
    return const RepostNav._();
  }

  N go<N extends AnyNav>(FeedHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  HomeNav pop() {
    _Screens.graph.pop();
    return const HomeNav._();
  }
}

final class FeedHop<N extends AnyNav> {
  const FeedHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static FeedHop<PostNav> post(String id) =>
      FeedHop._(_Screens.post, id, const PostNav._());
  static FeedHop<StoryNav> story(String id) =>
      FeedHop._(_Screens.story, id, const StoryNav._());
  static const composePost = FeedHop<ComposePostNav>._(
    _Screens.composePost,
    null,
    ComposePostNav._(),
  );
  static FeedHop<HomeFeedUserProfileNav> userProfile(String id) =>
      FeedHop._(_Screens.userProfile, id, const HomeFeedUserProfileNav._());
}

final class ComposePostNav extends AnyPlacement {
  const ComposePostNav._() : super._();
  ComposePostNav surface() {
    _Screens.graph.popTo(_Screens.composePost);
    return const ComposePostNav._();
  }

  FeedNav pop() {
    _Screens.graph.pop();
    return const FeedNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(ComposePostPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ComposePostPop<N extends AnyNav> {
  const ComposePostPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const feed = ComposePostPop<FeedNav>._(_Screens.feed, FeedNav._());
  static const home = ComposePostPop<HomeNav>._(_Screens.home, HomeNav._());
}

final class StoryNav extends AnyPlacement
    implements FeedStoryPopPlacement, PopDestPlacement {
  const StoryNav._() : super._();
  StoryNav surface() {
    _Screens.graph.popTo(_Screens.story);
    return const StoryNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.story);
  StoryNav goStory(String id) {
    _Screens.graph.popTo(_Screens.story);
    _Screens.graph.go(_Screens.story, id, true);
    return const StoryNav._();
  }

  FeedStoryPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveFeedStoryPopPlacement();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  StoryNav popToStory() {
    _Screens.graph.pop(_Screens.story);
    return const StoryNav._();
  }

  N popTo<N extends AnyNav>(StoryPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class StoryPop<N extends AnyNav> {
  const StoryPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const feed = StoryPop<FeedNav>._(_Screens.feed, FeedNav._());
  static const home = StoryPop<HomeNav>._(_Screens.home, HomeNav._());
  static const story = StoryPop<StoryNav>._(_Screens.story, StoryNav._());
}

final class PostNav extends AnyPlacement
    implements
        PostView,
        CommentFeedPostPostAuthorPopPlacement,
        CommentPostPopPlacement,
        PostPostAuthorPopPlacement,
        PopDestPlacement {
  const PostNav._() : super._();
  PostNav surface() {
    _Screens.graph.popTo(_Screens.post);
    return const PostNav._();
  }

  PostQueryMut get query => const PostQueryMut._();
  int get depth => _Screens.graph.countOf(_Screens.post);
  CommentNav goComment(String id) {
    _Screens.graph.popTo(_Screens.post);
    _Screens.graph.go(_Screens.comment, id, true);
    return const CommentNav._();
  }

  PostAuthorNav goPostAuthor(String id) {
    _Screens.graph.popTo(_Screens.post);
    _Screens.graph.go(_Screens.postAuthor, id, true);
    return const PostAuthorNav._();
  }

  PostCommentsNav goPostComments() {
    _Screens.graph.popTo(_Screens.post);
    _Screens.graph.go(_Screens.postComments, _idOf(_Screens.post), true);
    return const PostCommentsNav._();
  }

  PostLikesNav goPostLikes() {
    _Screens.graph.popTo(_Screens.post);
    _Screens.graph.go(_Screens.postLikes, _idOf(_Screens.post), true);
    return const PostLikesNav._();
  }

  EditPostNav goEditPost() {
    _Screens.graph.popTo(_Screens.post);
    _Screens.graph.go(_Screens.editPost, _idOf(_Screens.post), true);
    return const EditPostNav._();
  }

  RepostNav goRepost() {
    _Screens.graph.popTo(_Screens.post);
    _Screens.graph.go(_Screens.repost, _idOf(_Screens.post), true);
    return const RepostNav._();
  }

  PostNav goPost(String id) {
    _Screens.graph.popTo(_Screens.post);
    _Screens.graph.go(_Screens.post, id, true);
    return const PostNav._();
  }

  N go<N extends AnyNav>(PostHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  CommentFeedPostPostAuthorPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveCommentFeedPostPostAuthorPopPlacement();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  CommentNav popToComment() {
    _Screens.graph.pop(_Screens.comment);
    return const CommentNav._();
  }

  PostNav popToPost() {
    _Screens.graph.pop(_Screens.post);
    return const PostNav._();
  }

  PostAuthorNav popToPostAuthor() {
    _Screens.graph.pop(_Screens.postAuthor);
    return const PostAuthorNav._();
  }

  N popTo<N extends AnyNav>(PostPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class PostPop<N extends AnyNav> {
  const PostPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const feed = PostPop<FeedNav>._(_Screens.feed, FeedNav._());
  static const home = PostPop<HomeNav>._(_Screens.home, HomeNav._());
  static const comment = PostPop<CommentNav>._(
    _Screens.comment,
    CommentNav._(),
  );
  static const post = PostPop<PostNav>._(_Screens.post, PostNav._());
  static const postAuthor = PostPop<PostAuthorNav>._(
    _Screens.postAuthor,
    PostAuthorNav._(),
  );
}

final class PostHop<N extends AnyNav> {
  const PostHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static PostHop<CommentNav> comment(String id) =>
      PostHop._(_Screens.comment, id, const CommentNav._());
  static PostHop<PostAuthorNav> postAuthor(String id) =>
      PostHop._(_Screens.postAuthor, id, const PostAuthorNav._());
  static PostHop<PostNav> post(String id) =>
      PostHop._(_Screens.post, id, const PostNav._());
}

final class CommentNav extends AnyPlacement
    implements
        CommentFeedPostPostAuthorPopPlacement,
        CommentPostPopPlacement,
        PopDestPlacement {
  const CommentNav._() : super._();
  CommentNav surface() {
    _Screens.graph.popTo(_Screens.comment);
    return const CommentNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.comment);
  CommentNav goComment(String id) {
    _Screens.graph.popTo(_Screens.comment);
    _Screens.graph.go(_Screens.comment, id, true);
    return const CommentNav._();
  }

  PostNav goPost(String id) {
    _Screens.graph.popTo(_Screens.comment);
    _Screens.graph.go(_Screens.post, id, true);
    return const PostNav._();
  }

  N go<N extends AnyNav>(CommentHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  CommentPostPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveCommentPostPopPlacement();
  }

  FeedNav popToFeed() {
    _Screens.graph.pop(_Screens.feed);
    return const FeedNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  CommentNav popToComment() {
    _Screens.graph.pop(_Screens.comment);
    return const CommentNav._();
  }

  N popTo<N extends AnyNav>(CommentPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class CommentPop<N extends AnyNav> {
  const CommentPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const post = CommentPop<PostNav>._(_Screens.post, PostNav._());
  static const feed = CommentPop<FeedNav>._(_Screens.feed, FeedNav._());
  static const home = CommentPop<HomeNav>._(_Screens.home, HomeNav._());
  static const comment = CommentPop<CommentNav>._(
    _Screens.comment,
    CommentNav._(),
  );
}

final class CommentHop<N extends AnyNav> {
  const CommentHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static CommentHop<CommentNav> comment(String id) =>
      CommentHop._(_Screens.comment, id, const CommentNav._());
  static CommentHop<PostNav> post(String id) =>
      CommentHop._(_Screens.post, id, const PostNav._());
}

final class PostAuthorNav extends AnyPlacement
    implements
        CommentFeedPostPostAuthorPopPlacement,
        PostPostAuthorPopPlacement,
        PopDestPlacement {
  const PostAuthorNav._() : super._();
  PostAuthorNav surface() {
    _Screens.graph.popTo(_Screens.postAuthor);
    return const PostAuthorNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.postAuthor);
  PostAuthorNav goPostAuthor(String id) {
    _Screens.graph.popTo(_Screens.postAuthor);
    _Screens.graph.go(_Screens.postAuthor, id, true);
    return const PostAuthorNav._();
  }

  PostNav goPost(String id) {
    _Screens.graph.popTo(_Screens.postAuthor);
    _Screens.graph.go(_Screens.post, id, true);
    return const PostNav._();
  }

  N go<N extends AnyNav>(PostAuthorHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  PostPostAuthorPopPlacement pop() {
    _Screens.graph.pop();
    return _resolvePostPostAuthorPopPlacement();
  }

  FeedNav popToFeed() {
    _Screens.graph.pop(_Screens.feed);
    return const FeedNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  PostAuthorNav popToPostAuthor() {
    _Screens.graph.pop(_Screens.postAuthor);
    return const PostAuthorNav._();
  }

  N popTo<N extends AnyNav>(PostAuthorPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class PostAuthorPop<N extends AnyNav> {
  const PostAuthorPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const post = PostAuthorPop<PostNav>._(_Screens.post, PostNav._());
  static const feed = PostAuthorPop<FeedNav>._(_Screens.feed, FeedNav._());
  static const home = PostAuthorPop<HomeNav>._(_Screens.home, HomeNav._());
  static const postAuthor = PostAuthorPop<PostAuthorNav>._(
    _Screens.postAuthor,
    PostAuthorNav._(),
  );
}

final class PostAuthorHop<N extends AnyNav> {
  const PostAuthorHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static PostAuthorHop<PostAuthorNav> postAuthor(String id) =>
      PostAuthorHop._(_Screens.postAuthor, id, const PostAuthorNav._());
  static PostAuthorHop<PostNav> post(String id) =>
      PostAuthorHop._(_Screens.post, id, const PostNav._());
}

final class PostCommentsNav extends AnyPlacement {
  const PostCommentsNav._() : super._();
  PostCommentsNav surface() {
    _Screens.graph.popTo(_Screens.postComments);
    return const PostCommentsNav._();
  }

  PostNav pop() {
    _Screens.graph.pop();
    return const PostNav._();
  }

  FeedNav popToFeed() {
    _Screens.graph.pop(_Screens.feed);
    return const FeedNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(PostCommentsPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class PostCommentsPop<N extends AnyNav> {
  const PostCommentsPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const post = PostCommentsPop<PostNav>._(_Screens.post, PostNav._());
  static const feed = PostCommentsPop<FeedNav>._(_Screens.feed, FeedNav._());
  static const home = PostCommentsPop<HomeNav>._(_Screens.home, HomeNav._());
}

final class PostLikesNav extends AnyPlacement {
  const PostLikesNav._() : super._();
  PostLikesNav surface() {
    _Screens.graph.popTo(_Screens.postLikes);
    return const PostLikesNav._();
  }

  PostNav pop() {
    _Screens.graph.pop();
    return const PostNav._();
  }

  FeedNav popToFeed() {
    _Screens.graph.pop(_Screens.feed);
    return const FeedNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(PostLikesPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class PostLikesPop<N extends AnyNav> {
  const PostLikesPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const post = PostLikesPop<PostNav>._(_Screens.post, PostNav._());
  static const feed = PostLikesPop<FeedNav>._(_Screens.feed, FeedNav._());
  static const home = PostLikesPop<HomeNav>._(_Screens.home, HomeNav._());
}

final class EditPostNav extends AnyPlacement {
  const EditPostNav._() : super._();
  EditPostNav surface() {
    _Screens.graph.popTo(_Screens.editPost);
    return const EditPostNav._();
  }

  PostNav pop() {
    _Screens.graph.pop();
    return const PostNav._();
  }

  FeedNav popToFeed() {
    _Screens.graph.pop(_Screens.feed);
    return const FeedNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(EditPostPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class EditPostPop<N extends AnyNav> {
  const EditPostPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const post = EditPostPop<PostNav>._(_Screens.post, PostNav._());
  static const feed = EditPostPop<FeedNav>._(_Screens.feed, FeedNav._());
  static const home = EditPostPop<HomeNav>._(_Screens.home, HomeNav._());
}

final class RepostNav extends AnyPlacement {
  const RepostNav._() : super._();
  RepostNav surface() {
    _Screens.graph.popTo(_Screens.repost);
    return const RepostNav._();
  }

  PostNav pop() {
    _Screens.graph.pop();
    return const PostNav._();
  }

  FeedNav popToFeed() {
    _Screens.graph.pop(_Screens.feed);
    return const FeedNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(RepostPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class RepostPop<N extends AnyNav> {
  const RepostPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const post = RepostPop<PostNav>._(_Screens.post, PostNav._());
  static const feed = RepostPop<FeedNav>._(_Screens.feed, FeedNav._());
  static const home = RepostPop<HomeNav>._(_Screens.home, HomeNav._());
}

final class DiscoverNav extends AnyPlacement
    implements DiscoverView, PopDestPlacement {
  const DiscoverNav._() : super._();
  DiscoverNav surface() {
    _Screens.graph.popTo(_Screens.discover);
    return const DiscoverNav._();
  }

  DiscoverQueryMut get query => const DiscoverQueryMut._();
  TrendingNav goTrending() {
    _Screens.graph.popTo(_Screens.discover);
    _Screens.graph.go(_Screens.trending, null, true);
    return const TrendingNav._();
  }

  TopicsNav goTopics() {
    _Screens.graph.popTo(_Screens.discover);
    _Screens.graph.go(_Screens.topics, null, true);
    return const TopicsNav._();
  }

  LiveNowNav goLiveNow() {
    _Screens.graph.popTo(_Screens.discover);
    _Screens.graph.go(_Screens.liveNow, null, true);
    return const LiveNowNav._();
  }

  NearbyNav goNearby() {
    _Screens.graph.popTo(_Screens.discover);
    _Screens.graph.go(_Screens.nearby, null, true);
    return const NearbyNav._();
  }

  EventsNav goEvents() {
    _Screens.graph.popTo(_Screens.discover);
    _Screens.graph.go(Events.events, null, true);
    return const EventsNav._();
  }

  TopicNav goTopic(String id) {
    _Screens.graph.go(_Screens.trending, null, true);
    _Screens.graph.go(_Screens.topic, id, true);
    return const TopicNav._();
  }

  HashtagNav goHashtag(String id) {
    _Screens.graph.go(_Screens.trending, null, true);
    _Screens.graph.go(_Screens.hashtag, id, true);
    return const HashtagNav._();
  }

  LiveRoomNav goLiveRoom(String id) {
    _Screens.graph.go(_Screens.liveNow, null, true);
    _Screens.graph.go(_Screens.liveRoom, id, true);
    return const LiveRoomNav._();
  }

  EventNav goEvent(String id) {
    _Screens.graph.go(Events.events, null, true);
    _Screens.graph.go(Events.event, id, true);
    return const EventNav._();
  }

  AttendeesNav goAttendees(String id) {
    _Screens.graph.go(Events.events, null, true);
    _Screens.graph.go(Events.event, id, true);
    _Screens.graph.go(Events.attendees, id, true);
    return const AttendeesNav._();
  }

  EditEventNav goEditEvent(String id) {
    _Screens.graph.go(Events.events, null, true);
    _Screens.graph.go(Events.event, id, true);
    _Screens.graph.go(Events.editEvent, id, true);
    return const EditEventNav._();
  }

  TicketsNav goTickets(String id) {
    _Screens.graph.go(Events.events, null, true);
    _Screens.graph.go(Events.event, id, true);
    _Screens.graph.go(Events.tickets, id, true);
    return const TicketsNav._();
  }

  N go<N extends AnyNav>(DiscoverHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }
}

final class DiscoverHop<N extends AnyNav> {
  const DiscoverHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const trending = DiscoverHop<TrendingNav>._(
    _Screens.trending,
    null,
    TrendingNav._(),
  );
  static const topics = DiscoverHop<TopicsNav>._(
    _Screens.topics,
    null,
    TopicsNav._(),
  );
  static const liveNow = DiscoverHop<LiveNowNav>._(
    _Screens.liveNow,
    null,
    LiveNowNav._(),
  );
  static const nearby = DiscoverHop<NearbyNav>._(
    _Screens.nearby,
    null,
    NearbyNav._(),
  );
  static const events = DiscoverHop<EventsNav>._(
    Events.events,
    null,
    EventsNav._(),
  );
}

final class TrendingNav extends AnyPlacement
    implements
        SubtopicTopicTrendingPopPlacement,
        HashtagTrendingPopPlacement,
        PopDestPlacement {
  const TrendingNav._() : super._();
  TrendingNav surface() {
    _Screens.graph.popTo(_Screens.trending);
    return const TrendingNav._();
  }

  HashtagNav goHashtag(String id) {
    _Screens.graph.popTo(_Screens.trending);
    _Screens.graph.go(_Screens.hashtag, id, true);
    return const HashtagNav._();
  }

  TopicNav goTopic(String id) {
    _Screens.graph.popTo(_Screens.trending);
    _Screens.graph.go(_Screens.topic, id, true);
    return const TopicNav._();
  }

  DiscoverTrendingUserProfileNav goUserProfile(String id) {
    _Screens.graph.popTo(_Screens.trending);
    _Screens.graph.go(_Screens.userProfile, id, true);
    return const DiscoverTrendingUserProfileNav._();
  }

  N go<N extends AnyNav>(TrendingHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  DiscoverNav pop() {
    _Screens.graph.pop();
    return const DiscoverNav._();
  }
}

final class TrendingHop<N extends AnyNav> {
  const TrendingHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static TrendingHop<HashtagNav> hashtag(String id) =>
      TrendingHop._(_Screens.hashtag, id, const HashtagNav._());
  static TrendingHop<TopicNav> topic(String id) =>
      TrendingHop._(_Screens.topic, id, const TopicNav._());
  static TrendingHop<DiscoverTrendingUserProfileNav> userProfile(String id) =>
      TrendingHop._(
        _Screens.userProfile,
        id,
        const DiscoverTrendingUserProfileNav._(),
      );
}

final class TopicsNav extends AnyPlacement {
  const TopicsNav._() : super._();
  TopicsNav surface() {
    _Screens.graph.popTo(_Screens.topics);
    return const TopicsNav._();
  }

  DiscoverNav pop() {
    _Screens.graph.pop();
    return const DiscoverNav._();
  }
}

final class TopicNav extends AnyPlacement
    implements
        SubtopicTopicTrendingPopPlacement,
        SubtopicTopicPopPlacement,
        PopDestPlacement {
  const TopicNav._() : super._();
  TopicNav surface() {
    _Screens.graph.popTo(_Screens.topic);
    return const TopicNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.topic);
  SubtopicNav goSubtopic(String id) {
    _Screens.graph.popTo(_Screens.topic);
    _Screens.graph.go(_Screens.subtopic, id, true);
    return const SubtopicNav._();
  }

  TopicNav goTopic(String id) {
    _Screens.graph.popTo(_Screens.topic);
    _Screens.graph.go(_Screens.topic, id, true);
    return const TopicNav._();
  }

  N go<N extends AnyNav>(TopicHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  SubtopicTopicTrendingPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveSubtopicTopicTrendingPopPlacement();
  }

  DiscoverNav popToDiscover() {
    _Screens.graph.pop(_Screens.discover);
    return const DiscoverNav._();
  }

  SubtopicNav popToSubtopic() {
    _Screens.graph.pop(_Screens.subtopic);
    return const SubtopicNav._();
  }

  TopicNav popToTopic() {
    _Screens.graph.pop(_Screens.topic);
    return const TopicNav._();
  }

  N popTo<N extends AnyNav>(TopicPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class TopicPop<N extends AnyNav> {
  const TopicPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const trending = TopicPop<TrendingNav>._(
    _Screens.trending,
    TrendingNav._(),
  );
  static const discover = TopicPop<DiscoverNav>._(
    _Screens.discover,
    DiscoverNav._(),
  );
  static const subtopic = TopicPop<SubtopicNav>._(
    _Screens.subtopic,
    SubtopicNav._(),
  );
  static const topic = TopicPop<TopicNav>._(_Screens.topic, TopicNav._());
}

final class TopicHop<N extends AnyNav> {
  const TopicHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static TopicHop<SubtopicNav> subtopic(String id) =>
      TopicHop._(_Screens.subtopic, id, const SubtopicNav._());
  static TopicHop<TopicNav> topic(String id) =>
      TopicHop._(_Screens.topic, id, const TopicNav._());
}

final class SubtopicNav extends AnyPlacement
    implements
        SubtopicTopicTrendingPopPlacement,
        SubtopicTopicPopPlacement,
        PopDestPlacement {
  const SubtopicNav._() : super._();
  SubtopicNav surface() {
    _Screens.graph.popTo(_Screens.subtopic);
    return const SubtopicNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.subtopic);
  SubtopicNav goSubtopic(String id) {
    _Screens.graph.popTo(_Screens.subtopic);
    _Screens.graph.go(_Screens.subtopic, id, true);
    return const SubtopicNav._();
  }

  TopicNav goTopic(String id) {
    _Screens.graph.popTo(_Screens.subtopic);
    _Screens.graph.go(_Screens.topic, id, true);
    return const TopicNav._();
  }

  N go<N extends AnyNav>(SubtopicHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  SubtopicTopicPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveSubtopicTopicPopPlacement();
  }

  TrendingNav popToTrending() {
    _Screens.graph.pop(_Screens.trending);
    return const TrendingNav._();
  }

  DiscoverNav popToDiscover() {
    _Screens.graph.pop(_Screens.discover);
    return const DiscoverNav._();
  }

  SubtopicNav popToSubtopic() {
    _Screens.graph.pop(_Screens.subtopic);
    return const SubtopicNav._();
  }

  N popTo<N extends AnyNav>(SubtopicPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class SubtopicPop<N extends AnyNav> {
  const SubtopicPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const topic = SubtopicPop<TopicNav>._(_Screens.topic, TopicNav._());
  static const trending = SubtopicPop<TrendingNav>._(
    _Screens.trending,
    TrendingNav._(),
  );
  static const discover = SubtopicPop<DiscoverNav>._(
    _Screens.discover,
    DiscoverNav._(),
  );
  static const subtopic = SubtopicPop<SubtopicNav>._(
    _Screens.subtopic,
    SubtopicNav._(),
  );
}

final class SubtopicHop<N extends AnyNav> {
  const SubtopicHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static SubtopicHop<SubtopicNav> subtopic(String id) =>
      SubtopicHop._(_Screens.subtopic, id, const SubtopicNav._());
  static SubtopicHop<TopicNav> topic(String id) =>
      SubtopicHop._(_Screens.topic, id, const TopicNav._());
}

final class HashtagNav extends AnyPlacement
    implements HashtagTrendingPopPlacement, PopDestPlacement {
  const HashtagNav._() : super._();
  HashtagNav surface() {
    _Screens.graph.popTo(_Screens.hashtag);
    return const HashtagNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.hashtag);
  HashtagNav goHashtag(String id) {
    _Screens.graph.popTo(_Screens.hashtag);
    _Screens.graph.go(_Screens.hashtag, id, true);
    return const HashtagNav._();
  }

  HashtagTrendingPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveHashtagTrendingPopPlacement();
  }

  DiscoverNav popToDiscover() {
    _Screens.graph.pop(_Screens.discover);
    return const DiscoverNav._();
  }

  HashtagNav popToHashtag() {
    _Screens.graph.pop(_Screens.hashtag);
    return const HashtagNav._();
  }

  N popTo<N extends AnyNav>(HashtagPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HashtagPop<N extends AnyNav> {
  const HashtagPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const trending = HashtagPop<TrendingNav>._(
    _Screens.trending,
    TrendingNav._(),
  );
  static const discover = HashtagPop<DiscoverNav>._(
    _Screens.discover,
    DiscoverNav._(),
  );
  static const hashtag = HashtagPop<HashtagNav>._(
    _Screens.hashtag,
    HashtagNav._(),
  );
}

final class LiveNowNav extends AnyPlacement
    implements LiveNowLiveRoomPopPlacement, PopDestPlacement {
  const LiveNowNav._() : super._();
  LiveNowNav surface() {
    _Screens.graph.popTo(_Screens.liveNow);
    return const LiveNowNav._();
  }

  LiveRoomNav goLiveRoom(String id) {
    _Screens.graph.popTo(_Screens.liveNow);
    _Screens.graph.go(_Screens.liveRoom, id, true);
    return const LiveRoomNav._();
  }

  DiscoverNav pop() {
    _Screens.graph.pop();
    return const DiscoverNav._();
  }
}

final class LiveRoomNav extends AnyPlacement
    implements LiveNowLiveRoomPopPlacement, PopDestPlacement {
  const LiveRoomNav._() : super._();
  LiveRoomNav surface() {
    _Screens.graph.popTo(_Screens.liveRoom);
    return const LiveRoomNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.liveRoom);
  LiveRoomNav goLiveRoom(String id) {
    _Screens.graph.popTo(_Screens.liveRoom);
    _Screens.graph.go(_Screens.liveRoom, id, true);
    return const LiveRoomNav._();
  }

  LiveNowLiveRoomPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveLiveNowLiveRoomPopPlacement();
  }

  DiscoverNav popToDiscover() {
    _Screens.graph.pop(_Screens.discover);
    return const DiscoverNav._();
  }

  LiveRoomNav popToLiveRoom() {
    _Screens.graph.pop(_Screens.liveRoom);
    return const LiveRoomNav._();
  }

  N popTo<N extends AnyNav>(LiveRoomPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class LiveRoomPop<N extends AnyNav> {
  const LiveRoomPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const liveNow = LiveRoomPop<LiveNowNav>._(
    _Screens.liveNow,
    LiveNowNav._(),
  );
  static const discover = LiveRoomPop<DiscoverNav>._(
    _Screens.discover,
    DiscoverNav._(),
  );
  static const liveRoom = LiveRoomPop<LiveRoomNav>._(
    _Screens.liveRoom,
    LiveRoomNav._(),
  );
}

final class NearbyNav extends AnyPlacement {
  const NearbyNav._() : super._();
  NearbyNav surface() {
    _Screens.graph.popTo(_Screens.nearby);
    return const NearbyNav._();
  }

  DiscoverNav pop() {
    _Screens.graph.pop();
    return const DiscoverNav._();
  }
}

final class MarketplaceNav extends AnyPlacement
    implements MarketplaceView, PopDestPlacement {
  const MarketplaceNav._() : super._();
  MarketplaceNav surface() {
    _Screens.graph.popTo(_Screens.marketplace);
    return const MarketplaceNav._();
  }

  MarketplaceQueryMut get query => const MarketplaceQueryMut._();
  CategoriesNav goCategories() {
    _Screens.graph.popTo(_Screens.marketplace);
    _Screens.graph.go(_Screens.categories, null, true);
    return const CategoriesNav._();
  }

  CartNav goCart() {
    _Screens.graph.popTo(_Screens.marketplace);
    _Screens.graph.go(_Screens.cart, null, true);
    return const CartNav._();
  }

  MyOrdersNav goMyOrders() {
    _Screens.graph.popTo(_Screens.marketplace);
    _Screens.graph.go(_Screens.myOrders, null, true);
    return const MyOrdersNav._();
  }

  WishlistNav goWishlist() {
    _Screens.graph.popTo(_Screens.marketplace);
    _Screens.graph.go(_Screens.wishlist, null, true);
    return const WishlistNav._();
  }

  CategoryNav goCategory(String id) {
    _Screens.graph.go(_Screens.categories, null, true);
    _Screens.graph.go(_Screens.category, id, true);
    return const CategoryNav._();
  }

  CheckoutNav goCheckout(String id) {
    _Screens.graph.go(_Screens.cart, null, true);
    _Screens.graph.go(_Screens.checkout, id, true);
    return const CheckoutNav._();
  }

  OrderNav goOrder(String id) {
    _Screens.graph.go(_Screens.myOrders, null, true);
    _Screens.graph.go(_Screens.order, id, true);
    return const OrderNav._();
  }

  N go<N extends AnyNav>(MarketplaceHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }
}

final class MarketplaceHop<N extends AnyNav> {
  const MarketplaceHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const categories = MarketplaceHop<CategoriesNav>._(
    _Screens.categories,
    null,
    CategoriesNav._(),
  );
  static const cart = MarketplaceHop<CartNav>._(
    _Screens.cart,
    null,
    CartNav._(),
  );
  static const myOrders = MarketplaceHop<MyOrdersNav>._(
    _Screens.myOrders,
    null,
    MyOrdersNav._(),
  );
  static const wishlist = MarketplaceHop<WishlistNav>._(
    _Screens.wishlist,
    null,
    WishlistNav._(),
  );
}

final class CategoriesNav extends AnyPlacement
    implements CategoriesCategoryPopPlacement, PopDestPlacement {
  const CategoriesNav._() : super._();
  CategoriesNav surface() {
    _Screens.graph.popTo(_Screens.categories);
    return const CategoriesNav._();
  }

  CategoryNav goCategory(String id) {
    _Screens.graph.popTo(_Screens.categories);
    _Screens.graph.go(_Screens.category, id, true);
    return const CategoryNav._();
  }

  MarketplaceNav pop() {
    _Screens.graph.pop();
    return const MarketplaceNav._();
  }
}

final class CategoryNav extends AnyPlacement
    implements
        CategoriesCategoryPopPlacement,
        CategoryListingSellerProfilePopPlacement,
        PopDestPlacement {
  const CategoryNav._() : super._();
  CategoryNav surface() {
    _Screens.graph.popTo(_Screens.category);
    return const CategoryNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.category);
  CategoryNav goCategory(String id) {
    _Screens.graph.popTo(_Screens.category);
    _Screens.graph.go(_Screens.category, id, true);
    return const CategoryNav._();
  }

  ListingNav goListing(String id) {
    _Screens.graph.popTo(_Screens.category);
    _Screens.graph.go(_Screens.listing, id, true);
    return const ListingNav._();
  }

  EditListingNav goEditListing(String id) {
    _Screens.graph.go(_Screens.listing, id, true);
    _Screens.graph.go(_Screens.editListing, id, true);
    return const EditListingNav._();
  }

  N go<N extends AnyNav>(CategoryHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  CategoriesCategoryPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveCategoriesCategoryPopPlacement();
  }

  MarketplaceNav popToMarketplace() {
    _Screens.graph.pop(_Screens.marketplace);
    return const MarketplaceNav._();
  }

  CategoryNav popToCategory() {
    _Screens.graph.pop(_Screens.category);
    return const CategoryNav._();
  }

  N popTo<N extends AnyNav>(CategoryPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class CategoryPop<N extends AnyNav> {
  const CategoryPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const categories = CategoryPop<CategoriesNav>._(
    _Screens.categories,
    CategoriesNav._(),
  );
  static const marketplace = CategoryPop<MarketplaceNav>._(
    _Screens.marketplace,
    MarketplaceNav._(),
  );
  static const category = CategoryPop<CategoryNav>._(
    _Screens.category,
    CategoryNav._(),
  );
}

final class CategoryHop<N extends AnyNav> {
  const CategoryHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static CategoryHop<CategoryNav> category(String id) =>
      CategoryHop._(_Screens.category, id, const CategoryNav._());
  static CategoryHop<ListingNav> listing(String id) =>
      CategoryHop._(_Screens.listing, id, const ListingNav._());
}

final class ListingNav extends AnyPlacement
    implements
        CategoryListingSellerProfilePopPlacement,
        ListingListingVariantPopPlacement,
        ListingSellerProfilePopPlacement,
        PopDestPlacement {
  const ListingNav._() : super._();
  ListingNav surface() {
    _Screens.graph.popTo(_Screens.listing);
    return const ListingNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.listing);
  EditListingNav goEditListing() {
    _Screens.graph.popTo(_Screens.listing);
    _Screens.graph.go(_Screens.editListing, _idOf(_Screens.listing), true);
    return const EditListingNav._();
  }

  SellerProfileNav goSellerProfile(String id) {
    _Screens.graph.popTo(_Screens.listing);
    _Screens.graph.go(_Screens.sellerProfile, id, true);
    return const SellerProfileNav._();
  }

  ListingVariantNav goListingVariant(String id) {
    _Screens.graph.popTo(_Screens.listing);
    _Screens.graph.go(_Screens.listingVariant, id, true);
    return const ListingVariantNav._();
  }

  ListingNav goListing(String id) {
    _Screens.graph.popTo(_Screens.listing);
    _Screens.graph.go(_Screens.listing, id, true);
    return const ListingNav._();
  }

  N go<N extends AnyNav>(ListingHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  CategoryListingSellerProfilePopPlacement pop() {
    _Screens.graph.pop();
    return _resolveCategoryListingSellerProfilePopPlacement();
  }

  CategoriesNav popToCategories() {
    _Screens.graph.pop(_Screens.categories);
    return const CategoriesNav._();
  }

  MarketplaceNav popToMarketplace() {
    _Screens.graph.pop(_Screens.marketplace);
    return const MarketplaceNav._();
  }

  SellerProfileNav popToSellerProfile() {
    _Screens.graph.pop(_Screens.sellerProfile);
    return const SellerProfileNav._();
  }

  ListingNav popToListing() {
    _Screens.graph.pop(_Screens.listing);
    return const ListingNav._();
  }

  N popTo<N extends AnyNav>(ListingPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ListingPop<N extends AnyNav> {
  const ListingPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const category = ListingPop<CategoryNav>._(
    _Screens.category,
    CategoryNav._(),
  );
  static const categories = ListingPop<CategoriesNav>._(
    _Screens.categories,
    CategoriesNav._(),
  );
  static const marketplace = ListingPop<MarketplaceNav>._(
    _Screens.marketplace,
    MarketplaceNav._(),
  );
  static const sellerProfile = ListingPop<SellerProfileNav>._(
    _Screens.sellerProfile,
    SellerProfileNav._(),
  );
  static const listing = ListingPop<ListingNav>._(
    _Screens.listing,
    ListingNav._(),
  );
}

final class ListingHop<N extends AnyNav> {
  const ListingHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static ListingHop<SellerProfileNav> sellerProfile(String id) =>
      ListingHop._(_Screens.sellerProfile, id, const SellerProfileNav._());
  static ListingHop<ListingVariantNav> listingVariant(String id) =>
      ListingHop._(_Screens.listingVariant, id, const ListingVariantNav._());
  static ListingHop<ListingNav> listing(String id) =>
      ListingHop._(_Screens.listing, id, const ListingNav._());
}

final class ListingVariantNav extends AnyPlacement
    implements ListingListingVariantPopPlacement, PopDestPlacement {
  const ListingVariantNav._() : super._();
  ListingVariantNav surface() {
    _Screens.graph.popTo(_Screens.listingVariant);
    return const ListingVariantNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.listingVariant);
  ListingVariantNav goListingVariant(String id) {
    _Screens.graph.popTo(_Screens.listingVariant);
    _Screens.graph.go(_Screens.listingVariant, id, true);
    return const ListingVariantNav._();
  }

  ListingListingVariantPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveListingListingVariantPopPlacement();
  }

  CategoryNav popToCategory() {
    _Screens.graph.pop(_Screens.category);
    return const CategoryNav._();
  }

  CategoriesNav popToCategories() {
    _Screens.graph.pop(_Screens.categories);
    return const CategoriesNav._();
  }

  MarketplaceNav popToMarketplace() {
    _Screens.graph.pop(_Screens.marketplace);
    return const MarketplaceNav._();
  }

  ListingVariantNav popToListingVariant() {
    _Screens.graph.pop(_Screens.listingVariant);
    return const ListingVariantNav._();
  }

  N popTo<N extends AnyNav>(ListingVariantPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ListingVariantPop<N extends AnyNav> {
  const ListingVariantPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const listing = ListingVariantPop<ListingNav>._(
    _Screens.listing,
    ListingNav._(),
  );
  static const category = ListingVariantPop<CategoryNav>._(
    _Screens.category,
    CategoryNav._(),
  );
  static const categories = ListingVariantPop<CategoriesNav>._(
    _Screens.categories,
    CategoriesNav._(),
  );
  static const marketplace = ListingVariantPop<MarketplaceNav>._(
    _Screens.marketplace,
    MarketplaceNav._(),
  );
  static const listingVariant = ListingVariantPop<ListingVariantNav>._(
    _Screens.listingVariant,
    ListingVariantNav._(),
  );
}

final class EditListingNav extends AnyPlacement {
  const EditListingNav._() : super._();
  EditListingNav surface() {
    _Screens.graph.popTo(_Screens.editListing);
    return const EditListingNav._();
  }

  ListingNav pop() {
    _Screens.graph.pop();
    return const ListingNav._();
  }

  CategoryNav popToCategory() {
    _Screens.graph.pop(_Screens.category);
    return const CategoryNav._();
  }

  CategoriesNav popToCategories() {
    _Screens.graph.pop(_Screens.categories);
    return const CategoriesNav._();
  }

  MarketplaceNav popToMarketplace() {
    _Screens.graph.pop(_Screens.marketplace);
    return const MarketplaceNav._();
  }

  N popTo<N extends AnyNav>(EditListingPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class EditListingPop<N extends AnyNav> {
  const EditListingPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const listing = EditListingPop<ListingNav>._(
    _Screens.listing,
    ListingNav._(),
  );
  static const category = EditListingPop<CategoryNav>._(
    _Screens.category,
    CategoryNav._(),
  );
  static const categories = EditListingPop<CategoriesNav>._(
    _Screens.categories,
    CategoriesNav._(),
  );
  static const marketplace = EditListingPop<MarketplaceNav>._(
    _Screens.marketplace,
    MarketplaceNav._(),
  );
}

final class SellerProfileNav extends AnyPlacement
    implements
        CategoryListingSellerProfilePopPlacement,
        ListingSellerProfilePopPlacement,
        PopDestPlacement {
  const SellerProfileNav._() : super._();
  SellerProfileNav surface() {
    _Screens.graph.popTo(_Screens.sellerProfile);
    return const SellerProfileNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.sellerProfile);
  SellerProfileNav goSellerProfile(String id) {
    _Screens.graph.popTo(_Screens.sellerProfile);
    _Screens.graph.go(_Screens.sellerProfile, id, true);
    return const SellerProfileNav._();
  }

  ListingNav goListing(String id) {
    _Screens.graph.popTo(_Screens.sellerProfile);
    _Screens.graph.go(_Screens.listing, id, true);
    return const ListingNav._();
  }

  N go<N extends AnyNav>(SellerProfileHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  ListingSellerProfilePopPlacement pop() {
    _Screens.graph.pop();
    return _resolveListingSellerProfilePopPlacement();
  }

  CategoryNav popToCategory() {
    _Screens.graph.pop(_Screens.category);
    return const CategoryNav._();
  }

  CategoriesNav popToCategories() {
    _Screens.graph.pop(_Screens.categories);
    return const CategoriesNav._();
  }

  MarketplaceNav popToMarketplace() {
    _Screens.graph.pop(_Screens.marketplace);
    return const MarketplaceNav._();
  }

  SellerProfileNav popToSellerProfile() {
    _Screens.graph.pop(_Screens.sellerProfile);
    return const SellerProfileNav._();
  }

  N popTo<N extends AnyNav>(SellerProfilePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class SellerProfilePop<N extends AnyNav> {
  const SellerProfilePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const listing = SellerProfilePop<ListingNav>._(
    _Screens.listing,
    ListingNav._(),
  );
  static const category = SellerProfilePop<CategoryNav>._(
    _Screens.category,
    CategoryNav._(),
  );
  static const categories = SellerProfilePop<CategoriesNav>._(
    _Screens.categories,
    CategoriesNav._(),
  );
  static const marketplace = SellerProfilePop<MarketplaceNav>._(
    _Screens.marketplace,
    MarketplaceNav._(),
  );
  static const sellerProfile = SellerProfilePop<SellerProfileNav>._(
    _Screens.sellerProfile,
    SellerProfileNav._(),
  );
}

final class SellerProfileHop<N extends AnyNav> {
  const SellerProfileHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static SellerProfileHop<SellerProfileNav> sellerProfile(String id) =>
      SellerProfileHop._(
        _Screens.sellerProfile,
        id,
        const SellerProfileNav._(),
      );
  static SellerProfileHop<ListingNav> listing(String id) =>
      SellerProfileHop._(_Screens.listing, id, const ListingNav._());
}

final class CartNav extends AnyPlacement implements PopDestPlacement {
  const CartNav._() : super._();
  CartNav surface() {
    _Screens.graph.popTo(_Screens.cart);
    return const CartNav._();
  }

  CheckoutNav goCheckout(String id) {
    _Screens.graph.popTo(_Screens.cart);
    _Screens.graph.go(_Screens.checkout, id, true);
    return const CheckoutNav._();
  }

  MarketplaceNav pop() {
    _Screens.graph.pop();
    return const MarketplaceNav._();
  }
}

final class CheckoutNav extends AnyPlacement implements PopDestPlacement {
  const CheckoutNav._() : super._();
  CheckoutNav surface() {
    _Screens.graph.popTo(_Screens.checkout);
    return const CheckoutNav._();
  }

  OrderConfirmationNav goOrderConfirmation(String id) {
    _Screens.graph.popTo(_Screens.checkout);
    _Screens.graph.go(_Screens.orderConfirmation, id, true);
    return const OrderConfirmationNav._();
  }

  CartNav pop() {
    _Screens.graph.pop();
    return const CartNav._();
  }

  MarketplaceNav popToMarketplace() {
    _Screens.graph.pop(_Screens.marketplace);
    return const MarketplaceNav._();
  }

  N popTo<N extends AnyNav>(CheckoutPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class CheckoutPop<N extends AnyNav> {
  const CheckoutPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const cart = CheckoutPop<CartNav>._(_Screens.cart, CartNav._());
  static const marketplace = CheckoutPop<MarketplaceNav>._(
    _Screens.marketplace,
    MarketplaceNav._(),
  );
}

final class OrderConfirmationNav extends AnyPlacement {
  const OrderConfirmationNav._() : super._();
  OrderConfirmationNav surface() {
    _Screens.graph.popTo(_Screens.orderConfirmation);
    return const OrderConfirmationNav._();
  }

  CheckoutNav pop() {
    _Screens.graph.pop();
    return const CheckoutNav._();
  }

  CartNav popToCart() {
    _Screens.graph.pop(_Screens.cart);
    return const CartNav._();
  }

  MarketplaceNav popToMarketplace() {
    _Screens.graph.pop(_Screens.marketplace);
    return const MarketplaceNav._();
  }

  N popTo<N extends AnyNav>(OrderConfirmationPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class OrderConfirmationPop<N extends AnyNav> {
  const OrderConfirmationPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const checkout = OrderConfirmationPop<CheckoutNav>._(
    _Screens.checkout,
    CheckoutNav._(),
  );
  static const cart = OrderConfirmationPop<CartNav>._(
    _Screens.cart,
    CartNav._(),
  );
  static const marketplace = OrderConfirmationPop<MarketplaceNav>._(
    _Screens.marketplace,
    MarketplaceNav._(),
  );
}

final class MyOrdersNav extends AnyPlacement
    implements MyOrdersOrderPopPlacement, PopDestPlacement {
  const MyOrdersNav._() : super._();
  MyOrdersNav surface() {
    _Screens.graph.popTo(_Screens.myOrders);
    return const MyOrdersNav._();
  }

  OrderNav goOrder(String id) {
    _Screens.graph.popTo(_Screens.myOrders);
    _Screens.graph.go(_Screens.order, id, true);
    return const OrderNav._();
  }

  MarketplaceNav pop() {
    _Screens.graph.pop();
    return const MarketplaceNav._();
  }
}

final class OrderNav extends AnyPlacement
    implements MyOrdersOrderPopPlacement, PopDestPlacement {
  const OrderNav._() : super._();
  OrderNav surface() {
    _Screens.graph.popTo(_Screens.order);
    return const OrderNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.order);
  OrderNav goOrder(String id) {
    _Screens.graph.popTo(_Screens.order);
    _Screens.graph.go(_Screens.order, id, true);
    return const OrderNav._();
  }

  MyOrdersOrderPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveMyOrdersOrderPopPlacement();
  }

  MarketplaceNav popToMarketplace() {
    _Screens.graph.pop(_Screens.marketplace);
    return const MarketplaceNav._();
  }

  OrderNav popToOrder() {
    _Screens.graph.pop(_Screens.order);
    return const OrderNav._();
  }

  N popTo<N extends AnyNav>(OrderPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class OrderPop<N extends AnyNav> {
  const OrderPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const myOrders = OrderPop<MyOrdersNav>._(
    _Screens.myOrders,
    MyOrdersNav._(),
  );
  static const marketplace = OrderPop<MarketplaceNav>._(
    _Screens.marketplace,
    MarketplaceNav._(),
  );
  static const order = OrderPop<OrderNav>._(_Screens.order, OrderNav._());
}

final class WishlistNav extends AnyPlacement {
  const WishlistNav._() : super._();
  WishlistNav surface() {
    _Screens.graph.popTo(_Screens.wishlist);
    return const WishlistNav._();
  }

  MarketplaceNav pop() {
    _Screens.graph.pop();
    return const MarketplaceNav._();
  }
}

final class MessagesNav extends AnyPlacement
    implements GroupChatMessagesPopPlacement, PopDestPlacement {
  const MessagesNav._() : super._();
  MessagesNav surface() {
    _Screens.graph.popTo(_Screens.messages);
    return const MessagesNav._();
  }

  ChatsNav goChats() {
    _Screens.graph.popTo(_Screens.messages);
    _Screens.graph.go(_Screens.chats, null, true);
    return const ChatsNav._();
  }

  NewChatNav goNewChat() {
    _Screens.graph.popTo(_Screens.messages);
    _Screens.graph.go(_Screens.newChat, null, true);
    return const NewChatNav._();
  }

  GroupChatNav goGroupChat(String id) {
    _Screens.graph.popTo(_Screens.messages);
    _Screens.graph.go(_Screens.groupChat, id, true);
    return const GroupChatNav._();
  }

  ChatNav goChat(String id) {
    _Screens.graph.go(_Screens.chats, null, true);
    _Screens.graph.go(_Screens.chat, id, true);
    return const ChatNav._();
  }

  VoiceCallNav goVoiceCall(String id) {
    _Screens.graph.go(_Screens.chats, null, true);
    _Screens.graph.go(_Screens.chat, id, true);
    _Screens.graph.go(_Screens.voiceCall, id, true);
    return const VoiceCallNav._();
  }

  GroupInfoNav goGroupInfo(String id) {
    _Screens.graph.go(_Screens.groupChat, id, true);
    _Screens.graph.go(_Screens.groupInfo, id, true);
    return const GroupInfoNav._();
  }

  N go<N extends AnyNav>(MessagesHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }
}

final class MessagesHop<N extends AnyNav> {
  const MessagesHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const chats = MessagesHop<ChatsNav>._(
    _Screens.chats,
    null,
    ChatsNav._(),
  );
  static const newChat = MessagesHop<NewChatNav>._(
    _Screens.newChat,
    null,
    NewChatNav._(),
  );
  static MessagesHop<GroupChatNav> groupChat(String id) =>
      MessagesHop._(_Screens.groupChat, id, const GroupChatNav._());
}

final class ChatsNav extends AnyPlacement
    implements ChatsMessagePopPlacement, PopDestPlacement {
  const ChatsNav._() : super._();
  ChatsNav surface() {
    _Screens.graph.popTo(_Screens.chats);
    return const ChatsNav._();
  }

  ChatNav goChat(String id) {
    _Screens.graph.popTo(_Screens.chats);
    _Screens.graph.go(_Screens.chat, id, true);
    return const ChatNav._();
  }

  VoiceCallNav goVoiceCall(String id) {
    _Screens.graph.go(_Screens.chat, id, true);
    _Screens.graph.go(_Screens.voiceCall, id, true);
    return const VoiceCallNav._();
  }

  MessagesNav pop() {
    _Screens.graph.pop();
    return const MessagesNav._();
  }
}

final class ChatNav extends AnyPlacement
    implements ChatThreadPopPlacement, PopDestPlacement {
  const ChatNav._() : super._();
  ChatNav surface() {
    _Screens.graph.popTo(_Screens.chat);
    return const ChatNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.chat);
  ThreadNav goThread(String id) {
    _Screens.graph.popTo(_Screens.chat);
    _Screens.graph.go(_Screens.thread, id, true);
    return const ThreadNav._();
  }

  VoiceCallNav goVoiceCall() {
    _Screens.graph.popTo(_Screens.chat);
    _Screens.graph.go(_Screens.voiceCall, _idOf(_Screens.chat), true);
    return const VoiceCallNav._();
  }

  MessagesChatsChatUserProfileNav goUserProfile(String id) {
    _Screens.graph.popTo(_Screens.chat);
    _Screens.graph.go(_Screens.userProfile, id, true);
    return const MessagesChatsChatUserProfileNav._();
  }

  N go<N extends AnyNav>(ChatHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  ChatsMessagePopPlacement pop() {
    _Screens.graph.pop();
    return _resolveChatsMessagePopPlacement();
  }

  MessagesNav popToMessages() {
    _Screens.graph.pop(_Screens.messages);
    return const MessagesNav._();
  }

  MessageNav popToMessage() {
    _Screens.graph.pop(_Screens.message);
    return const MessageNav._();
  }

  ThreadNav popToThread() {
    _Screens.graph.pop(_Screens.thread);
    return const ThreadNav._();
  }

  ChatNav popToChat() {
    _Screens.graph.pop(_Screens.chat);
    return const ChatNav._();
  }

  N popTo<N extends AnyNav>(ChatPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ChatPop<N extends AnyNav> {
  const ChatPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const chats = ChatPop<ChatsNav>._(_Screens.chats, ChatsNav._());
  static const messages = ChatPop<MessagesNav>._(
    _Screens.messages,
    MessagesNav._(),
  );
  static const message = ChatPop<MessageNav>._(
    _Screens.message,
    MessageNav._(),
  );
  static const thread = ChatPop<ThreadNav>._(_Screens.thread, ThreadNav._());
  static const chat = ChatPop<ChatNav>._(_Screens.chat, ChatNav._());
}

final class ChatHop<N extends AnyNav> {
  const ChatHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static ChatHop<ThreadNav> thread(String id) =>
      ChatHop._(_Screens.thread, id, const ThreadNav._());
  static ChatHop<MessagesChatsChatUserProfileNav> userProfile(String id) =>
      ChatHop._(
        _Screens.userProfile,
        id,
        const MessagesChatsChatUserProfileNav._(),
      );
}

final class ThreadNav extends AnyPlacement
    implements ChatThreadPopPlacement, PopDestPlacement {
  const ThreadNav._() : super._();
  ThreadNav surface() {
    _Screens.graph.popTo(_Screens.thread);
    return const ThreadNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.thread);
  MessageNav goMessage(String id) {
    _Screens.graph.popTo(_Screens.thread);
    _Screens.graph.go(_Screens.message, id, true);
    return const MessageNav._();
  }

  ThreadNav goThread(String id) {
    _Screens.graph.popTo(_Screens.thread);
    _Screens.graph.go(_Screens.thread, id, true);
    return const ThreadNav._();
  }

  N go<N extends AnyNav>(ThreadHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  ChatThreadPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveChatThreadPopPlacement();
  }

  ChatsNav popToChats() {
    _Screens.graph.pop(_Screens.chats);
    return const ChatsNav._();
  }

  MessagesNav popToMessages() {
    _Screens.graph.pop(_Screens.messages);
    return const MessagesNav._();
  }

  MessageNav popToMessage() {
    _Screens.graph.pop(_Screens.message);
    return const MessageNav._();
  }

  ThreadNav popToThread() {
    _Screens.graph.pop(_Screens.thread);
    return const ThreadNav._();
  }

  N popTo<N extends AnyNav>(ThreadPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ThreadPop<N extends AnyNav> {
  const ThreadPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const chat = ThreadPop<ChatNav>._(_Screens.chat, ChatNav._());
  static const chats = ThreadPop<ChatsNav>._(_Screens.chats, ChatsNav._());
  static const messages = ThreadPop<MessagesNav>._(
    _Screens.messages,
    MessagesNav._(),
  );
  static const message = ThreadPop<MessageNav>._(
    _Screens.message,
    MessageNav._(),
  );
  static const thread = ThreadPop<ThreadNav>._(_Screens.thread, ThreadNav._());
}

final class ThreadHop<N extends AnyNav> {
  const ThreadHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static ThreadHop<MessageNav> message(String id) =>
      ThreadHop._(_Screens.message, id, const MessageNav._());
  static ThreadHop<ThreadNav> thread(String id) =>
      ThreadHop._(_Screens.thread, id, const ThreadNav._());
}

final class MessageNav extends AnyPlacement
    implements
        ChatsMessagePopPlacement,
        MessageMessageReplyPopPlacement,
        PopDestPlacement {
  const MessageNav._() : super._();
  MessageNav surface() {
    _Screens.graph.popTo(_Screens.message);
    return const MessageNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.message);
  MessageReplyNav goMessageReply(String id) {
    _Screens.graph.popTo(_Screens.message);
    _Screens.graph.go(_Screens.messageReply, id, true);
    return const MessageReplyNav._();
  }

  ChatNav goChat(String id) {
    _Screens.graph.popTo(_Screens.message);
    _Screens.graph.go(_Screens.chat, id, true);
    return const ChatNav._();
  }

  N go<N extends AnyNav>(MessageHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  ThreadNav pop() {
    _Screens.graph.pop();
    return const ThreadNav._();
  }

  ChatNav popToChat() {
    _Screens.graph.pop(_Screens.chat);
    return const ChatNav._();
  }

  ChatsNav popToChats() {
    _Screens.graph.pop(_Screens.chats);
    return const ChatsNav._();
  }

  MessagesNav popToMessages() {
    _Screens.graph.pop(_Screens.messages);
    return const MessagesNav._();
  }

  MessageNav popToMessage() {
    _Screens.graph.pop(_Screens.message);
    return const MessageNav._();
  }

  N popTo<N extends AnyNav>(MessagePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class MessagePop<N extends AnyNav> {
  const MessagePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const thread = MessagePop<ThreadNav>._(_Screens.thread, ThreadNav._());
  static const chat = MessagePop<ChatNav>._(_Screens.chat, ChatNav._());
  static const chats = MessagePop<ChatsNav>._(_Screens.chats, ChatsNav._());
  static const messages = MessagePop<MessagesNav>._(
    _Screens.messages,
    MessagesNav._(),
  );
  static const message = MessagePop<MessageNav>._(
    _Screens.message,
    MessageNav._(),
  );
}

final class MessageHop<N extends AnyNav> {
  const MessageHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static MessageHop<MessageReplyNav> messageReply(String id) =>
      MessageHop._(_Screens.messageReply, id, const MessageReplyNav._());
  static MessageHop<ChatNav> chat(String id) =>
      MessageHop._(_Screens.chat, id, const ChatNav._());
}

final class MessageReplyNav extends AnyPlacement
    implements MessageMessageReplyPopPlacement, PopDestPlacement {
  const MessageReplyNav._() : super._();
  MessageReplyNav surface() {
    _Screens.graph.popTo(_Screens.messageReply);
    return const MessageReplyNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.messageReply);
  MessageReplyNav goMessageReply(String id) {
    _Screens.graph.popTo(_Screens.messageReply);
    _Screens.graph.go(_Screens.messageReply, id, true);
    return const MessageReplyNav._();
  }

  MessageMessageReplyPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveMessageMessageReplyPopPlacement();
  }

  ThreadNav popToThread() {
    _Screens.graph.pop(_Screens.thread);
    return const ThreadNav._();
  }

  ChatNav popToChat() {
    _Screens.graph.pop(_Screens.chat);
    return const ChatNav._();
  }

  ChatsNav popToChats() {
    _Screens.graph.pop(_Screens.chats);
    return const ChatsNav._();
  }

  MessagesNav popToMessages() {
    _Screens.graph.pop(_Screens.messages);
    return const MessagesNav._();
  }

  MessageReplyNav popToMessageReply() {
    _Screens.graph.pop(_Screens.messageReply);
    return const MessageReplyNav._();
  }

  N popTo<N extends AnyNav>(MessageReplyPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class MessageReplyPop<N extends AnyNav> {
  const MessageReplyPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const message = MessageReplyPop<MessageNav>._(
    _Screens.message,
    MessageNav._(),
  );
  static const thread = MessageReplyPop<ThreadNav>._(
    _Screens.thread,
    ThreadNav._(),
  );
  static const chat = MessageReplyPop<ChatNav>._(_Screens.chat, ChatNav._());
  static const chats = MessageReplyPop<ChatsNav>._(
    _Screens.chats,
    ChatsNav._(),
  );
  static const messages = MessageReplyPop<MessagesNav>._(
    _Screens.messages,
    MessagesNav._(),
  );
  static const messageReply = MessageReplyPop<MessageReplyNav>._(
    _Screens.messageReply,
    MessageReplyNav._(),
  );
}

final class VoiceCallNav extends AnyPlacement {
  const VoiceCallNav._() : super._();
  VoiceCallNav surface() {
    _Screens.graph.popTo(_Screens.voiceCall);
    return const VoiceCallNav._();
  }

  ChatNav pop() {
    _Screens.graph.pop();
    return const ChatNav._();
  }

  ChatsNav popToChats() {
    _Screens.graph.pop(_Screens.chats);
    return const ChatsNav._();
  }

  MessagesNav popToMessages() {
    _Screens.graph.pop(_Screens.messages);
    return const MessagesNav._();
  }

  N popTo<N extends AnyNav>(VoiceCallPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class VoiceCallPop<N extends AnyNav> {
  const VoiceCallPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const chat = VoiceCallPop<ChatNav>._(_Screens.chat, ChatNav._());
  static const chats = VoiceCallPop<ChatsNav>._(_Screens.chats, ChatsNav._());
  static const messages = VoiceCallPop<MessagesNav>._(
    _Screens.messages,
    MessagesNav._(),
  );
}

final class NewChatNav extends AnyPlacement {
  const NewChatNav._() : super._();
  NewChatNav surface() {
    _Screens.graph.popTo(_Screens.newChat);
    return const NewChatNav._();
  }

  MessagesNav pop() {
    _Screens.graph.pop();
    return const MessagesNav._();
  }
}

final class GroupChatNav extends AnyPlacement
    implements GroupChatMessagesPopPlacement, PopDestPlacement {
  const GroupChatNav._() : super._();
  GroupChatNav surface() {
    _Screens.graph.popTo(_Screens.groupChat);
    return const GroupChatNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.groupChat);
  GroupInfoNav goGroupInfo() {
    _Screens.graph.popTo(_Screens.groupChat);
    _Screens.graph.go(_Screens.groupInfo, _idOf(_Screens.groupChat), true);
    return const GroupInfoNav._();
  }

  GroupChatNav goGroupChat(String id) {
    _Screens.graph.popTo(_Screens.groupChat);
    _Screens.graph.go(_Screens.groupChat, id, true);
    return const GroupChatNav._();
  }

  GroupChatMessagesPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveGroupChatMessagesPopPlacement();
  }

  GroupChatNav popToGroupChat() {
    _Screens.graph.pop(_Screens.groupChat);
    return const GroupChatNav._();
  }

  N popTo<N extends AnyNav>(GroupChatPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class GroupChatPop<N extends AnyNav> {
  const GroupChatPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const messages = GroupChatPop<MessagesNav>._(
    _Screens.messages,
    MessagesNav._(),
  );
  static const groupChat = GroupChatPop<GroupChatNav>._(
    _Screens.groupChat,
    GroupChatNav._(),
  );
}

final class GroupInfoNav extends AnyPlacement {
  const GroupInfoNav._() : super._();
  GroupInfoNav surface() {
    _Screens.graph.popTo(_Screens.groupInfo);
    return const GroupInfoNav._();
  }

  GroupChatNav pop() {
    _Screens.graph.pop();
    return const GroupChatNav._();
  }

  MessagesNav popToMessages() {
    _Screens.graph.pop(_Screens.messages);
    return const MessagesNav._();
  }

  N popTo<N extends AnyNav>(GroupInfoPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class GroupInfoPop<N extends AnyNav> {
  const GroupInfoPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const groupChat = GroupInfoPop<GroupChatNav>._(
    _Screens.groupChat,
    GroupChatNav._(),
  );
  static const messages = GroupInfoPop<MessagesNav>._(
    _Screens.messages,
    MessagesNav._(),
  );
}

final class WalletNav extends AnyPlacement implements PopDestPlacement {
  const WalletNav._() : super._();
  WalletNav surface() {
    _Screens.graph.popTo(_Screens.wallet);
    return const WalletNav._();
  }

  BalanceNav goBalance() {
    _Screens.graph.popTo(_Screens.wallet);
    _Screens.graph.go(_Screens.balance, null, true);
    return const BalanceNav._();
  }

  AccountsNav goAccounts() {
    _Screens.graph.popTo(_Screens.wallet);
    _Screens.graph.go(_Screens.accounts, null, true);
    return const AccountsNav._();
  }

  SendMoneyNav goSendMoney() {
    _Screens.graph.popTo(_Screens.wallet);
    _Screens.graph.go(_Screens.sendMoney, null, true);
    return const SendMoneyNav._();
  }

  ReceiveMoneyNav goReceiveMoney() {
    _Screens.graph.popTo(_Screens.wallet);
    _Screens.graph.go(_Screens.receiveMoney, null, true);
    return const ReceiveMoneyNav._();
  }

  PaymentMethodsNav goPaymentMethods() {
    _Screens.graph.popTo(_Screens.wallet);
    _Screens.graph.go(_Screens.paymentMethods, null, true);
    return const PaymentMethodsNav._();
  }

  AccountNav goAccount(String id) {
    _Screens.graph.go(_Screens.accounts, null, true);
    _Screens.graph.go(_Screens.account, id, true);
    return const AccountNav._();
  }

  CardNav goCard(String id) {
    _Screens.graph.go(_Screens.paymentMethods, null, true);
    _Screens.graph.go(_Screens.card, id, true);
    return const CardNav._();
  }

  N go<N extends AnyNav>(WalletHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }
}

final class WalletHop<N extends AnyNav> {
  const WalletHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const balance = WalletHop<BalanceNav>._(
    _Screens.balance,
    null,
    BalanceNav._(),
  );
  static const accounts = WalletHop<AccountsNav>._(
    _Screens.accounts,
    null,
    AccountsNav._(),
  );
  static const sendMoney = WalletHop<SendMoneyNav>._(
    _Screens.sendMoney,
    null,
    SendMoneyNav._(),
  );
  static const receiveMoney = WalletHop<ReceiveMoneyNav>._(
    _Screens.receiveMoney,
    null,
    ReceiveMoneyNav._(),
  );
  static const paymentMethods = WalletHop<PaymentMethodsNav>._(
    _Screens.paymentMethods,
    null,
    PaymentMethodsNav._(),
  );
}

final class BalanceNav extends AnyPlacement {
  const BalanceNav._() : super._();
  BalanceNav surface() {
    _Screens.graph.popTo(_Screens.balance);
    return const BalanceNav._();
  }

  WalletNav pop() {
    _Screens.graph.pop();
    return const WalletNav._();
  }
}

final class AccountsNav extends AnyPlacement
    implements AccountAccountsPopPlacement, PopDestPlacement {
  const AccountsNav._() : super._();
  AccountsNav surface() {
    _Screens.graph.popTo(_Screens.accounts);
    return const AccountsNav._();
  }

  AccountNav goAccount(String id) {
    _Screens.graph.popTo(_Screens.accounts);
    _Screens.graph.go(_Screens.account, id, true);
    return const AccountNav._();
  }

  WalletNav pop() {
    _Screens.graph.pop();
    return const WalletNav._();
  }
}

final class AccountNav extends AnyPlacement
    implements AccountAccountsPopPlacement, PopDestPlacement {
  const AccountNav._() : super._();
  AccountNav surface() {
    _Screens.graph.popTo(_Screens.account);
    return const AccountNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.account);
  TransactionsNav goTransactions() {
    _Screens.graph.popTo(_Screens.account);
    _Screens.graph.go(_Screens.transactions, null, true);
    return const TransactionsNav._();
  }

  StatementsNav goStatements() {
    _Screens.graph.popTo(_Screens.account);
    _Screens.graph.go(_Screens.statements, null, true);
    return const StatementsNav._();
  }

  AccountNav goAccount(String id) {
    _Screens.graph.popTo(_Screens.account);
    _Screens.graph.go(_Screens.account, id, true);
    return const AccountNav._();
  }

  TransactionNav goTransaction(String id) {
    _Screens.graph.go(_Screens.transactions, null, true);
    _Screens.graph.go(_Screens.transaction, id, true);
    return const TransactionNav._();
  }

  StatementNav goStatement(String id) {
    _Screens.graph.go(_Screens.statements, null, true);
    _Screens.graph.go(_Screens.statement, id, true);
    return const StatementNav._();
  }

  N go<N extends AnyNav>(AccountHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  AccountAccountsPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveAccountAccountsPopPlacement();
  }

  WalletNav popToWallet() {
    _Screens.graph.pop(_Screens.wallet);
    return const WalletNav._();
  }

  AccountNav popToAccount() {
    _Screens.graph.pop(_Screens.account);
    return const AccountNav._();
  }

  N popTo<N extends AnyNav>(AccountPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AccountPop<N extends AnyNav> {
  const AccountPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const accounts = AccountPop<AccountsNav>._(
    _Screens.accounts,
    AccountsNav._(),
  );
  static const wallet = AccountPop<WalletNav>._(_Screens.wallet, WalletNav._());
  static const account = AccountPop<AccountNav>._(
    _Screens.account,
    AccountNav._(),
  );
}

final class AccountHop<N extends AnyNav> {
  const AccountHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const transactions = AccountHop<TransactionsNav>._(
    _Screens.transactions,
    null,
    TransactionsNav._(),
  );
  static const statements = AccountHop<StatementsNav>._(
    _Screens.statements,
    null,
    StatementsNav._(),
  );
  static AccountHop<AccountNav> account(String id) =>
      AccountHop._(_Screens.account, id, const AccountNav._());
}

final class TransactionsNav extends AnyPlacement
    implements TransactionTransactionsPopPlacement, PopDestPlacement {
  const TransactionsNav._() : super._();
  TransactionsNav surface() {
    _Screens.graph.popTo(_Screens.transactions);
    return const TransactionsNav._();
  }

  TransactionNav goTransaction(String id) {
    _Screens.graph.popTo(_Screens.transactions);
    _Screens.graph.go(_Screens.transaction, id, true);
    return const TransactionNav._();
  }

  AccountNav pop() {
    _Screens.graph.pop();
    return const AccountNav._();
  }

  AccountsNav popToAccounts() {
    _Screens.graph.pop(_Screens.accounts);
    return const AccountsNav._();
  }

  WalletNav popToWallet() {
    _Screens.graph.pop(_Screens.wallet);
    return const WalletNav._();
  }

  N popTo<N extends AnyNav>(TransactionsPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class TransactionsPop<N extends AnyNav> {
  const TransactionsPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const account = TransactionsPop<AccountNav>._(
    _Screens.account,
    AccountNav._(),
  );
  static const accounts = TransactionsPop<AccountsNav>._(
    _Screens.accounts,
    AccountsNav._(),
  );
  static const wallet = TransactionsPop<WalletNav>._(
    _Screens.wallet,
    WalletNav._(),
  );
}

final class TransactionNav extends AnyPlacement
    implements
        TransactionTransactionsPopPlacement,
        TransactionTransactionItemPopPlacement,
        PopDestPlacement {
  const TransactionNav._() : super._();
  TransactionNav surface() {
    _Screens.graph.popTo(_Screens.transaction);
    return const TransactionNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.transaction);
  TransactionItemNav goTransactionItem(String id) {
    _Screens.graph.popTo(_Screens.transaction);
    _Screens.graph.go(_Screens.transactionItem, id, true);
    return const TransactionItemNav._();
  }

  TransactionNav goTransaction(String id) {
    _Screens.graph.popTo(_Screens.transaction);
    _Screens.graph.go(_Screens.transaction, id, true);
    return const TransactionNav._();
  }

  N go<N extends AnyNav>(TransactionHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  TransactionTransactionsPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveTransactionTransactionsPopPlacement();
  }

  AccountNav popToAccount() {
    _Screens.graph.pop(_Screens.account);
    return const AccountNav._();
  }

  AccountsNav popToAccounts() {
    _Screens.graph.pop(_Screens.accounts);
    return const AccountsNav._();
  }

  WalletNav popToWallet() {
    _Screens.graph.pop(_Screens.wallet);
    return const WalletNav._();
  }

  TransactionNav popToTransaction() {
    _Screens.graph.pop(_Screens.transaction);
    return const TransactionNav._();
  }

  N popTo<N extends AnyNav>(TransactionPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class TransactionPop<N extends AnyNav> {
  const TransactionPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const transactions = TransactionPop<TransactionsNav>._(
    _Screens.transactions,
    TransactionsNav._(),
  );
  static const account = TransactionPop<AccountNav>._(
    _Screens.account,
    AccountNav._(),
  );
  static const accounts = TransactionPop<AccountsNav>._(
    _Screens.accounts,
    AccountsNav._(),
  );
  static const wallet = TransactionPop<WalletNav>._(
    _Screens.wallet,
    WalletNav._(),
  );
  static const transaction = TransactionPop<TransactionNav>._(
    _Screens.transaction,
    TransactionNav._(),
  );
}

final class TransactionHop<N extends AnyNav> {
  const TransactionHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static TransactionHop<TransactionItemNav> transactionItem(String id) =>
      TransactionHop._(
        _Screens.transactionItem,
        id,
        const TransactionItemNav._(),
      );
  static TransactionHop<TransactionNav> transaction(String id) =>
      TransactionHop._(_Screens.transaction, id, const TransactionNav._());
}

final class TransactionItemNav extends AnyPlacement
    implements TransactionTransactionItemPopPlacement, PopDestPlacement {
  const TransactionItemNav._() : super._();
  TransactionItemNav surface() {
    _Screens.graph.popTo(_Screens.transactionItem);
    return const TransactionItemNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.transactionItem);
  TransactionItemNav goTransactionItem(String id) {
    _Screens.graph.popTo(_Screens.transactionItem);
    _Screens.graph.go(_Screens.transactionItem, id, true);
    return const TransactionItemNav._();
  }

  TransactionTransactionItemPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveTransactionTransactionItemPopPlacement();
  }

  TransactionsNav popToTransactions() {
    _Screens.graph.pop(_Screens.transactions);
    return const TransactionsNav._();
  }

  AccountNav popToAccount() {
    _Screens.graph.pop(_Screens.account);
    return const AccountNav._();
  }

  AccountsNav popToAccounts() {
    _Screens.graph.pop(_Screens.accounts);
    return const AccountsNav._();
  }

  WalletNav popToWallet() {
    _Screens.graph.pop(_Screens.wallet);
    return const WalletNav._();
  }

  TransactionItemNav popToTransactionItem() {
    _Screens.graph.pop(_Screens.transactionItem);
    return const TransactionItemNav._();
  }

  N popTo<N extends AnyNav>(TransactionItemPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class TransactionItemPop<N extends AnyNav> {
  const TransactionItemPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const transaction = TransactionItemPop<TransactionNav>._(
    _Screens.transaction,
    TransactionNav._(),
  );
  static const transactions = TransactionItemPop<TransactionsNav>._(
    _Screens.transactions,
    TransactionsNav._(),
  );
  static const account = TransactionItemPop<AccountNav>._(
    _Screens.account,
    AccountNav._(),
  );
  static const accounts = TransactionItemPop<AccountsNav>._(
    _Screens.accounts,
    AccountsNav._(),
  );
  static const wallet = TransactionItemPop<WalletNav>._(
    _Screens.wallet,
    WalletNav._(),
  );
  static const transactionItem = TransactionItemPop<TransactionItemNav>._(
    _Screens.transactionItem,
    TransactionItemNav._(),
  );
}

final class SendMoneyNav extends AnyPlacement {
  const SendMoneyNav._() : super._();
  SendMoneyNav surface() {
    _Screens.graph.popTo(_Screens.sendMoney);
    return const SendMoneyNav._();
  }

  WalletNav pop() {
    _Screens.graph.pop();
    return const WalletNav._();
  }
}

final class ReceiveMoneyNav extends AnyPlacement {
  const ReceiveMoneyNav._() : super._();
  ReceiveMoneyNav surface() {
    _Screens.graph.popTo(_Screens.receiveMoney);
    return const ReceiveMoneyNav._();
  }

  WalletNav pop() {
    _Screens.graph.pop();
    return const WalletNav._();
  }
}

final class PaymentMethodsNav extends AnyPlacement implements PopDestPlacement {
  const PaymentMethodsNav._() : super._();
  PaymentMethodsNav surface() {
    _Screens.graph.popTo(_Screens.paymentMethods);
    return const PaymentMethodsNav._();
  }

  AddCardNav goAddCard() {
    _Screens.graph.popTo(_Screens.paymentMethods);
    _Screens.graph.go(_Screens.addCard, null, true);
    return const AddCardNav._();
  }

  CardNav goCard(String id) {
    _Screens.graph.popTo(_Screens.paymentMethods);
    _Screens.graph.go(_Screens.card, id, true);
    return const CardNav._();
  }

  N go<N extends AnyNav>(PaymentMethodsHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  WalletNav pop() {
    _Screens.graph.pop();
    return const WalletNav._();
  }
}

final class PaymentMethodsHop<N extends AnyNav> {
  const PaymentMethodsHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const addCard = PaymentMethodsHop<AddCardNav>._(
    _Screens.addCard,
    null,
    AddCardNav._(),
  );
  static PaymentMethodsHop<CardNav> card(String id) =>
      PaymentMethodsHop._(_Screens.card, id, const CardNav._());
}

final class AddCardNav extends AnyPlacement {
  const AddCardNav._() : super._();
  AddCardNav surface() {
    _Screens.graph.popTo(_Screens.addCard);
    return const AddCardNav._();
  }

  PaymentMethodsNav pop() {
    _Screens.graph.pop();
    return const PaymentMethodsNav._();
  }

  WalletNav popToWallet() {
    _Screens.graph.pop(_Screens.wallet);
    return const WalletNav._();
  }

  N popTo<N extends AnyNav>(AddCardPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AddCardPop<N extends AnyNav> {
  const AddCardPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const paymentMethods = AddCardPop<PaymentMethodsNav>._(
    _Screens.paymentMethods,
    PaymentMethodsNav._(),
  );
  static const wallet = AddCardPop<WalletNav>._(_Screens.wallet, WalletNav._());
}

final class CardNav extends AnyPlacement {
  const CardNav._() : super._();
  CardNav surface() {
    _Screens.graph.popTo(_Screens.card);
    return const CardNav._();
  }

  PaymentMethodsNav pop() {
    _Screens.graph.pop();
    return const PaymentMethodsNav._();
  }

  WalletNav popToWallet() {
    _Screens.graph.pop(_Screens.wallet);
    return const WalletNav._();
  }

  N popTo<N extends AnyNav>(CardPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class CardPop<N extends AnyNav> {
  const CardPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const paymentMethods = CardPop<PaymentMethodsNav>._(
    _Screens.paymentMethods,
    PaymentMethodsNav._(),
  );
  static const wallet = CardPop<WalletNav>._(_Screens.wallet, WalletNav._());
}

final class StatementsNav extends AnyPlacement implements PopDestPlacement {
  const StatementsNav._() : super._();
  StatementsNav surface() {
    _Screens.graph.popTo(_Screens.statements);
    return const StatementsNav._();
  }

  StatementNav goStatement(String id) {
    _Screens.graph.popTo(_Screens.statements);
    _Screens.graph.go(_Screens.statement, id, true);
    return const StatementNav._();
  }

  AccountNav pop() {
    _Screens.graph.pop();
    return const AccountNav._();
  }

  AccountsNav popToAccounts() {
    _Screens.graph.pop(_Screens.accounts);
    return const AccountsNav._();
  }

  WalletNav popToWallet() {
    _Screens.graph.pop(_Screens.wallet);
    return const WalletNav._();
  }

  N popTo<N extends AnyNav>(StatementsPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class StatementsPop<N extends AnyNav> {
  const StatementsPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const account = StatementsPop<AccountNav>._(
    _Screens.account,
    AccountNav._(),
  );
  static const accounts = StatementsPop<AccountsNav>._(
    _Screens.accounts,
    AccountsNav._(),
  );
  static const wallet = StatementsPop<WalletNav>._(
    _Screens.wallet,
    WalletNav._(),
  );
}

final class StatementNav extends AnyPlacement {
  const StatementNav._() : super._();
  StatementNav surface() {
    _Screens.graph.popTo(_Screens.statement);
    return const StatementNav._();
  }

  StatementsNav pop() {
    _Screens.graph.pop();
    return const StatementsNav._();
  }

  AccountNav popToAccount() {
    _Screens.graph.pop(_Screens.account);
    return const AccountNav._();
  }

  AccountsNav popToAccounts() {
    _Screens.graph.pop(_Screens.accounts);
    return const AccountsNav._();
  }

  WalletNav popToWallet() {
    _Screens.graph.pop(_Screens.wallet);
    return const WalletNav._();
  }

  N popTo<N extends AnyNav>(StatementPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class StatementPop<N extends AnyNav> {
  const StatementPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const statements = StatementPop<StatementsNav>._(
    _Screens.statements,
    StatementsNav._(),
  );
  static const account = StatementPop<AccountNav>._(
    _Screens.account,
    AccountNav._(),
  );
  static const accounts = StatementPop<AccountsNav>._(
    _Screens.accounts,
    AccountsNav._(),
  );
  static const wallet = StatementPop<WalletNav>._(
    _Screens.wallet,
    WalletNav._(),
  );
}

final class ProfileNav extends AnyPlacement implements PopDestPlacement {
  const ProfileNav._() : super._();
  ProfileNav surface() {
    _Screens.graph.popTo(_Screens.profile);
    return const ProfileNav._();
  }

  ProfileUserProfileNav goUserProfile(String id) {
    _Screens.graph.popTo(_Screens.profile);
    _Screens.graph.go(_Screens.userProfile, id, true);
    return const ProfileUserProfileNav._();
  }

  FollowersNav goFollowers(String id) {
    _Screens.graph.popTo(_Screens.profile);
    _Screens.graph.go(_Screens.followers, id, true);
    return const FollowersNav._();
  }

  FollowingNav goFollowing(String id) {
    _Screens.graph.popTo(_Screens.profile);
    _Screens.graph.go(_Screens.following, id, true);
    return const FollowingNav._();
  }

  EditProfileNav goEditProfile() {
    _Screens.graph.popTo(_Screens.profile);
    _Screens.graph.go(_Screens.editProfile, null, true);
    return const EditProfileNav._();
  }

  AchievementsNav goAchievements() {
    _Screens.graph.popTo(_Screens.profile);
    _Screens.graph.go(_Screens.achievements, null, true);
    return const AchievementsNav._();
  }

  BadgesNav goBadges() {
    _Screens.graph.popTo(_Screens.profile);
    _Screens.graph.go(_Screens.badges, null, true);
    return const BadgesNav._();
  }

  SavedPostsNav goSavedPosts() {
    _Screens.graph.popTo(_Screens.profile);
    _Screens.graph.go(_Screens.savedPosts, null, true);
    return const SavedPostsNav._();
  }

  DraftsNav goDrafts() {
    _Screens.graph.popTo(_Screens.profile);
    _Screens.graph.go(_Screens.drafts, null, true);
    return const DraftsNav._();
  }

  MyListingsNav goMyListings() {
    _Screens.graph.popTo(_Screens.profile);
    _Screens.graph.go(_Screens.myListings, null, true);
    return const MyListingsNav._();
  }

  BadgeNav goBadge(String id) {
    _Screens.graph.go(_Screens.badges, null, true);
    _Screens.graph.go(_Screens.badge, id, true);
    return const BadgeNav._();
  }

  N go<N extends AnyNav>(ProfileHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }
}

final class ProfileHop<N extends AnyNav> {
  const ProfileHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static ProfileHop<ProfileUserProfileNav> userProfile(String id) =>
      ProfileHop._(_Screens.userProfile, id, const ProfileUserProfileNav._());
  static ProfileHop<FollowersNav> followers(String id) =>
      ProfileHop._(_Screens.followers, id, const FollowersNav._());
  static ProfileHop<FollowingNav> following(String id) =>
      ProfileHop._(_Screens.following, id, const FollowingNav._());
  static const editProfile = ProfileHop<EditProfileNav>._(
    _Screens.editProfile,
    null,
    EditProfileNav._(),
  );
  static const achievements = ProfileHop<AchievementsNav>._(
    _Screens.achievements,
    null,
    AchievementsNav._(),
  );
  static const badges = ProfileHop<BadgesNav>._(
    _Screens.badges,
    null,
    BadgesNav._(),
  );
  static const savedPosts = ProfileHop<SavedPostsNav>._(
    _Screens.savedPosts,
    null,
    SavedPostsNav._(),
  );
  static const drafts = ProfileHop<DraftsNav>._(
    _Screens.drafts,
    null,
    DraftsNav._(),
  );
  static const myListings = ProfileHop<MyListingsNav>._(
    _Screens.myListings,
    null,
    MyListingsNav._(),
  );
}

UserProfilePlacement _resolveUserProfilePlacement(List<Enum> c) {
  if (_chainIs(c, const [_Screens.home, _Screens.feed, _Screens.userProfile]))
    return const HomeFeedUserProfileNav._();
  if (_chainIs(c, const [
    _Screens.discover,
    _Screens.trending,
    _Screens.userProfile,
  ]))
    return const DiscoverTrendingUserProfileNav._();
  if (_chainIs(c, const [
    _Screens.messages,
    _Screens.chats,
    _Screens.chat,
    _Screens.userProfile,
  ]))
    return const MessagesChatsChatUserProfileNav._();
  if (_chainIs(c, const [_Screens.profile, _Screens.userProfile]))
    return const ProfileUserProfileNav._();
  if (_chainIs(c, const [
    _Screens.workspace,
    _Screens.project,
    _Screens.userProfile,
  ]))
    return const WorkspaceProjectUserProfileNav._();
  if (_chainIs(c, const [
    _Screens.forum,
    _Screens.forumCategory,
    _Screens.forumThread,
    _Screens.forumReply,
    _Screens.userProfile,
  ]))
    return const ForumForumCategoryForumThreadForumReplyUserProfileNav._();
  throw StateError('unresolved userProfile placement: $c');
}

sealed class UserProfilePlacement implements AnyPlacement {
  UserProfilePlacement surface();
}

final class HomeFeedUserProfileNav extends AnyPlacement
    implements UserProfilePlacement {
  const HomeFeedUserProfileNav._() : super._();
  HomeFeedUserProfileNav surface() {
    _Screens.graph.popTo(_Screens.userProfile);
    return const HomeFeedUserProfileNav._();
  }

  FeedNav pop() {
    _Screens.graph.pop();
    return const FeedNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(HomeFeedUserProfilePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HomeFeedUserProfilePop<N extends AnyNav> {
  const HomeFeedUserProfilePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const feed = HomeFeedUserProfilePop<FeedNav>._(
    _Screens.feed,
    FeedNav._(),
  );
  static const home = HomeFeedUserProfilePop<HomeNav>._(
    _Screens.home,
    HomeNav._(),
  );
}

final class DiscoverTrendingUserProfileNav extends AnyPlacement
    implements UserProfilePlacement {
  const DiscoverTrendingUserProfileNav._() : super._();
  DiscoverTrendingUserProfileNav surface() {
    _Screens.graph.popTo(_Screens.userProfile);
    return const DiscoverTrendingUserProfileNav._();
  }

  TrendingNav pop() {
    _Screens.graph.pop();
    return const TrendingNav._();
  }

  DiscoverNav popToDiscover() {
    _Screens.graph.pop(_Screens.discover);
    return const DiscoverNav._();
  }

  N popTo<N extends AnyNav>(DiscoverTrendingUserProfilePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class DiscoverTrendingUserProfilePop<N extends AnyNav> {
  const DiscoverTrendingUserProfilePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const trending = DiscoverTrendingUserProfilePop<TrendingNav>._(
    _Screens.trending,
    TrendingNav._(),
  );
  static const discover = DiscoverTrendingUserProfilePop<DiscoverNav>._(
    _Screens.discover,
    DiscoverNav._(),
  );
}

final class MessagesChatsChatUserProfileNav extends AnyPlacement
    implements UserProfilePlacement {
  const MessagesChatsChatUserProfileNav._() : super._();
  MessagesChatsChatUserProfileNav surface() {
    _Screens.graph.popTo(_Screens.userProfile);
    return const MessagesChatsChatUserProfileNav._();
  }

  ChatNav pop() {
    _Screens.graph.pop();
    return const ChatNav._();
  }

  ChatsNav popToChats() {
    _Screens.graph.pop(_Screens.chats);
    return const ChatsNav._();
  }

  MessagesNav popToMessages() {
    _Screens.graph.pop(_Screens.messages);
    return const MessagesNav._();
  }

  N popTo<N extends AnyNav>(MessagesChatsChatUserProfilePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class MessagesChatsChatUserProfilePop<N extends AnyNav> {
  const MessagesChatsChatUserProfilePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const chat = MessagesChatsChatUserProfilePop<ChatNav>._(
    _Screens.chat,
    ChatNav._(),
  );
  static const chats = MessagesChatsChatUserProfilePop<ChatsNav>._(
    _Screens.chats,
    ChatsNav._(),
  );
  static const messages = MessagesChatsChatUserProfilePop<MessagesNav>._(
    _Screens.messages,
    MessagesNav._(),
  );
}

final class ProfileUserProfileNav extends AnyPlacement
    implements UserProfilePlacement {
  const ProfileUserProfileNav._() : super._();
  ProfileUserProfileNav surface() {
    _Screens.graph.popTo(_Screens.userProfile);
    return const ProfileUserProfileNav._();
  }

  ProfileNav pop() {
    _Screens.graph.pop();
    return const ProfileNav._();
  }
}

final class WorkspaceProjectUserProfileNav extends AnyPlacement
    implements UserProfilePlacement {
  const WorkspaceProjectUserProfileNav._() : super._();
  WorkspaceProjectUserProfileNav surface() {
    _Screens.graph.popTo(_Screens.userProfile);
    return const WorkspaceProjectUserProfileNav._();
  }

  ProjectNav pop() {
    _Screens.graph.pop();
    return const ProjectNav._();
  }

  WorkspaceNav popToWorkspace() {
    _Screens.graph.pop(_Screens.workspace);
    return const WorkspaceNav._();
  }

  N popTo<N extends AnyNav>(WorkspaceProjectUserProfilePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class WorkspaceProjectUserProfilePop<N extends AnyNav> {
  const WorkspaceProjectUserProfilePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const project = WorkspaceProjectUserProfilePop<ProjectNav>._(
    _Screens.project,
    ProjectNav._(),
  );
  static const workspace = WorkspaceProjectUserProfilePop<WorkspaceNav>._(
    _Screens.workspace,
    WorkspaceNav._(),
  );
}

final class ForumForumCategoryForumThreadForumReplyUserProfileNav
    extends AnyPlacement
    implements UserProfilePlacement {
  const ForumForumCategoryForumThreadForumReplyUserProfileNav._() : super._();
  ForumForumCategoryForumThreadForumReplyUserProfileNav surface() {
    _Screens.graph.popTo(_Screens.userProfile);
    return const ForumForumCategoryForumThreadForumReplyUserProfileNav._();
  }

  ForumReplyNav pop() {
    _Screens.graph.pop();
    return const ForumReplyNav._();
  }

  ForumThreadNav popToForumThread() {
    _Screens.graph.pop(_Screens.forumThread);
    return const ForumThreadNav._();
  }

  ForumCategoryNav popToForumCategory() {
    _Screens.graph.pop(_Screens.forumCategory);
    return const ForumCategoryNav._();
  }

  ForumNav popToForum() {
    _Screens.graph.pop(_Screens.forum);
    return const ForumNav._();
  }

  N popTo<N extends AnyNav>(
    ForumForumCategoryForumThreadForumReplyUserProfilePop<N> to,
  ) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ForumForumCategoryForumThreadForumReplyUserProfilePop<
  N extends AnyNav
> {
  const ForumForumCategoryForumThreadForumReplyUserProfilePop._(
    this.spec,
    this.nav,
  );
  final Enum spec;
  final N? nav;
  static const forumReply =
      ForumForumCategoryForumThreadForumReplyUserProfilePop<ForumReplyNav>._(
        _Screens.forumReply,
        ForumReplyNav._(),
      );
  static const forumThread =
      ForumForumCategoryForumThreadForumReplyUserProfilePop<ForumThreadNav>._(
        _Screens.forumThread,
        ForumThreadNav._(),
      );
  static const forumCategory =
      ForumForumCategoryForumThreadForumReplyUserProfilePop<ForumCategoryNav>._(
        _Screens.forumCategory,
        ForumCategoryNav._(),
      );
  static const forum =
      ForumForumCategoryForumThreadForumReplyUserProfilePop<ForumNav>._(
        _Screens.forum,
        ForumNav._(),
      );
}

final class FollowersNav extends AnyPlacement
    implements ConnectionFollowersPopPlacement, PopDestPlacement {
  const FollowersNav._() : super._();
  FollowersNav surface() {
    _Screens.graph.popTo(_Screens.followers);
    return const FollowersNav._();
  }

  ConnectionNav goConnection(String id) {
    _Screens.graph.popTo(_Screens.followers);
    _Screens.graph.go(_Screens.connection, id, true);
    return const ConnectionNav._();
  }

  ProfileNav pop() {
    _Screens.graph.pop();
    return const ProfileNav._();
  }
}

final class FollowingNav extends AnyPlacement {
  const FollowingNav._() : super._();
  FollowingNav surface() {
    _Screens.graph.popTo(_Screens.following);
    return const FollowingNav._();
  }

  ProfileNav pop() {
    _Screens.graph.pop();
    return const ProfileNav._();
  }
}

final class ConnectionNav extends AnyPlacement
    implements ConnectionFollowersPopPlacement, PopDestPlacement {
  const ConnectionNav._() : super._();
  ConnectionNav surface() {
    _Screens.graph.popTo(_Screens.connection);
    return const ConnectionNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.connection);
  ConnectionNav goConnection(String id) {
    _Screens.graph.popTo(_Screens.connection);
    _Screens.graph.go(_Screens.connection, id, true);
    return const ConnectionNav._();
  }

  MutualConnectionsNav goMutualConnections() {
    _Screens.graph.popTo(_Screens.connection);
    _Screens.graph.go(_Screens.mutualConnections, null, true);
    return const MutualConnectionsNav._();
  }

  N go<N extends AnyNav>(ConnectionHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  ConnectionFollowersPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveConnectionFollowersPopPlacement();
  }

  ProfileNav popToProfile() {
    _Screens.graph.pop(_Screens.profile);
    return const ProfileNav._();
  }

  ConnectionNav popToConnection() {
    _Screens.graph.pop(_Screens.connection);
    return const ConnectionNav._();
  }

  N popTo<N extends AnyNav>(ConnectionPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ConnectionPop<N extends AnyNav> {
  const ConnectionPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const followers = ConnectionPop<FollowersNav>._(
    _Screens.followers,
    FollowersNav._(),
  );
  static const profile = ConnectionPop<ProfileNav>._(
    _Screens.profile,
    ProfileNav._(),
  );
  static const connection = ConnectionPop<ConnectionNav>._(
    _Screens.connection,
    ConnectionNav._(),
  );
}

final class ConnectionHop<N extends AnyNav> {
  const ConnectionHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static ConnectionHop<ConnectionNav> connection(String id) =>
      ConnectionHop._(_Screens.connection, id, const ConnectionNav._());
  static const mutualConnections = ConnectionHop<MutualConnectionsNav>._(
    _Screens.mutualConnections,
    null,
    MutualConnectionsNav._(),
  );
}

final class MutualConnectionsNav extends AnyPlacement {
  const MutualConnectionsNav._() : super._();
  MutualConnectionsNav surface() {
    _Screens.graph.popTo(_Screens.mutualConnections);
    return const MutualConnectionsNav._();
  }

  ConnectionNav pop() {
    _Screens.graph.pop();
    return const ConnectionNav._();
  }

  FollowersNav popToFollowers() {
    _Screens.graph.pop(_Screens.followers);
    return const FollowersNav._();
  }

  ProfileNav popToProfile() {
    _Screens.graph.pop(_Screens.profile);
    return const ProfileNav._();
  }

  N popTo<N extends AnyNav>(MutualConnectionsPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class MutualConnectionsPop<N extends AnyNav> {
  const MutualConnectionsPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const connection = MutualConnectionsPop<ConnectionNav>._(
    _Screens.connection,
    ConnectionNav._(),
  );
  static const followers = MutualConnectionsPop<FollowersNav>._(
    _Screens.followers,
    FollowersNav._(),
  );
  static const profile = MutualConnectionsPop<ProfileNav>._(
    _Screens.profile,
    ProfileNav._(),
  );
}

final class EditProfileNav extends AnyPlacement {
  const EditProfileNav._() : super._();
  EditProfileNav surface() {
    _Screens.graph.popTo(_Screens.editProfile);
    return const EditProfileNav._();
  }

  ProfileNav pop() {
    _Screens.graph.pop();
    return const ProfileNav._();
  }
}

final class AchievementsNav extends AnyPlacement {
  const AchievementsNav._() : super._();
  AchievementsNav surface() {
    _Screens.graph.popTo(_Screens.achievements);
    return const AchievementsNav._();
  }

  ProfileNav pop() {
    _Screens.graph.pop();
    return const ProfileNav._();
  }
}

final class BadgesNav extends AnyPlacement
    implements BadgeBadgesPopPlacement, PopDestPlacement {
  const BadgesNav._() : super._();
  BadgesNav surface() {
    _Screens.graph.popTo(_Screens.badges);
    return const BadgesNav._();
  }

  BadgeNav goBadge(String id) {
    _Screens.graph.popTo(_Screens.badges);
    _Screens.graph.go(_Screens.badge, id, true);
    return const BadgeNav._();
  }

  ProfileNav pop() {
    _Screens.graph.pop();
    return const ProfileNav._();
  }
}

final class BadgeNav extends AnyPlacement
    implements BadgeBadgesPopPlacement, PopDestPlacement {
  const BadgeNav._() : super._();
  BadgeNav surface() {
    _Screens.graph.popTo(_Screens.badge);
    return const BadgeNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.badge);
  BadgeNav goBadge(String id) {
    _Screens.graph.popTo(_Screens.badge);
    _Screens.graph.go(_Screens.badge, id, true);
    return const BadgeNav._();
  }

  BadgeBadgesPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveBadgeBadgesPopPlacement();
  }

  ProfileNav popToProfile() {
    _Screens.graph.pop(_Screens.profile);
    return const ProfileNav._();
  }

  BadgeNav popToBadge() {
    _Screens.graph.pop(_Screens.badge);
    return const BadgeNav._();
  }

  N popTo<N extends AnyNav>(BadgePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class BadgePop<N extends AnyNav> {
  const BadgePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const badges = BadgePop<BadgesNav>._(_Screens.badges, BadgesNav._());
  static const profile = BadgePop<ProfileNav>._(
    _Screens.profile,
    ProfileNav._(),
  );
  static const badge = BadgePop<BadgeNav>._(_Screens.badge, BadgeNav._());
}

final class SavedPostsNav extends AnyPlacement {
  const SavedPostsNav._() : super._();
  SavedPostsNav surface() {
    _Screens.graph.popTo(_Screens.savedPosts);
    return const SavedPostsNav._();
  }

  ProfileNav pop() {
    _Screens.graph.pop();
    return const ProfileNav._();
  }
}

final class DraftsNav extends AnyPlacement {
  const DraftsNav._() : super._();
  DraftsNav surface() {
    _Screens.graph.popTo(_Screens.drafts);
    return const DraftsNav._();
  }

  ProfileNav pop() {
    _Screens.graph.pop();
    return const ProfileNav._();
  }
}

final class MyListingsNav extends AnyPlacement {
  const MyListingsNav._() : super._();
  MyListingsNav surface() {
    _Screens.graph.popTo(_Screens.myListings);
    return const MyListingsNav._();
  }

  ProfileNav pop() {
    _Screens.graph.pop();
    return const ProfileNav._();
  }
}

final class NotificationsNav extends AnyPlacement implements PopDestPlacement {
  const NotificationsNav._() : super._();
  NotificationsNav surface() {
    _Screens.graph.popTo(_Screens.notifications);
    return const NotificationsNav._();
  }

  NotificationSettingsNav goNotificationSettings() {
    _Screens.graph.popTo(_Screens.notifications);
    _Screens.graph.go(_Screens.notificationSettings, null, true);
    return const NotificationSettingsNav._();
  }
}

final class NotificationSettingsNav extends AnyPlacement {
  const NotificationSettingsNav._() : super._();
  NotificationSettingsNav surface() {
    _Screens.graph.popTo(_Screens.notificationSettings);
    return const NotificationSettingsNav._();
  }

  NotificationsNav pop() {
    _Screens.graph.pop();
    return const NotificationsNav._();
  }
}

final class SearchNav extends AnyPlacement
    implements SearchView, PopDestPlacement {
  const SearchNav._() : super._();
  SearchNav surface() {
    _Screens.graph.popTo(_Screens.search);
    return const SearchNav._();
  }

  SearchQueryMut get query => const SearchQueryMut._();
  SearchFragmentMut get fragment => const SearchFragmentMut._();
  SearchResultsNav goSearchResults() {
    _Screens.graph.popTo(_Screens.search);
    _Screens.graph.go(_Screens.searchResults, null, true);
    return const SearchResultsNav._();
  }
}

final class SearchResultsNav extends AnyPlacement {
  const SearchResultsNav._() : super._();
  SearchResultsNav surface() {
    _Screens.graph.popTo(_Screens.searchResults);
    return const SearchResultsNav._();
  }

  SearchNav pop() {
    _Screens.graph.pop();
    return const SearchNav._();
  }
}

final class SettingsNav extends AnyPlacement implements PopDestPlacement {
  const SettingsNav._() : super._();
  SettingsNav surface() {
    _Screens.graph.popTo(_Screens.settings);
    return const SettingsNav._();
  }

  AccountSettingsNav goAccountSettings() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(_Screens.accountSettings, null, true);
    return const AccountSettingsNav._();
  }

  SecurityNav goSecurity() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(_Screens.security, null, true);
    return const SecurityNav._();
  }

  PrivacyNav goPrivacy() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(_Screens.privacy, null, true);
    return const PrivacyNav._();
  }

  AppearanceNav goAppearance() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(_Screens.appearance, null, true);
    return const AppearanceNav._();
  }

  LanguageNav goLanguage() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(_Screens.language, null, true);
    return const LanguageNav._();
  }

  ConnectedAppsNav goConnectedApps() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(_Screens.connectedApps, null, true);
    return const ConnectedAppsNav._();
  }

  AboutNav goAbout() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(_Screens.about, null, true);
    return const AboutNav._();
  }

  BlockedUsersNav goBlockedUsers() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(_Screens.blockedUsers, null, true);
    return const BlockedUsersNav._();
  }

  DevicesNav goDevices() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(_Screens.devices, null, true);
    return const DevicesNav._();
  }

  DataExportNav goDataExport() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(_Screens.dataExport, null, true);
    return const DataExportNav._();
  }

  DeleteAccountNav goDeleteAccount() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(_Screens.deleteAccount, null, true);
    return const DeleteAccountNav._();
  }

  IntegrationsNav goIntegrations() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(_Screens.integrations, null, true);
    return const IntegrationsNav._();
  }

  SupportNav goSupport() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(Support.support, null, true);
    return const SupportNav._();
  }

  AdminNav goAdmin() {
    _Screens.graph.popTo(_Screens.settings);
    _Screens.graph.go(Admin.admin, null, true);
    return const AdminNav._();
  }

  HelpCategoryNav goHelpCategory(String id) {
    _Screens.graph.go(_Screens.about, null, true);
    _Screens.graph.go(_Screens.help, null, true);
    _Screens.graph.go(_Screens.helpCategory, id, true);
    return const HelpCategoryNav._();
  }

  DeviceNav goDevice(String id) {
    _Screens.graph.go(_Screens.devices, null, true);
    _Screens.graph.go(_Screens.device, id, true);
    return const DeviceNav._();
  }

  SupportTicketNav goSupportTicket(String id) {
    _Screens.graph.go(Support.support, null, true);
    _Screens.graph.go(Support.supportTickets, null, true);
    _Screens.graph.go(Support.supportTicket, id, true);
    return const SupportTicketNav._();
  }

  ArticleNav goArticle(String id) {
    _Screens.graph.go(Support.support, null, true);
    _Screens.graph.go(Support.knowledgeBase, null, true);
    _Screens.graph.go(Support.article, id, true);
    return const ArticleNav._();
  }

  AdminUserNav goAdminUser(String id) {
    _Screens.graph.go(Admin.admin, null, true);
    _Screens.graph.go(Admin.adminUsers, null, true);
    _Screens.graph.go(Admin.adminUser, id, true);
    return const AdminUserNav._();
  }

  WebhookNav goWebhook(String id) {
    _Screens.graph.go(Admin.admin, null, true);
    _Screens.graph.go(Admin.webhooks, null, true);
    _Screens.graph.go(Admin.webhook, id, true);
    return const WebhookNav._();
  }

  N go<N extends AnyNav>(SettingsHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }
}

final class SettingsHop<N extends AnyNav> {
  const SettingsHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const accountSettings = SettingsHop<AccountSettingsNav>._(
    _Screens.accountSettings,
    null,
    AccountSettingsNav._(),
  );
  static const security = SettingsHop<SecurityNav>._(
    _Screens.security,
    null,
    SecurityNav._(),
  );
  static const privacy = SettingsHop<PrivacyNav>._(
    _Screens.privacy,
    null,
    PrivacyNav._(),
  );
  static const appearance = SettingsHop<AppearanceNav>._(
    _Screens.appearance,
    null,
    AppearanceNav._(),
  );
  static const language = SettingsHop<LanguageNav>._(
    _Screens.language,
    null,
    LanguageNav._(),
  );
  static const connectedApps = SettingsHop<ConnectedAppsNav>._(
    _Screens.connectedApps,
    null,
    ConnectedAppsNav._(),
  );
  static const about = SettingsHop<AboutNav>._(
    _Screens.about,
    null,
    AboutNav._(),
  );
  static const blockedUsers = SettingsHop<BlockedUsersNav>._(
    _Screens.blockedUsers,
    null,
    BlockedUsersNav._(),
  );
  static const devices = SettingsHop<DevicesNav>._(
    _Screens.devices,
    null,
    DevicesNav._(),
  );
  static const dataExport = SettingsHop<DataExportNav>._(
    _Screens.dataExport,
    null,
    DataExportNav._(),
  );
  static const deleteAccount = SettingsHop<DeleteAccountNav>._(
    _Screens.deleteAccount,
    null,
    DeleteAccountNav._(),
  );
  static const integrations = SettingsHop<IntegrationsNav>._(
    _Screens.integrations,
    null,
    IntegrationsNav._(),
  );
  static const support = SettingsHop<SupportNav>._(
    Support.support,
    null,
    SupportNav._(),
  );
  static const admin = SettingsHop<AdminNav>._(Admin.admin, null, AdminNav._());
}

final class AccountSettingsNav extends AnyPlacement {
  const AccountSettingsNav._() : super._();
  AccountSettingsNav surface() {
    _Screens.graph.popTo(_Screens.accountSettings);
    return const AccountSettingsNav._();
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class SecurityNav extends AnyPlacement implements PopDestPlacement {
  const SecurityNav._() : super._();
  SecurityNav surface() {
    _Screens.graph.popTo(_Screens.security);
    return const SecurityNav._();
  }

  TwoFactorSettingsNav goTwoFactorSettings() {
    _Screens.graph.popTo(_Screens.security);
    _Screens.graph.go(_Screens.twoFactorSettings, null, true);
    return const TwoFactorSettingsNav._();
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class TwoFactorSettingsNav extends AnyPlacement {
  const TwoFactorSettingsNav._() : super._();
  TwoFactorSettingsNav surface() {
    _Screens.graph.popTo(_Screens.twoFactorSettings);
    return const TwoFactorSettingsNav._();
  }

  SecurityNav pop() {
    _Screens.graph.pop();
    return const SecurityNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(TwoFactorSettingsPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class TwoFactorSettingsPop<N extends AnyNav> {
  const TwoFactorSettingsPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const security = TwoFactorSettingsPop<SecurityNav>._(
    _Screens.security,
    SecurityNav._(),
  );
  static const settings = TwoFactorSettingsPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class PrivacyNav extends AnyPlacement {
  const PrivacyNav._() : super._();
  PrivacyNav surface() {
    _Screens.graph.popTo(_Screens.privacy);
    return const PrivacyNav._();
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class AppearanceNav extends AnyPlacement {
  const AppearanceNav._() : super._();
  AppearanceNav surface() {
    _Screens.graph.popTo(_Screens.appearance);
    return const AppearanceNav._();
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class LanguageNav extends AnyPlacement {
  const LanguageNav._() : super._();
  LanguageNav surface() {
    _Screens.graph.popTo(_Screens.language);
    return const LanguageNav._();
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class ConnectedAppsNav extends AnyPlacement {
  const ConnectedAppsNav._() : super._();
  ConnectedAppsNav surface() {
    _Screens.graph.popTo(_Screens.connectedApps);
    return const ConnectedAppsNav._();
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class AboutNav extends AnyPlacement implements PopDestPlacement {
  const AboutNav._() : super._();
  AboutNav surface() {
    _Screens.graph.popTo(_Screens.about);
    return const AboutNav._();
  }

  HelpNav goHelp() {
    _Screens.graph.popTo(_Screens.about);
    _Screens.graph.go(_Screens.help, null, true);
    return const HelpNav._();
  }

  FeedbackNav goFeedback() {
    _Screens.graph.popTo(_Screens.about);
    _Screens.graph.go(_Screens.feedback, null, true);
    return const FeedbackNav._();
  }

  HelpCategoryNav goHelpCategory(String id) {
    _Screens.graph.go(_Screens.help, null, true);
    _Screens.graph.go(_Screens.helpCategory, id, true);
    return const HelpCategoryNav._();
  }

  N go<N extends AnyNav>(AboutHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class AboutHop<N extends AnyNav> {
  const AboutHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const help = AboutHop<HelpNav>._(_Screens.help, null, HelpNav._());
  static const feedback = AboutHop<FeedbackNav>._(
    _Screens.feedback,
    null,
    FeedbackNav._(),
  );
}

final class HelpNav extends AnyPlacement implements PopDestPlacement {
  const HelpNav._() : super._();
  HelpNav surface() {
    _Screens.graph.popTo(_Screens.help);
    return const HelpNav._();
  }

  HelpCategoryNav goHelpCategory(String id) {
    _Screens.graph.popTo(_Screens.help);
    _Screens.graph.go(_Screens.helpCategory, id, true);
    return const HelpCategoryNav._();
  }

  AboutNav pop() {
    _Screens.graph.pop();
    return const AboutNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(HelpPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HelpPop<N extends AnyNav> {
  const HelpPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const about = HelpPop<AboutNav>._(_Screens.about, AboutNav._());
  static const settings = HelpPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class HelpCategoryNav extends AnyPlacement implements PopDestPlacement {
  const HelpCategoryNav._() : super._();
  HelpCategoryNav surface() {
    _Screens.graph.popTo(_Screens.helpCategory);
    return const HelpCategoryNav._();
  }

  FaqNav goFaq() {
    _Screens.graph.popTo(_Screens.helpCategory);
    _Screens.graph.go(_Screens.faq, null, true);
    return const FaqNav._();
  }

  FaqArticleNav goFaqArticle(String id) {
    _Screens.graph.go(_Screens.faq, null, true);
    _Screens.graph.go(_Screens.faqArticle, id, true);
    return const FaqArticleNav._();
  }

  HelpNav pop() {
    _Screens.graph.pop();
    return const HelpNav._();
  }

  AboutNav popToAbout() {
    _Screens.graph.pop(_Screens.about);
    return const AboutNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(HelpCategoryPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class HelpCategoryPop<N extends AnyNav> {
  const HelpCategoryPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const help = HelpCategoryPop<HelpNav>._(_Screens.help, HelpNav._());
  static const about = HelpCategoryPop<AboutNav>._(
    _Screens.about,
    AboutNav._(),
  );
  static const settings = HelpCategoryPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class FaqNav extends AnyPlacement implements PopDestPlacement {
  const FaqNav._() : super._();
  FaqNav surface() {
    _Screens.graph.popTo(_Screens.faq);
    return const FaqNav._();
  }

  FaqArticleNav goFaqArticle(String id) {
    _Screens.graph.popTo(_Screens.faq);
    _Screens.graph.go(_Screens.faqArticle, id, true);
    return const FaqArticleNav._();
  }

  HelpCategoryNav pop() {
    _Screens.graph.pop();
    return const HelpCategoryNav._();
  }

  HelpNav popToHelp() {
    _Screens.graph.pop(_Screens.help);
    return const HelpNav._();
  }

  AboutNav popToAbout() {
    _Screens.graph.pop(_Screens.about);
    return const AboutNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(FaqPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class FaqPop<N extends AnyNav> {
  const FaqPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const helpCategory = FaqPop<HelpCategoryNav>._(
    _Screens.helpCategory,
    HelpCategoryNav._(),
  );
  static const help = FaqPop<HelpNav>._(_Screens.help, HelpNav._());
  static const about = FaqPop<AboutNav>._(_Screens.about, AboutNav._());
  static const settings = FaqPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class FaqArticleNav extends AnyPlacement {
  const FaqArticleNav._() : super._();
  FaqArticleNav surface() {
    _Screens.graph.popTo(_Screens.faqArticle);
    return const FaqArticleNav._();
  }

  FaqNav pop() {
    _Screens.graph.pop();
    return const FaqNav._();
  }

  HelpCategoryNav popToHelpCategory() {
    _Screens.graph.pop(_Screens.helpCategory);
    return const HelpCategoryNav._();
  }

  HelpNav popToHelp() {
    _Screens.graph.pop(_Screens.help);
    return const HelpNav._();
  }

  AboutNav popToAbout() {
    _Screens.graph.pop(_Screens.about);
    return const AboutNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(FaqArticlePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class FaqArticlePop<N extends AnyNav> {
  const FaqArticlePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const faq = FaqArticlePop<FaqNav>._(_Screens.faq, FaqNav._());
  static const helpCategory = FaqArticlePop<HelpCategoryNav>._(
    _Screens.helpCategory,
    HelpCategoryNav._(),
  );
  static const help = FaqArticlePop<HelpNav>._(_Screens.help, HelpNav._());
  static const about = FaqArticlePop<AboutNav>._(_Screens.about, AboutNav._());
  static const settings = FaqArticlePop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class FeedbackNav extends AnyPlacement {
  const FeedbackNav._() : super._();
  FeedbackNav surface() {
    _Screens.graph.popTo(_Screens.feedback);
    return const FeedbackNav._();
  }

  AboutNav pop() {
    _Screens.graph.pop();
    return const AboutNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(FeedbackPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class FeedbackPop<N extends AnyNav> {
  const FeedbackPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const about = FeedbackPop<AboutNav>._(_Screens.about, AboutNav._());
  static const settings = FeedbackPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class BlockedUsersNav extends AnyPlacement {
  const BlockedUsersNav._() : super._();
  BlockedUsersNav surface() {
    _Screens.graph.popTo(_Screens.blockedUsers);
    return const BlockedUsersNav._();
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class DevicesNav extends AnyPlacement implements PopDestPlacement {
  const DevicesNav._() : super._();
  DevicesNav surface() {
    _Screens.graph.popTo(_Screens.devices);
    return const DevicesNav._();
  }

  DeviceNav goDevice(String id) {
    _Screens.graph.popTo(_Screens.devices);
    _Screens.graph.go(_Screens.device, id, true);
    return const DeviceNav._();
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class DeviceNav extends AnyPlacement
    implements DeviceSessionPopPlacement, PopDestPlacement {
  const DeviceNav._() : super._();
  DeviceNav surface() {
    _Screens.graph.popTo(_Screens.device);
    return const DeviceNav._();
  }

  SessionsNav goSessions() {
    _Screens.graph.popTo(_Screens.device);
    _Screens.graph.go(_Screens.sessions, null, true);
    return const SessionsNav._();
  }

  SessionNav goSession(String id) {
    _Screens.graph.popTo(_Screens.device);
    _Screens.graph.go(_Screens.session, id, true);
    return const SessionNav._();
  }

  N go<N extends AnyNav>(DeviceHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  DevicesNav pop() {
    _Screens.graph.pop();
    return const DevicesNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(DevicePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class DevicePop<N extends AnyNav> {
  const DevicePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const devices = DevicePop<DevicesNav>._(
    _Screens.devices,
    DevicesNav._(),
  );
  static const settings = DevicePop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class DeviceHop<N extends AnyNav> {
  const DeviceHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const sessions = DeviceHop<SessionsNav>._(
    _Screens.sessions,
    null,
    SessionsNav._(),
  );
  static DeviceHop<SessionNav> session(String id) =>
      DeviceHop._(_Screens.session, id, const SessionNav._());
}

final class SessionsNav extends AnyPlacement {
  const SessionsNav._() : super._();
  SessionsNav surface() {
    _Screens.graph.popTo(_Screens.sessions);
    return const SessionsNav._();
  }

  DeviceNav pop() {
    _Screens.graph.pop();
    return const DeviceNav._();
  }

  DevicesNav popToDevices() {
    _Screens.graph.pop(_Screens.devices);
    return const DevicesNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(SessionsPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class SessionsPop<N extends AnyNav> {
  const SessionsPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const device = SessionsPop<DeviceNav>._(
    _Screens.device,
    DeviceNav._(),
  );
  static const devices = SessionsPop<DevicesNav>._(
    _Screens.devices,
    DevicesNav._(),
  );
  static const settings = SessionsPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class SessionNav extends AnyPlacement
    implements DeviceSessionPopPlacement, PopDestPlacement {
  const SessionNav._() : super._();
  SessionNav surface() {
    _Screens.graph.popTo(_Screens.session);
    return const SessionNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.session);
  SessionNav goSession(String id) {
    _Screens.graph.popTo(_Screens.session);
    _Screens.graph.go(_Screens.session, id, true);
    return const SessionNav._();
  }

  DeviceSessionPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveDeviceSessionPopPlacement();
  }

  DevicesNav popToDevices() {
    _Screens.graph.pop(_Screens.devices);
    return const DevicesNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  SessionNav popToSession() {
    _Screens.graph.pop(_Screens.session);
    return const SessionNav._();
  }

  N popTo<N extends AnyNav>(SessionPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class SessionPop<N extends AnyNav> {
  const SessionPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const device = SessionPop<DeviceNav>._(_Screens.device, DeviceNav._());
  static const devices = SessionPop<DevicesNav>._(
    _Screens.devices,
    DevicesNav._(),
  );
  static const settings = SessionPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
  static const session = SessionPop<SessionNav>._(
    _Screens.session,
    SessionNav._(),
  );
}

final class DataExportNav extends AnyPlacement {
  const DataExportNav._() : super._();
  DataExportNav surface() {
    _Screens.graph.popTo(_Screens.dataExport);
    return const DataExportNav._();
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class DeleteAccountNav extends AnyPlacement {
  const DeleteAccountNav._() : super._();
  DeleteAccountNav surface() {
    _Screens.graph.popTo(_Screens.deleteAccount);
    return const DeleteAccountNav._();
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class WorkspaceNav extends AnyPlacement
    implements WorkspaceView, PopDestPlacement {
  const WorkspaceNav._() : super._();
  WorkspaceNav surface() {
    _Screens.graph.popTo(_Screens.workspace);
    return const WorkspaceNav._();
  }

  WorkspaceQueryMut get query => const WorkspaceQueryMut._();
  ProjectNav goProject(String id) {
    _Screens.graph.popTo(_Screens.workspace);
    _Screens.graph.go(_Screens.project, id, true);
    return const ProjectNav._();
  }
}

final class ProjectNav extends AnyPlacement
    implements ProjectView, PopDestPlacement {
  const ProjectNav._() : super._();
  ProjectNav surface() {
    _Screens.graph.popTo(_Screens.project);
    return const ProjectNav._();
  }

  ProjectQueryMut get query => const ProjectQueryMut._();
  BoardNav goBoard(String id) {
    _Screens.graph.popTo(_Screens.project);
    _Screens.graph.go(_Screens.board, id, true);
    return const BoardNav._();
  }

  WorkspaceProjectUserProfileNav goUserProfile(String id) {
    _Screens.graph.popTo(_Screens.project);
    _Screens.graph.go(_Screens.userProfile, id, true);
    return const WorkspaceProjectUserProfileNav._();
  }

  N go<N extends AnyNav>(ProjectHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  WorkspaceNav pop() {
    _Screens.graph.pop();
    return const WorkspaceNav._();
  }
}

final class ProjectHop<N extends AnyNav> {
  const ProjectHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static ProjectHop<BoardNav> board(String id) =>
      ProjectHop._(_Screens.board, id, const BoardNav._());
  static ProjectHop<WorkspaceProjectUserProfileNav> userProfile(String id) =>
      ProjectHop._(
        _Screens.userProfile,
        id,
        const WorkspaceProjectUserProfileNav._(),
      );
}

final class BoardNav extends AnyPlacement
    implements BoardView, PopDestPlacement {
  const BoardNav._() : super._();
  BoardNav surface() {
    _Screens.graph.popTo(_Screens.board);
    return const BoardNav._();
  }

  BoardQueryMut get query => const BoardQueryMut._();
  TaskListNav goTaskList(String id) {
    _Screens.graph.popTo(_Screens.board);
    _Screens.graph.go(_Screens.taskList, id, true);
    return const TaskListNav._();
  }

  ProjectNav pop() {
    _Screens.graph.pop();
    return const ProjectNav._();
  }

  WorkspaceNav popToWorkspace() {
    _Screens.graph.pop(_Screens.workspace);
    return const WorkspaceNav._();
  }

  N popTo<N extends AnyNav>(BoardPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class BoardPop<N extends AnyNav> {
  const BoardPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const project = BoardPop<ProjectNav>._(
    _Screens.project,
    ProjectNav._(),
  );
  static const workspace = BoardPop<WorkspaceNav>._(
    _Screens.workspace,
    WorkspaceNav._(),
  );
}

final class TaskListNav extends AnyPlacement
    implements TaskListView, TaskTaskListPopPlacement, PopDestPlacement {
  const TaskListNav._() : super._();
  TaskListNav surface() {
    _Screens.graph.popTo(_Screens.taskList);
    return const TaskListNav._();
  }

  TaskListQueryMut get query => const TaskListQueryMut._();
  TaskNav goTask(String id) {
    _Screens.graph.popTo(_Screens.taskList);
    _Screens.graph.go(_Screens.task, id, true);
    return const TaskNav._();
  }

  MilestoneNav goMilestone(String id) {
    _Screens.graph.popTo(_Screens.taskList);
    _Screens.graph.go(_Screens.milestone, id, true);
    return const MilestoneNav._();
  }

  SprintNav goSprint(String id) {
    _Screens.graph.popTo(_Screens.taskList);
    _Screens.graph.go(_Screens.sprint, id, true);
    return const SprintNav._();
  }

  EditTaskNav goEditTask(String id) {
    _Screens.graph.go(_Screens.task, id, true);
    _Screens.graph.go(_Screens.editTask, id, true);
    return const EditTaskNav._();
  }

  TaskCommentNav goTaskComment(String id) {
    _Screens.graph.go(_Screens.task, id, true);
    _Screens.graph.go(_Screens.taskComment, id, true);
    return const TaskCommentNav._();
  }

  N go<N extends AnyNav>(TaskListHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  BoardNav pop() {
    _Screens.graph.pop();
    return const BoardNav._();
  }

  ProjectNav popToProject() {
    _Screens.graph.pop(_Screens.project);
    return const ProjectNav._();
  }

  WorkspaceNav popToWorkspace() {
    _Screens.graph.pop(_Screens.workspace);
    return const WorkspaceNav._();
  }

  N popTo<N extends AnyNav>(TaskListPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class TaskListPop<N extends AnyNav> {
  const TaskListPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const board = TaskListPop<BoardNav>._(_Screens.board, BoardNav._());
  static const project = TaskListPop<ProjectNav>._(
    _Screens.project,
    ProjectNav._(),
  );
  static const workspace = TaskListPop<WorkspaceNav>._(
    _Screens.workspace,
    WorkspaceNav._(),
  );
}

final class TaskListHop<N extends AnyNav> {
  const TaskListHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static TaskListHop<TaskNav> task(String id) =>
      TaskListHop._(_Screens.task, id, const TaskNav._());
  static TaskListHop<MilestoneNav> milestone(String id) =>
      TaskListHop._(_Screens.milestone, id, const MilestoneNav._());
  static TaskListHop<SprintNav> sprint(String id) =>
      TaskListHop._(_Screens.sprint, id, const SprintNav._());
}

final class TaskNav extends AnyPlacement
    implements
        TaskView,
        TaskTaskListPopPlacement,
        SubtaskTaskPopPlacement,
        PopDestPlacement {
  const TaskNav._() : super._();
  TaskNav surface() {
    _Screens.graph.popTo(_Screens.task);
    return const TaskNav._();
  }

  TaskQueryMut get query => const TaskQueryMut._();
  int get depth => _Screens.graph.countOf(_Screens.task);
  SubtaskNav goSubtask(String id) {
    _Screens.graph.popTo(_Screens.task);
    _Screens.graph.go(_Screens.subtask, id, true);
    return const SubtaskNav._();
  }

  EditTaskNav goEditTask() {
    _Screens.graph.popTo(_Screens.task);
    _Screens.graph.go(_Screens.editTask, _idOf(_Screens.task), true);
    return const EditTaskNav._();
  }

  TaskCommentNav goTaskComment() {
    _Screens.graph.popTo(_Screens.task);
    _Screens.graph.go(_Screens.taskComment, _idOf(_Screens.task), true);
    return const TaskCommentNav._();
  }

  AssigneeNav goAssignee(String id) {
    _Screens.graph.popTo(_Screens.task);
    _Screens.graph.go(_Screens.assignee, id, true);
    return const AssigneeNav._();
  }

  LabelNav goLabel(String id) {
    _Screens.graph.popTo(_Screens.task);
    _Screens.graph.go(_Screens.label, id, true);
    return const LabelNav._();
  }

  TaskNav goTask(String id) {
    _Screens.graph.popTo(_Screens.task);
    _Screens.graph.go(_Screens.task, id, true);
    return const TaskNav._();
  }

  N go<N extends AnyNav>(TaskHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  TaskTaskListPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveTaskTaskListPopPlacement();
  }

  BoardNav popToBoard() {
    _Screens.graph.pop(_Screens.board);
    return const BoardNav._();
  }

  ProjectNav popToProject() {
    _Screens.graph.pop(_Screens.project);
    return const ProjectNav._();
  }

  WorkspaceNav popToWorkspace() {
    _Screens.graph.pop(_Screens.workspace);
    return const WorkspaceNav._();
  }

  TaskNav popToTask() {
    _Screens.graph.pop(_Screens.task);
    return const TaskNav._();
  }

  N popTo<N extends AnyNav>(TaskPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class TaskPop<N extends AnyNav> {
  const TaskPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const taskList = TaskPop<TaskListNav>._(
    _Screens.taskList,
    TaskListNav._(),
  );
  static const board = TaskPop<BoardNav>._(_Screens.board, BoardNav._());
  static const project = TaskPop<ProjectNav>._(
    _Screens.project,
    ProjectNav._(),
  );
  static const workspace = TaskPop<WorkspaceNav>._(
    _Screens.workspace,
    WorkspaceNav._(),
  );
  static const task = TaskPop<TaskNav>._(_Screens.task, TaskNav._());
}

final class TaskHop<N extends AnyNav> {
  const TaskHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static TaskHop<SubtaskNav> subtask(String id) =>
      TaskHop._(_Screens.subtask, id, const SubtaskNav._());
  static TaskHop<AssigneeNav> assignee(String id) =>
      TaskHop._(_Screens.assignee, id, const AssigneeNav._());
  static TaskHop<LabelNav> label(String id) =>
      TaskHop._(_Screens.label, id, const LabelNav._());
  static TaskHop<TaskNav> task(String id) =>
      TaskHop._(_Screens.task, id, const TaskNav._());
}

final class SubtaskNav extends AnyPlacement
    implements
        SubtaskTaskPopPlacement,
        ChecklistItemSubtaskPopPlacement,
        PopDestPlacement {
  const SubtaskNav._() : super._();
  SubtaskNav surface() {
    _Screens.graph.popTo(_Screens.subtask);
    return const SubtaskNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.subtask);
  ChecklistItemNav goChecklistItem(String id) {
    _Screens.graph.popTo(_Screens.subtask);
    _Screens.graph.go(_Screens.checklistItem, id, true);
    return const ChecklistItemNav._();
  }

  SubtaskNav goSubtask(String id) {
    _Screens.graph.popTo(_Screens.subtask);
    _Screens.graph.go(_Screens.subtask, id, true);
    return const SubtaskNav._();
  }

  N go<N extends AnyNav>(SubtaskHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  SubtaskTaskPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveSubtaskTaskPopPlacement();
  }

  TaskListNav popToTaskList() {
    _Screens.graph.pop(_Screens.taskList);
    return const TaskListNav._();
  }

  BoardNav popToBoard() {
    _Screens.graph.pop(_Screens.board);
    return const BoardNav._();
  }

  ProjectNav popToProject() {
    _Screens.graph.pop(_Screens.project);
    return const ProjectNav._();
  }

  WorkspaceNav popToWorkspace() {
    _Screens.graph.pop(_Screens.workspace);
    return const WorkspaceNav._();
  }

  SubtaskNav popToSubtask() {
    _Screens.graph.pop(_Screens.subtask);
    return const SubtaskNav._();
  }

  N popTo<N extends AnyNav>(SubtaskPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class SubtaskPop<N extends AnyNav> {
  const SubtaskPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const task = SubtaskPop<TaskNav>._(_Screens.task, TaskNav._());
  static const taskList = SubtaskPop<TaskListNav>._(
    _Screens.taskList,
    TaskListNav._(),
  );
  static const board = SubtaskPop<BoardNav>._(_Screens.board, BoardNav._());
  static const project = SubtaskPop<ProjectNav>._(
    _Screens.project,
    ProjectNav._(),
  );
  static const workspace = SubtaskPop<WorkspaceNav>._(
    _Screens.workspace,
    WorkspaceNav._(),
  );
  static const subtask = SubtaskPop<SubtaskNav>._(
    _Screens.subtask,
    SubtaskNav._(),
  );
}

final class SubtaskHop<N extends AnyNav> {
  const SubtaskHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static SubtaskHop<ChecklistItemNav> checklistItem(String id) =>
      SubtaskHop._(_Screens.checklistItem, id, const ChecklistItemNav._());
  static SubtaskHop<SubtaskNav> subtask(String id) =>
      SubtaskHop._(_Screens.subtask, id, const SubtaskNav._());
}

final class ChecklistItemNav extends AnyPlacement
    implements ChecklistItemSubtaskPopPlacement, PopDestPlacement {
  const ChecklistItemNav._() : super._();
  ChecklistItemNav surface() {
    _Screens.graph.popTo(_Screens.checklistItem);
    return const ChecklistItemNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.checklistItem);
  ChecklistItemNav goChecklistItem(String id) {
    _Screens.graph.popTo(_Screens.checklistItem);
    _Screens.graph.go(_Screens.checklistItem, id, true);
    return const ChecklistItemNav._();
  }

  ChecklistItemSubtaskPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveChecklistItemSubtaskPopPlacement();
  }

  TaskNav popToTask() {
    _Screens.graph.pop(_Screens.task);
    return const TaskNav._();
  }

  TaskListNav popToTaskList() {
    _Screens.graph.pop(_Screens.taskList);
    return const TaskListNav._();
  }

  BoardNav popToBoard() {
    _Screens.graph.pop(_Screens.board);
    return const BoardNav._();
  }

  ProjectNav popToProject() {
    _Screens.graph.pop(_Screens.project);
    return const ProjectNav._();
  }

  WorkspaceNav popToWorkspace() {
    _Screens.graph.pop(_Screens.workspace);
    return const WorkspaceNav._();
  }

  ChecklistItemNav popToChecklistItem() {
    _Screens.graph.pop(_Screens.checklistItem);
    return const ChecklistItemNav._();
  }

  N popTo<N extends AnyNav>(ChecklistItemPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ChecklistItemPop<N extends AnyNav> {
  const ChecklistItemPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const subtask = ChecklistItemPop<SubtaskNav>._(
    _Screens.subtask,
    SubtaskNav._(),
  );
  static const task = ChecklistItemPop<TaskNav>._(_Screens.task, TaskNav._());
  static const taskList = ChecklistItemPop<TaskListNav>._(
    _Screens.taskList,
    TaskListNav._(),
  );
  static const board = ChecklistItemPop<BoardNav>._(
    _Screens.board,
    BoardNav._(),
  );
  static const project = ChecklistItemPop<ProjectNav>._(
    _Screens.project,
    ProjectNav._(),
  );
  static const workspace = ChecklistItemPop<WorkspaceNav>._(
    _Screens.workspace,
    WorkspaceNav._(),
  );
  static const checklistItem = ChecklistItemPop<ChecklistItemNav>._(
    _Screens.checklistItem,
    ChecklistItemNav._(),
  );
}

final class EditTaskNav extends AnyPlacement {
  const EditTaskNav._() : super._();
  EditTaskNav surface() {
    _Screens.graph.popTo(_Screens.editTask);
    return const EditTaskNav._();
  }

  TaskNav pop() {
    _Screens.graph.pop();
    return const TaskNav._();
  }

  TaskListNav popToTaskList() {
    _Screens.graph.pop(_Screens.taskList);
    return const TaskListNav._();
  }

  BoardNav popToBoard() {
    _Screens.graph.pop(_Screens.board);
    return const BoardNav._();
  }

  ProjectNav popToProject() {
    _Screens.graph.pop(_Screens.project);
    return const ProjectNav._();
  }

  WorkspaceNav popToWorkspace() {
    _Screens.graph.pop(_Screens.workspace);
    return const WorkspaceNav._();
  }

  N popTo<N extends AnyNav>(EditTaskPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class EditTaskPop<N extends AnyNav> {
  const EditTaskPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const task = EditTaskPop<TaskNav>._(_Screens.task, TaskNav._());
  static const taskList = EditTaskPop<TaskListNav>._(
    _Screens.taskList,
    TaskListNav._(),
  );
  static const board = EditTaskPop<BoardNav>._(_Screens.board, BoardNav._());
  static const project = EditTaskPop<ProjectNav>._(
    _Screens.project,
    ProjectNav._(),
  );
  static const workspace = EditTaskPop<WorkspaceNav>._(
    _Screens.workspace,
    WorkspaceNav._(),
  );
}

final class TaskCommentNav extends AnyPlacement {
  const TaskCommentNav._() : super._();
  TaskCommentNav surface() {
    _Screens.graph.popTo(_Screens.taskComment);
    return const TaskCommentNav._();
  }

  TaskNav pop() {
    _Screens.graph.pop();
    return const TaskNav._();
  }

  TaskListNav popToTaskList() {
    _Screens.graph.pop(_Screens.taskList);
    return const TaskListNav._();
  }

  BoardNav popToBoard() {
    _Screens.graph.pop(_Screens.board);
    return const BoardNav._();
  }

  ProjectNav popToProject() {
    _Screens.graph.pop(_Screens.project);
    return const ProjectNav._();
  }

  WorkspaceNav popToWorkspace() {
    _Screens.graph.pop(_Screens.workspace);
    return const WorkspaceNav._();
  }

  N popTo<N extends AnyNav>(TaskCommentPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class TaskCommentPop<N extends AnyNav> {
  const TaskCommentPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const task = TaskCommentPop<TaskNav>._(_Screens.task, TaskNav._());
  static const taskList = TaskCommentPop<TaskListNav>._(
    _Screens.taskList,
    TaskListNav._(),
  );
  static const board = TaskCommentPop<BoardNav>._(_Screens.board, BoardNav._());
  static const project = TaskCommentPop<ProjectNav>._(
    _Screens.project,
    ProjectNav._(),
  );
  static const workspace = TaskCommentPop<WorkspaceNav>._(
    _Screens.workspace,
    WorkspaceNav._(),
  );
}

final class AssigneeNav extends AnyPlacement {
  const AssigneeNav._() : super._();
  AssigneeNav surface() {
    _Screens.graph.popTo(_Screens.assignee);
    return const AssigneeNav._();
  }

  TaskNav pop() {
    _Screens.graph.pop();
    return const TaskNav._();
  }

  TaskListNav popToTaskList() {
    _Screens.graph.pop(_Screens.taskList);
    return const TaskListNav._();
  }

  BoardNav popToBoard() {
    _Screens.graph.pop(_Screens.board);
    return const BoardNav._();
  }

  ProjectNav popToProject() {
    _Screens.graph.pop(_Screens.project);
    return const ProjectNav._();
  }

  WorkspaceNav popToWorkspace() {
    _Screens.graph.pop(_Screens.workspace);
    return const WorkspaceNav._();
  }

  N popTo<N extends AnyNav>(AssigneePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AssigneePop<N extends AnyNav> {
  const AssigneePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const task = AssigneePop<TaskNav>._(_Screens.task, TaskNav._());
  static const taskList = AssigneePop<TaskListNav>._(
    _Screens.taskList,
    TaskListNav._(),
  );
  static const board = AssigneePop<BoardNav>._(_Screens.board, BoardNav._());
  static const project = AssigneePop<ProjectNav>._(
    _Screens.project,
    ProjectNav._(),
  );
  static const workspace = AssigneePop<WorkspaceNav>._(
    _Screens.workspace,
    WorkspaceNav._(),
  );
}

final class LabelNav extends AnyPlacement {
  const LabelNav._() : super._();
  LabelNav surface() {
    _Screens.graph.popTo(_Screens.label);
    return const LabelNav._();
  }

  TaskNav pop() {
    _Screens.graph.pop();
    return const TaskNav._();
  }

  TaskListNav popToTaskList() {
    _Screens.graph.pop(_Screens.taskList);
    return const TaskListNav._();
  }

  BoardNav popToBoard() {
    _Screens.graph.pop(_Screens.board);
    return const BoardNav._();
  }

  ProjectNav popToProject() {
    _Screens.graph.pop(_Screens.project);
    return const ProjectNav._();
  }

  WorkspaceNav popToWorkspace() {
    _Screens.graph.pop(_Screens.workspace);
    return const WorkspaceNav._();
  }

  N popTo<N extends AnyNav>(LabelPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class LabelPop<N extends AnyNav> {
  const LabelPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const task = LabelPop<TaskNav>._(_Screens.task, TaskNav._());
  static const taskList = LabelPop<TaskListNav>._(
    _Screens.taskList,
    TaskListNav._(),
  );
  static const board = LabelPop<BoardNav>._(_Screens.board, BoardNav._());
  static const project = LabelPop<ProjectNav>._(
    _Screens.project,
    ProjectNav._(),
  );
  static const workspace = LabelPop<WorkspaceNav>._(
    _Screens.workspace,
    WorkspaceNav._(),
  );
}

final class MilestoneNav extends AnyPlacement {
  const MilestoneNav._() : super._();
  MilestoneNav surface() {
    _Screens.graph.popTo(_Screens.milestone);
    return const MilestoneNav._();
  }

  TaskListNav pop() {
    _Screens.graph.pop();
    return const TaskListNav._();
  }

  BoardNav popToBoard() {
    _Screens.graph.pop(_Screens.board);
    return const BoardNav._();
  }

  ProjectNav popToProject() {
    _Screens.graph.pop(_Screens.project);
    return const ProjectNav._();
  }

  WorkspaceNav popToWorkspace() {
    _Screens.graph.pop(_Screens.workspace);
    return const WorkspaceNav._();
  }

  N popTo<N extends AnyNav>(MilestonePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class MilestonePop<N extends AnyNav> {
  const MilestonePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const taskList = MilestonePop<TaskListNav>._(
    _Screens.taskList,
    TaskListNav._(),
  );
  static const board = MilestonePop<BoardNav>._(_Screens.board, BoardNav._());
  static const project = MilestonePop<ProjectNav>._(
    _Screens.project,
    ProjectNav._(),
  );
  static const workspace = MilestonePop<WorkspaceNav>._(
    _Screens.workspace,
    WorkspaceNav._(),
  );
}

final class SprintNav extends AnyPlacement {
  const SprintNav._() : super._();
  SprintNav surface() {
    _Screens.graph.popTo(_Screens.sprint);
    return const SprintNav._();
  }

  TaskListNav pop() {
    _Screens.graph.pop();
    return const TaskListNav._();
  }

  BoardNav popToBoard() {
    _Screens.graph.pop(_Screens.board);
    return const BoardNav._();
  }

  ProjectNav popToProject() {
    _Screens.graph.pop(_Screens.project);
    return const ProjectNav._();
  }

  WorkspaceNav popToWorkspace() {
    _Screens.graph.pop(_Screens.workspace);
    return const WorkspaceNav._();
  }

  N popTo<N extends AnyNav>(SprintPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class SprintPop<N extends AnyNav> {
  const SprintPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const taskList = SprintPop<TaskListNav>._(
    _Screens.taskList,
    TaskListNav._(),
  );
  static const board = SprintPop<BoardNav>._(_Screens.board, BoardNav._());
  static const project = SprintPop<ProjectNav>._(
    _Screens.project,
    ProjectNav._(),
  );
  static const workspace = SprintPop<WorkspaceNav>._(
    _Screens.workspace,
    WorkspaceNav._(),
  );
}

final class ForumNav extends AnyPlacement implements PopDestPlacement {
  const ForumNav._() : super._();
  ForumNav surface() {
    _Screens.graph.popTo(_Screens.forum);
    return const ForumNav._();
  }

  ForumCategoryNav goForumCategory(String id) {
    _Screens.graph.popTo(_Screens.forum);
    _Screens.graph.go(_Screens.forumCategory, id, true);
    return const ForumCategoryNav._();
  }
}

final class ForumCategoryNav extends AnyPlacement
    implements
        ForumCategoryView,
        ForumCategoryForumThreadPopPlacement,
        PopDestPlacement {
  const ForumCategoryNav._() : super._();
  ForumCategoryNav surface() {
    _Screens.graph.popTo(_Screens.forumCategory);
    return const ForumCategoryNav._();
  }

  ForumCategoryQueryMut get query => const ForumCategoryQueryMut._();
  ForumThreadNav goForumThread(String id) {
    _Screens.graph.popTo(_Screens.forumCategory);
    _Screens.graph.go(_Screens.forumThread, id, true);
    return const ForumThreadNav._();
  }

  ReportThreadNav goReportThread(String id) {
    _Screens.graph.go(_Screens.forumThread, id, true);
    _Screens.graph.go(_Screens.reportThread, id, true);
    return const ReportThreadNav._();
  }

  ForumNav pop() {
    _Screens.graph.pop();
    return const ForumNav._();
  }
}

final class ForumThreadNav extends AnyPlacement
    implements
        ForumThreadView,
        ForumCategoryForumThreadPopPlacement,
        ForumReplyForumThreadPopPlacement,
        PopDestPlacement {
  const ForumThreadNav._() : super._();
  ForumThreadNav surface() {
    _Screens.graph.popTo(_Screens.forumThread);
    return const ForumThreadNav._();
  }

  ForumThreadQueryMut get query => const ForumThreadQueryMut._();
  int get depth => _Screens.graph.countOf(_Screens.forumThread);
  ForumReplyNav goForumReply(String id) {
    _Screens.graph.popTo(_Screens.forumThread);
    _Screens.graph.go(_Screens.forumReply, id, true);
    return const ForumReplyNav._();
  }

  ReportThreadNav goReportThread() {
    _Screens.graph.popTo(_Screens.forumThread);
    _Screens.graph.go(_Screens.reportThread, _idOf(_Screens.forumThread), true);
    return const ReportThreadNav._();
  }

  ForumThreadNav goForumThread(String id) {
    _Screens.graph.popTo(_Screens.forumThread);
    _Screens.graph.go(_Screens.forumThread, id, true);
    return const ForumThreadNav._();
  }

  N go<N extends AnyNav>(ForumThreadHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  ForumCategoryForumThreadPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveForumCategoryForumThreadPopPlacement();
  }

  ForumNav popToForum() {
    _Screens.graph.pop(_Screens.forum);
    return const ForumNav._();
  }

  ForumThreadNav popToForumThread() {
    _Screens.graph.pop(_Screens.forumThread);
    return const ForumThreadNav._();
  }

  N popTo<N extends AnyNav>(ForumThreadPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ForumThreadPop<N extends AnyNav> {
  const ForumThreadPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const forumCategory = ForumThreadPop<ForumCategoryNav>._(
    _Screens.forumCategory,
    ForumCategoryNav._(),
  );
  static const forum = ForumThreadPop<ForumNav>._(_Screens.forum, ForumNav._());
  static const forumThread = ForumThreadPop<ForumThreadNav>._(
    _Screens.forumThread,
    ForumThreadNav._(),
  );
}

final class ForumThreadHop<N extends AnyNav> {
  const ForumThreadHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static ForumThreadHop<ForumReplyNav> forumReply(String id) =>
      ForumThreadHop._(_Screens.forumReply, id, const ForumReplyNav._());
  static ForumThreadHop<ForumThreadNav> forumThread(String id) =>
      ForumThreadHop._(_Screens.forumThread, id, const ForumThreadNav._());
}

final class ForumReplyNav extends AnyPlacement
    implements ForumReplyForumThreadPopPlacement, PopDestPlacement {
  const ForumReplyNav._() : super._();
  ForumReplyNav surface() {
    _Screens.graph.popTo(_Screens.forumReply);
    return const ForumReplyNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.forumReply);
  ForumReplyNav goForumReply(String id) {
    _Screens.graph.popTo(_Screens.forumReply);
    _Screens.graph.go(_Screens.forumReply, id, true);
    return const ForumReplyNav._();
  }

  ForumForumCategoryForumThreadForumReplyUserProfileNav goUserProfile(
    String id,
  ) {
    _Screens.graph.popTo(_Screens.forumReply);
    _Screens.graph.go(_Screens.userProfile, id, true);
    return const ForumForumCategoryForumThreadForumReplyUserProfileNav._();
  }

  N go<N extends AnyNav>(ForumReplyHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  ForumReplyForumThreadPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveForumReplyForumThreadPopPlacement();
  }

  ForumCategoryNav popToForumCategory() {
    _Screens.graph.pop(_Screens.forumCategory);
    return const ForumCategoryNav._();
  }

  ForumNav popToForum() {
    _Screens.graph.pop(_Screens.forum);
    return const ForumNav._();
  }

  ForumReplyNav popToForumReply() {
    _Screens.graph.pop(_Screens.forumReply);
    return const ForumReplyNav._();
  }

  N popTo<N extends AnyNav>(ForumReplyPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ForumReplyPop<N extends AnyNav> {
  const ForumReplyPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const forumThread = ForumReplyPop<ForumThreadNav>._(
    _Screens.forumThread,
    ForumThreadNav._(),
  );
  static const forumCategory = ForumReplyPop<ForumCategoryNav>._(
    _Screens.forumCategory,
    ForumCategoryNav._(),
  );
  static const forum = ForumReplyPop<ForumNav>._(_Screens.forum, ForumNav._());
  static const forumReply = ForumReplyPop<ForumReplyNav>._(
    _Screens.forumReply,
    ForumReplyNav._(),
  );
}

final class ForumReplyHop<N extends AnyNav> {
  const ForumReplyHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static ForumReplyHop<ForumReplyNav> forumReply(String id) =>
      ForumReplyHop._(_Screens.forumReply, id, const ForumReplyNav._());
  static ForumReplyHop<ForumForumCategoryForumThreadForumReplyUserProfileNav>
  userProfile(String id) => ForumReplyHop._(
    _Screens.userProfile,
    id,
    const ForumForumCategoryForumThreadForumReplyUserProfileNav._(),
  );
}

final class ReportThreadNav extends AnyPlacement {
  const ReportThreadNav._() : super._();
  ReportThreadNav surface() {
    _Screens.graph.popTo(_Screens.reportThread);
    return const ReportThreadNav._();
  }

  ForumThreadNav pop() {
    _Screens.graph.pop();
    return const ForumThreadNav._();
  }

  ForumCategoryNav popToForumCategory() {
    _Screens.graph.pop(_Screens.forumCategory);
    return const ForumCategoryNav._();
  }

  ForumNav popToForum() {
    _Screens.graph.pop(_Screens.forum);
    return const ForumNav._();
  }

  N popTo<N extends AnyNav>(ReportThreadPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ReportThreadPop<N extends AnyNav> {
  const ReportThreadPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const forumThread = ReportThreadPop<ForumThreadNav>._(
    _Screens.forumThread,
    ForumThreadNav._(),
  );
  static const forumCategory = ReportThreadPop<ForumCategoryNav>._(
    _Screens.forumCategory,
    ForumCategoryNav._(),
  );
  static const forum = ReportThreadPop<ForumNav>._(
    _Screens.forum,
    ForumNav._(),
  );
}

final class LearnNav extends AnyPlacement implements PopDestPlacement {
  const LearnNav._() : super._();
  LearnNav surface() {
    _Screens.graph.popTo(_Screens.learn);
    return const LearnNav._();
  }

  CourseNav goCourse(String id) {
    _Screens.graph.popTo(_Screens.learn);
    _Screens.graph.go(_Screens.course, id, true);
    return const CourseNav._();
  }

  CertificateNav goCertificate(String id) {
    _Screens.graph.go(_Screens.course, id, true);
    _Screens.graph.go(_Screens.certificate, id, true);
    return const CertificateNav._();
  }
}

final class CourseNav extends AnyPlacement
    implements CourseView, PopDestPlacement {
  const CourseNav._() : super._();
  CourseNav surface() {
    _Screens.graph.popTo(_Screens.course);
    return const CourseNav._();
  }

  CourseQueryMut get query => const CourseQueryMut._();
  CourseModuleNav goCourseModule(String id) {
    _Screens.graph.popTo(_Screens.course);
    _Screens.graph.go(_Screens.courseModule, id, true);
    return const CourseModuleNav._();
  }

  CertificateNav goCertificate() {
    _Screens.graph.popTo(_Screens.course);
    _Screens.graph.go(_Screens.certificate, _idOf(_Screens.course), true);
    return const CertificateNav._();
  }

  LearnNav pop() {
    _Screens.graph.pop();
    return const LearnNav._();
  }
}

final class CourseModuleNav extends AnyPlacement implements PopDestPlacement {
  const CourseModuleNav._() : super._();
  CourseModuleNav surface() {
    _Screens.graph.popTo(_Screens.courseModule);
    return const CourseModuleNav._();
  }

  LessonNav goLesson(String id) {
    _Screens.graph.popTo(_Screens.courseModule);
    _Screens.graph.go(_Screens.lesson, id, true);
    return const LessonNav._();
  }

  InstructorNav goInstructor(String id) {
    _Screens.graph.popTo(_Screens.courseModule);
    _Screens.graph.go(_Screens.instructor, id, true);
    return const InstructorNav._();
  }

  N go<N extends AnyNav>(CourseModuleHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  CourseNav pop() {
    _Screens.graph.pop();
    return const CourseNav._();
  }

  LearnNav popToLearn() {
    _Screens.graph.pop(_Screens.learn);
    return const LearnNav._();
  }

  N popTo<N extends AnyNav>(CourseModulePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class CourseModulePop<N extends AnyNav> {
  const CourseModulePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const course = CourseModulePop<CourseNav>._(
    _Screens.course,
    CourseNav._(),
  );
  static const learn = CourseModulePop<LearnNav>._(
    _Screens.learn,
    LearnNav._(),
  );
}

final class CourseModuleHop<N extends AnyNav> {
  const CourseModuleHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static CourseModuleHop<LessonNav> lesson(String id) =>
      CourseModuleHop._(_Screens.lesson, id, const LessonNav._());
  static CourseModuleHop<InstructorNav> instructor(String id) =>
      CourseModuleHop._(_Screens.instructor, id, const InstructorNav._());
}

final class LessonNav extends AnyPlacement implements PopDestPlacement {
  const LessonNav._() : super._();
  LessonNav surface() {
    _Screens.graph.popTo(_Screens.lesson);
    return const LessonNav._();
  }

  QuizNav goQuiz(String id) {
    _Screens.graph.popTo(_Screens.lesson);
    _Screens.graph.go(_Screens.quiz, id, true);
    return const QuizNav._();
  }

  CourseReviewNav goCourseReview(String id) {
    _Screens.graph.popTo(_Screens.lesson);
    _Screens.graph.go(_Screens.courseReview, id, true);
    return const CourseReviewNav._();
  }

  N go<N extends AnyNav>(LessonHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  CourseModuleNav pop() {
    _Screens.graph.pop();
    return const CourseModuleNav._();
  }

  CourseNav popToCourse() {
    _Screens.graph.pop(_Screens.course);
    return const CourseNav._();
  }

  LearnNav popToLearn() {
    _Screens.graph.pop(_Screens.learn);
    return const LearnNav._();
  }

  N popTo<N extends AnyNav>(LessonPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class LessonPop<N extends AnyNav> {
  const LessonPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const courseModule = LessonPop<CourseModuleNav>._(
    _Screens.courseModule,
    CourseModuleNav._(),
  );
  static const course = LessonPop<CourseNav>._(_Screens.course, CourseNav._());
  static const learn = LessonPop<LearnNav>._(_Screens.learn, LearnNav._());
}

final class LessonHop<N extends AnyNav> {
  const LessonHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static LessonHop<QuizNav> quiz(String id) =>
      LessonHop._(_Screens.quiz, id, const QuizNav._());
  static LessonHop<CourseReviewNav> courseReview(String id) =>
      LessonHop._(_Screens.courseReview, id, const CourseReviewNav._());
}

final class QuizNav extends AnyPlacement
    implements QuestionQuizPopPlacement, PopDestPlacement {
  const QuizNav._() : super._();
  QuizNav surface() {
    _Screens.graph.popTo(_Screens.quiz);
    return const QuizNav._();
  }

  QuestionNav goQuestion(String id) {
    _Screens.graph.popTo(_Screens.quiz);
    _Screens.graph.go(_Screens.question, id, true);
    return const QuestionNav._();
  }

  AnswerNav goAnswer(String id) {
    _Screens.graph.go(_Screens.question, id, true);
    _Screens.graph.go(_Screens.answer, id, true);
    return const AnswerNav._();
  }

  LessonNav pop() {
    _Screens.graph.pop();
    return const LessonNav._();
  }

  CourseModuleNav popToCourseModule() {
    _Screens.graph.pop(_Screens.courseModule);
    return const CourseModuleNav._();
  }

  CourseNav popToCourse() {
    _Screens.graph.pop(_Screens.course);
    return const CourseNav._();
  }

  LearnNav popToLearn() {
    _Screens.graph.pop(_Screens.learn);
    return const LearnNav._();
  }

  N popTo<N extends AnyNav>(QuizPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class QuizPop<N extends AnyNav> {
  const QuizPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const lesson = QuizPop<LessonNav>._(_Screens.lesson, LessonNav._());
  static const courseModule = QuizPop<CourseModuleNav>._(
    _Screens.courseModule,
    CourseModuleNav._(),
  );
  static const course = QuizPop<CourseNav>._(_Screens.course, CourseNav._());
  static const learn = QuizPop<LearnNav>._(_Screens.learn, LearnNav._());
}

final class QuestionNav extends AnyPlacement
    implements QuestionQuizPopPlacement, PopDestPlacement {
  const QuestionNav._() : super._();
  QuestionNav surface() {
    _Screens.graph.popTo(_Screens.question);
    return const QuestionNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.question);
  QuestionNav goQuestion(String id) {
    _Screens.graph.popTo(_Screens.question);
    _Screens.graph.go(_Screens.question, id, true);
    return const QuestionNav._();
  }

  AnswerNav goAnswer() {
    _Screens.graph.popTo(_Screens.question);
    _Screens.graph.go(_Screens.answer, _idOf(_Screens.question), true);
    return const AnswerNav._();
  }

  QuestionQuizPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveQuestionQuizPopPlacement();
  }

  LessonNav popToLesson() {
    _Screens.graph.pop(_Screens.lesson);
    return const LessonNav._();
  }

  CourseModuleNav popToCourseModule() {
    _Screens.graph.pop(_Screens.courseModule);
    return const CourseModuleNav._();
  }

  CourseNav popToCourse() {
    _Screens.graph.pop(_Screens.course);
    return const CourseNav._();
  }

  LearnNav popToLearn() {
    _Screens.graph.pop(_Screens.learn);
    return const LearnNav._();
  }

  QuestionNav popToQuestion() {
    _Screens.graph.pop(_Screens.question);
    return const QuestionNav._();
  }

  N popTo<N extends AnyNav>(QuestionPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class QuestionPop<N extends AnyNav> {
  const QuestionPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const quiz = QuestionPop<QuizNav>._(_Screens.quiz, QuizNav._());
  static const lesson = QuestionPop<LessonNav>._(
    _Screens.lesson,
    LessonNav._(),
  );
  static const courseModule = QuestionPop<CourseModuleNav>._(
    _Screens.courseModule,
    CourseModuleNav._(),
  );
  static const course = QuestionPop<CourseNav>._(
    _Screens.course,
    CourseNav._(),
  );
  static const learn = QuestionPop<LearnNav>._(_Screens.learn, LearnNav._());
  static const question = QuestionPop<QuestionNav>._(
    _Screens.question,
    QuestionNav._(),
  );
}

final class AnswerNav extends AnyPlacement {
  const AnswerNav._() : super._();
  AnswerNav surface() {
    _Screens.graph.popTo(_Screens.answer);
    return const AnswerNav._();
  }

  QuestionNav pop() {
    _Screens.graph.pop();
    return const QuestionNav._();
  }

  QuizNav popToQuiz() {
    _Screens.graph.pop(_Screens.quiz);
    return const QuizNav._();
  }

  LessonNav popToLesson() {
    _Screens.graph.pop(_Screens.lesson);
    return const LessonNav._();
  }

  CourseModuleNav popToCourseModule() {
    _Screens.graph.pop(_Screens.courseModule);
    return const CourseModuleNav._();
  }

  CourseNav popToCourse() {
    _Screens.graph.pop(_Screens.course);
    return const CourseNav._();
  }

  LearnNav popToLearn() {
    _Screens.graph.pop(_Screens.learn);
    return const LearnNav._();
  }

  N popTo<N extends AnyNav>(AnswerPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AnswerPop<N extends AnyNav> {
  const AnswerPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const question = AnswerPop<QuestionNav>._(
    _Screens.question,
    QuestionNav._(),
  );
  static const quiz = AnswerPop<QuizNav>._(_Screens.quiz, QuizNav._());
  static const lesson = AnswerPop<LessonNav>._(_Screens.lesson, LessonNav._());
  static const courseModule = AnswerPop<CourseModuleNav>._(
    _Screens.courseModule,
    CourseModuleNav._(),
  );
  static const course = AnswerPop<CourseNav>._(_Screens.course, CourseNav._());
  static const learn = AnswerPop<LearnNav>._(_Screens.learn, LearnNav._());
}

final class CourseReviewNav extends AnyPlacement {
  const CourseReviewNav._() : super._();
  CourseReviewNav surface() {
    _Screens.graph.popTo(_Screens.courseReview);
    return const CourseReviewNav._();
  }

  LessonNav pop() {
    _Screens.graph.pop();
    return const LessonNav._();
  }

  CourseModuleNav popToCourseModule() {
    _Screens.graph.pop(_Screens.courseModule);
    return const CourseModuleNav._();
  }

  CourseNav popToCourse() {
    _Screens.graph.pop(_Screens.course);
    return const CourseNav._();
  }

  LearnNav popToLearn() {
    _Screens.graph.pop(_Screens.learn);
    return const LearnNav._();
  }

  N popTo<N extends AnyNav>(CourseReviewPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class CourseReviewPop<N extends AnyNav> {
  const CourseReviewPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const lesson = CourseReviewPop<LessonNav>._(
    _Screens.lesson,
    LessonNav._(),
  );
  static const courseModule = CourseReviewPop<CourseModuleNav>._(
    _Screens.courseModule,
    CourseModuleNav._(),
  );
  static const course = CourseReviewPop<CourseNav>._(
    _Screens.course,
    CourseNav._(),
  );
  static const learn = CourseReviewPop<LearnNav>._(
    _Screens.learn,
    LearnNav._(),
  );
}

final class InstructorNav extends AnyPlacement {
  const InstructorNav._() : super._();
  InstructorNav surface() {
    _Screens.graph.popTo(_Screens.instructor);
    return const InstructorNav._();
  }

  CourseModuleNav pop() {
    _Screens.graph.pop();
    return const CourseModuleNav._();
  }

  CourseNav popToCourse() {
    _Screens.graph.pop(_Screens.course);
    return const CourseNav._();
  }

  LearnNav popToLearn() {
    _Screens.graph.pop(_Screens.learn);
    return const LearnNav._();
  }

  N popTo<N extends AnyNav>(InstructorPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class InstructorPop<N extends AnyNav> {
  const InstructorPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const courseModule = InstructorPop<CourseModuleNav>._(
    _Screens.courseModule,
    CourseModuleNav._(),
  );
  static const course = InstructorPop<CourseNav>._(
    _Screens.course,
    CourseNav._(),
  );
  static const learn = InstructorPop<LearnNav>._(_Screens.learn, LearnNav._());
}

final class CertificateNav extends AnyPlacement {
  const CertificateNav._() : super._();
  CertificateNav surface() {
    _Screens.graph.popTo(_Screens.certificate);
    return const CertificateNav._();
  }

  CourseNav pop() {
    _Screens.graph.pop();
    return const CourseNav._();
  }

  LearnNav popToLearn() {
    _Screens.graph.pop(_Screens.learn);
    return const LearnNav._();
  }

  N popTo<N extends AnyNav>(CertificatePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class CertificatePop<N extends AnyNav> {
  const CertificatePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const course = CertificatePop<CourseNav>._(
    _Screens.course,
    CourseNav._(),
  );
  static const learn = CertificatePop<LearnNav>._(_Screens.learn, LearnNav._());
}

final class ShopNav extends AnyPlacement implements PopDestPlacement {
  const ShopNav._() : super._();
  ShopNav surface() {
    _Screens.graph.popTo(_Screens.shop);
    return const ShopNav._();
  }

  ShopDeptNav goShopDept(String id) {
    _Screens.graph.popTo(_Screens.shop);
    _Screens.graph.go(_Screens.shopDept, id, true);
    return const ShopDeptNav._();
  }

  CompareProductsNav goCompareProducts() {
    _Screens.graph.popTo(_Screens.shop);
    _Screens.graph.go(_Screens.compareProducts, null, true);
    return const CompareProductsNav._();
  }

  N go<N extends AnyNav>(ShopHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }
}

final class ShopHop<N extends AnyNav> {
  const ShopHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static ShopHop<ShopDeptNav> shopDept(String id) =>
      ShopHop._(_Screens.shopDept, id, const ShopDeptNav._());
  static const compareProducts = ShopHop<CompareProductsNav>._(
    _Screens.compareProducts,
    null,
    CompareProductsNav._(),
  );
}

final class ShopDeptNav extends AnyPlacement implements PopDestPlacement {
  const ShopDeptNav._() : super._();
  ShopDeptNav surface() {
    _Screens.graph.popTo(_Screens.shopDept);
    return const ShopDeptNav._();
  }

  ShopCategoryNav goShopCategory(String id) {
    _Screens.graph.popTo(_Screens.shopDept);
    _Screens.graph.go(_Screens.shopCategory, id, true);
    return const ShopCategoryNav._();
  }

  ShopNav pop() {
    _Screens.graph.pop();
    return const ShopNav._();
  }
}

final class ShopCategoryNav extends AnyPlacement implements PopDestPlacement {
  const ShopCategoryNav._() : super._();
  ShopCategoryNav surface() {
    _Screens.graph.popTo(_Screens.shopCategory);
    return const ShopCategoryNav._();
  }

  ShopSubcategoryNav goShopSubcategory(String id) {
    _Screens.graph.popTo(_Screens.shopCategory);
    _Screens.graph.go(_Screens.shopSubcategory, id, true);
    return const ShopSubcategoryNav._();
  }

  ShopDeptNav pop() {
    _Screens.graph.pop();
    return const ShopDeptNav._();
  }

  ShopNav popToShop() {
    _Screens.graph.pop(_Screens.shop);
    return const ShopNav._();
  }

  N popTo<N extends AnyNav>(ShopCategoryPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ShopCategoryPop<N extends AnyNav> {
  const ShopCategoryPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const shopDept = ShopCategoryPop<ShopDeptNav>._(
    _Screens.shopDept,
    ShopDeptNav._(),
  );
  static const shop = ShopCategoryPop<ShopNav>._(_Screens.shop, ShopNav._());
}

final class ShopSubcategoryNav extends AnyPlacement
    implements
        ShopSubcategoryView,
        ProductShopSubcategoryPopPlacement,
        PopDestPlacement {
  const ShopSubcategoryNav._() : super._();
  ShopSubcategoryNav surface() {
    _Screens.graph.popTo(_Screens.shopSubcategory);
    return const ShopSubcategoryNav._();
  }

  ShopSubcategoryQueryMut get query => const ShopSubcategoryQueryMut._();
  ProductNav goProduct(String id) {
    _Screens.graph.popTo(_Screens.shopSubcategory);
    _Screens.graph.go(_Screens.product, id, true);
    return const ProductNav._();
  }

  ShopCategoryNav pop() {
    _Screens.graph.pop();
    return const ShopCategoryNav._();
  }

  ShopDeptNav popToShopDept() {
    _Screens.graph.pop(_Screens.shopDept);
    return const ShopDeptNav._();
  }

  ShopNav popToShop() {
    _Screens.graph.pop(_Screens.shop);
    return const ShopNav._();
  }

  N popTo<N extends AnyNav>(ShopSubcategoryPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ShopSubcategoryPop<N extends AnyNav> {
  const ShopSubcategoryPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const shopCategory = ShopSubcategoryPop<ShopCategoryNav>._(
    _Screens.shopCategory,
    ShopCategoryNav._(),
  );
  static const shopDept = ShopSubcategoryPop<ShopDeptNav>._(
    _Screens.shopDept,
    ShopDeptNav._(),
  );
  static const shop = ShopSubcategoryPop<ShopNav>._(_Screens.shop, ShopNav._());
}

final class ProductNav extends AnyPlacement
    implements
        ProductView,
        ProductShopSubcategoryPopPlacement,
        ProductProductVariantPopPlacement,
        PopDestPlacement {
  const ProductNav._() : super._();
  ProductNav surface() {
    _Screens.graph.popTo(_Screens.product);
    return const ProductNav._();
  }

  ProductQueryMut get query => const ProductQueryMut._();
  int get depth => _Screens.graph.countOf(_Screens.product);
  ProductVariantNav goProductVariant(String id) {
    _Screens.graph.popTo(_Screens.product);
    _Screens.graph.go(_Screens.productVariant, id, true);
    return const ProductVariantNav._();
  }

  ProductReviewNav goProductReview(String id) {
    _Screens.graph.popTo(_Screens.product);
    _Screens.graph.go(_Screens.productReview, id, true);
    return const ProductReviewNav._();
  }

  BrandNav goBrand(String id) {
    _Screens.graph.popTo(_Screens.product);
    _Screens.graph.go(_Screens.brand, id, true);
    return const BrandNav._();
  }

  ProductNav goProduct(String id) {
    _Screens.graph.popTo(_Screens.product);
    _Screens.graph.go(_Screens.product, id, true);
    return const ProductNav._();
  }

  N go<N extends AnyNav>(ProductHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  ProductShopSubcategoryPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveProductShopSubcategoryPopPlacement();
  }

  ShopCategoryNav popToShopCategory() {
    _Screens.graph.pop(_Screens.shopCategory);
    return const ShopCategoryNav._();
  }

  ShopDeptNav popToShopDept() {
    _Screens.graph.pop(_Screens.shopDept);
    return const ShopDeptNav._();
  }

  ShopNav popToShop() {
    _Screens.graph.pop(_Screens.shop);
    return const ShopNav._();
  }

  ProductNav popToProduct() {
    _Screens.graph.pop(_Screens.product);
    return const ProductNav._();
  }

  N popTo<N extends AnyNav>(ProductPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ProductPop<N extends AnyNav> {
  const ProductPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const shopSubcategory = ProductPop<ShopSubcategoryNav>._(
    _Screens.shopSubcategory,
    ShopSubcategoryNav._(),
  );
  static const shopCategory = ProductPop<ShopCategoryNav>._(
    _Screens.shopCategory,
    ShopCategoryNav._(),
  );
  static const shopDept = ProductPop<ShopDeptNav>._(
    _Screens.shopDept,
    ShopDeptNav._(),
  );
  static const shop = ProductPop<ShopNav>._(_Screens.shop, ShopNav._());
  static const product = ProductPop<ProductNav>._(
    _Screens.product,
    ProductNav._(),
  );
}

final class ProductHop<N extends AnyNav> {
  const ProductHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static ProductHop<ProductVariantNav> productVariant(String id) =>
      ProductHop._(_Screens.productVariant, id, const ProductVariantNav._());
  static ProductHop<ProductReviewNav> productReview(String id) =>
      ProductHop._(_Screens.productReview, id, const ProductReviewNav._());
  static ProductHop<BrandNav> brand(String id) =>
      ProductHop._(_Screens.brand, id, const BrandNav._());
  static ProductHop<ProductNav> product(String id) =>
      ProductHop._(_Screens.product, id, const ProductNav._());
}

final class ProductVariantNav extends AnyPlacement
    implements ProductProductVariantPopPlacement, PopDestPlacement {
  const ProductVariantNav._() : super._();
  ProductVariantNav surface() {
    _Screens.graph.popTo(_Screens.productVariant);
    return const ProductVariantNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.productVariant);
  ProductVariantNav goProductVariant(String id) {
    _Screens.graph.popTo(_Screens.productVariant);
    _Screens.graph.go(_Screens.productVariant, id, true);
    return const ProductVariantNav._();
  }

  ProductProductVariantPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveProductProductVariantPopPlacement();
  }

  ShopSubcategoryNav popToShopSubcategory() {
    _Screens.graph.pop(_Screens.shopSubcategory);
    return const ShopSubcategoryNav._();
  }

  ShopCategoryNav popToShopCategory() {
    _Screens.graph.pop(_Screens.shopCategory);
    return const ShopCategoryNav._();
  }

  ShopDeptNav popToShopDept() {
    _Screens.graph.pop(_Screens.shopDept);
    return const ShopDeptNav._();
  }

  ShopNav popToShop() {
    _Screens.graph.pop(_Screens.shop);
    return const ShopNav._();
  }

  ProductVariantNav popToProductVariant() {
    _Screens.graph.pop(_Screens.productVariant);
    return const ProductVariantNav._();
  }

  N popTo<N extends AnyNav>(ProductVariantPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ProductVariantPop<N extends AnyNav> {
  const ProductVariantPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const product = ProductVariantPop<ProductNav>._(
    _Screens.product,
    ProductNav._(),
  );
  static const shopSubcategory = ProductVariantPop<ShopSubcategoryNav>._(
    _Screens.shopSubcategory,
    ShopSubcategoryNav._(),
  );
  static const shopCategory = ProductVariantPop<ShopCategoryNav>._(
    _Screens.shopCategory,
    ShopCategoryNav._(),
  );
  static const shopDept = ProductVariantPop<ShopDeptNav>._(
    _Screens.shopDept,
    ShopDeptNav._(),
  );
  static const shop = ProductVariantPop<ShopNav>._(_Screens.shop, ShopNav._());
  static const productVariant = ProductVariantPop<ProductVariantNav>._(
    _Screens.productVariant,
    ProductVariantNav._(),
  );
}

final class ProductReviewNav extends AnyPlacement {
  const ProductReviewNav._() : super._();
  ProductReviewNav surface() {
    _Screens.graph.popTo(_Screens.productReview);
    return const ProductReviewNav._();
  }

  ProductNav pop() {
    _Screens.graph.pop();
    return const ProductNav._();
  }

  ShopSubcategoryNav popToShopSubcategory() {
    _Screens.graph.pop(_Screens.shopSubcategory);
    return const ShopSubcategoryNav._();
  }

  ShopCategoryNav popToShopCategory() {
    _Screens.graph.pop(_Screens.shopCategory);
    return const ShopCategoryNav._();
  }

  ShopDeptNav popToShopDept() {
    _Screens.graph.pop(_Screens.shopDept);
    return const ShopDeptNav._();
  }

  ShopNav popToShop() {
    _Screens.graph.pop(_Screens.shop);
    return const ShopNav._();
  }

  N popTo<N extends AnyNav>(ProductReviewPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ProductReviewPop<N extends AnyNav> {
  const ProductReviewPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const product = ProductReviewPop<ProductNav>._(
    _Screens.product,
    ProductNav._(),
  );
  static const shopSubcategory = ProductReviewPop<ShopSubcategoryNav>._(
    _Screens.shopSubcategory,
    ShopSubcategoryNav._(),
  );
  static const shopCategory = ProductReviewPop<ShopCategoryNav>._(
    _Screens.shopCategory,
    ShopCategoryNav._(),
  );
  static const shopDept = ProductReviewPop<ShopDeptNav>._(
    _Screens.shopDept,
    ShopDeptNav._(),
  );
  static const shop = ProductReviewPop<ShopNav>._(_Screens.shop, ShopNav._());
}

final class BrandNav extends AnyPlacement {
  const BrandNav._() : super._();
  BrandNav surface() {
    _Screens.graph.popTo(_Screens.brand);
    return const BrandNav._();
  }

  ProductNav pop() {
    _Screens.graph.pop();
    return const ProductNav._();
  }

  ShopSubcategoryNav popToShopSubcategory() {
    _Screens.graph.pop(_Screens.shopSubcategory);
    return const ShopSubcategoryNav._();
  }

  ShopCategoryNav popToShopCategory() {
    _Screens.graph.pop(_Screens.shopCategory);
    return const ShopCategoryNav._();
  }

  ShopDeptNav popToShopDept() {
    _Screens.graph.pop(_Screens.shopDept);
    return const ShopDeptNav._();
  }

  ShopNav popToShop() {
    _Screens.graph.pop(_Screens.shop);
    return const ShopNav._();
  }

  N popTo<N extends AnyNav>(BrandPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class BrandPop<N extends AnyNav> {
  const BrandPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const product = BrandPop<ProductNav>._(
    _Screens.product,
    ProductNav._(),
  );
  static const shopSubcategory = BrandPop<ShopSubcategoryNav>._(
    _Screens.shopSubcategory,
    ShopSubcategoryNav._(),
  );
  static const shopCategory = BrandPop<ShopCategoryNav>._(
    _Screens.shopCategory,
    ShopCategoryNav._(),
  );
  static const shopDept = BrandPop<ShopDeptNav>._(
    _Screens.shopDept,
    ShopDeptNav._(),
  );
  static const shop = BrandPop<ShopNav>._(_Screens.shop, ShopNav._());
}

final class CompareProductsNav extends AnyPlacement {
  const CompareProductsNav._() : super._();
  CompareProductsNav surface() {
    _Screens.graph.popTo(_Screens.compareProducts);
    return const CompareProductsNav._();
  }

  ShopNav pop() {
    _Screens.graph.pop();
    return const ShopNav._();
  }
}

final class ActivityNav extends AnyPlacement implements PopDestPlacement {
  const ActivityNav._() : super._();
  ActivityNav surface() {
    _Screens.graph.popTo(_Screens.activity);
    return const ActivityNav._();
  }

  WorkoutNav goWorkout(String id) {
    _Screens.graph.popTo(_Screens.activity);
    _Screens.graph.go(_Screens.workout, id, true);
    return const WorkoutNav._();
  }
}

final class WorkoutNav extends AnyPlacement
    implements WorkoutView, PopDestPlacement {
  const WorkoutNav._() : super._();
  WorkoutNav surface() {
    _Screens.graph.popTo(_Screens.workout);
    return const WorkoutNav._();
  }

  WorkoutQueryMut get query => const WorkoutQueryMut._();
  ExerciseNav goExercise(String id) {
    _Screens.graph.popTo(_Screens.workout);
    _Screens.graph.go(_Screens.exercise, id, true);
    return const ExerciseNav._();
  }

  ActivityNav pop() {
    _Screens.graph.pop();
    return const ActivityNav._();
  }
}

final class ExerciseNav extends AnyPlacement
    implements ExerciseExerciseSetPopPlacement, PopDestPlacement {
  const ExerciseNav._() : super._();
  ExerciseNav surface() {
    _Screens.graph.popTo(_Screens.exercise);
    return const ExerciseNav._();
  }

  ExerciseSetNav goExerciseSet(String id) {
    _Screens.graph.popTo(_Screens.exercise);
    _Screens.graph.go(_Screens.exerciseSet, id, true);
    return const ExerciseSetNav._();
  }

  WorkoutNav pop() {
    _Screens.graph.pop();
    return const WorkoutNav._();
  }

  ActivityNav popToActivity() {
    _Screens.graph.pop(_Screens.activity);
    return const ActivityNav._();
  }

  N popTo<N extends AnyNav>(ExercisePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ExercisePop<N extends AnyNav> {
  const ExercisePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const workout = ExercisePop<WorkoutNav>._(
    _Screens.workout,
    WorkoutNav._(),
  );
  static const activity = ExercisePop<ActivityNav>._(
    _Screens.activity,
    ActivityNav._(),
  );
}

final class ExerciseSetNav extends AnyPlacement
    implements ExerciseExerciseSetPopPlacement, PopDestPlacement {
  const ExerciseSetNav._() : super._();
  ExerciseSetNav surface() {
    _Screens.graph.popTo(_Screens.exerciseSet);
    return const ExerciseSetNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.exerciseSet);
  ExerciseSetNav goExerciseSet(String id) {
    _Screens.graph.popTo(_Screens.exerciseSet);
    _Screens.graph.go(_Screens.exerciseSet, id, true);
    return const ExerciseSetNav._();
  }

  ExerciseExerciseSetPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveExerciseExerciseSetPopPlacement();
  }

  WorkoutNav popToWorkout() {
    _Screens.graph.pop(_Screens.workout);
    return const WorkoutNav._();
  }

  ActivityNav popToActivity() {
    _Screens.graph.pop(_Screens.activity);
    return const ActivityNav._();
  }

  ExerciseSetNav popToExerciseSet() {
    _Screens.graph.pop(_Screens.exerciseSet);
    return const ExerciseSetNav._();
  }

  N popTo<N extends AnyNav>(ExerciseSetPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ExerciseSetPop<N extends AnyNav> {
  const ExerciseSetPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const exercise = ExerciseSetPop<ExerciseNav>._(
    _Screens.exercise,
    ExerciseNav._(),
  );
  static const workout = ExerciseSetPop<WorkoutNav>._(
    _Screens.workout,
    WorkoutNav._(),
  );
  static const activity = ExerciseSetPop<ActivityNav>._(
    _Screens.activity,
    ActivityNav._(),
  );
  static const exerciseSet = ExerciseSetPop<ExerciseSetNav>._(
    _Screens.exerciseSet,
    ExerciseSetNav._(),
  );
}

final class DeepDemoNav extends AnyPlacement
    implements DeepDemoLevelFPopPlacement, PopDestPlacement {
  const DeepDemoNav._() : super._();
  DeepDemoNav surface() {
    _Screens.graph.popTo(_Screens.deepDemo);
    return const DeepDemoNav._();
  }

  LevelANav goLevelA(String id) {
    _Screens.graph.popTo(_Screens.deepDemo);
    _Screens.graph.go(_Screens.levelA, id, true);
    return const LevelANav._();
  }
}

final class LevelANav extends AnyPlacement
    implements LevelALevelFPopPlacement, PopDestPlacement {
  const LevelANav._() : super._();
  LevelANav surface() {
    _Screens.graph.popTo(_Screens.levelA);
    return const LevelANav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.levelA);
  LevelBNav goLevelB(String id) {
    _Screens.graph.popTo(_Screens.levelA);
    _Screens.graph.go(_Screens.levelB, id, true);
    return const LevelBNav._();
  }

  DeepDemoLevelFPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveDeepDemoLevelFPopPlacement();
  }

  LevelFNav popToLevelF() {
    _Screens.graph.pop(_Screens.levelF);
    return const LevelFNav._();
  }

  LevelENav popToLevelE() {
    _Screens.graph.pop(_Screens.levelE);
    return const LevelENav._();
  }

  LevelDNav popToLevelD() {
    _Screens.graph.pop(_Screens.levelD);
    return const LevelDNav._();
  }

  LevelCNav popToLevelC() {
    _Screens.graph.pop(_Screens.levelC);
    return const LevelCNav._();
  }

  LevelBNav popToLevelB() {
    _Screens.graph.pop(_Screens.levelB);
    return const LevelBNav._();
  }

  LevelANav popToLevelA() {
    _Screens.graph.pop(_Screens.levelA);
    return const LevelANav._();
  }

  N popTo<N extends AnyNav>(LevelAPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class LevelAPop<N extends AnyNav> {
  const LevelAPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const deepDemo = LevelAPop<DeepDemoNav>._(
    _Screens.deepDemo,
    DeepDemoNav._(),
  );
  static const levelF = LevelAPop<LevelFNav>._(_Screens.levelF, LevelFNav._());
  static const levelE = LevelAPop<LevelENav>._(_Screens.levelE, LevelENav._());
  static const levelD = LevelAPop<LevelDNav>._(_Screens.levelD, LevelDNav._());
  static const levelC = LevelAPop<LevelCNav>._(_Screens.levelC, LevelCNav._());
  static const levelB = LevelAPop<LevelBNav>._(_Screens.levelB, LevelBNav._());
  static const levelA = LevelAPop<LevelANav>._(_Screens.levelA, LevelANav._());
}

final class LevelBNav extends AnyPlacement
    implements LevelBLevelFPopPlacement, PopDestPlacement {
  const LevelBNav._() : super._();
  LevelBNav surface() {
    _Screens.graph.popTo(_Screens.levelB);
    return const LevelBNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.levelB);
  LevelCNav goLevelC(String id) {
    _Screens.graph.popTo(_Screens.levelB);
    _Screens.graph.go(_Screens.levelC, id, true);
    return const LevelCNav._();
  }

  LevelALevelFPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveLevelALevelFPopPlacement();
  }

  DeepDemoNav popToDeepDemo() {
    _Screens.graph.pop(_Screens.deepDemo);
    return const DeepDemoNav._();
  }

  LevelFNav popToLevelF() {
    _Screens.graph.pop(_Screens.levelF);
    return const LevelFNav._();
  }

  LevelENav popToLevelE() {
    _Screens.graph.pop(_Screens.levelE);
    return const LevelENav._();
  }

  LevelDNav popToLevelD() {
    _Screens.graph.pop(_Screens.levelD);
    return const LevelDNav._();
  }

  LevelCNav popToLevelC() {
    _Screens.graph.pop(_Screens.levelC);
    return const LevelCNav._();
  }

  LevelBNav popToLevelB() {
    _Screens.graph.pop(_Screens.levelB);
    return const LevelBNav._();
  }

  N popTo<N extends AnyNav>(LevelBPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class LevelBPop<N extends AnyNav> {
  const LevelBPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const levelA = LevelBPop<LevelANav>._(_Screens.levelA, LevelANav._());
  static const deepDemo = LevelBPop<DeepDemoNav>._(
    _Screens.deepDemo,
    DeepDemoNav._(),
  );
  static const levelF = LevelBPop<LevelFNav>._(_Screens.levelF, LevelFNav._());
  static const levelE = LevelBPop<LevelENav>._(_Screens.levelE, LevelENav._());
  static const levelD = LevelBPop<LevelDNav>._(_Screens.levelD, LevelDNav._());
  static const levelC = LevelBPop<LevelCNav>._(_Screens.levelC, LevelCNav._());
  static const levelB = LevelBPop<LevelBNav>._(_Screens.levelB, LevelBNav._());
}

final class LevelCNav extends AnyPlacement
    implements LevelCLevelFPopPlacement, PopDestPlacement {
  const LevelCNav._() : super._();
  LevelCNav surface() {
    _Screens.graph.popTo(_Screens.levelC);
    return const LevelCNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.levelC);
  LevelDNav goLevelD(String id) {
    _Screens.graph.popTo(_Screens.levelC);
    _Screens.graph.go(_Screens.levelD, id, true);
    return const LevelDNav._();
  }

  LevelBLevelFPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveLevelBLevelFPopPlacement();
  }

  LevelANav popToLevelA() {
    _Screens.graph.pop(_Screens.levelA);
    return const LevelANav._();
  }

  DeepDemoNav popToDeepDemo() {
    _Screens.graph.pop(_Screens.deepDemo);
    return const DeepDemoNav._();
  }

  LevelFNav popToLevelF() {
    _Screens.graph.pop(_Screens.levelF);
    return const LevelFNav._();
  }

  LevelENav popToLevelE() {
    _Screens.graph.pop(_Screens.levelE);
    return const LevelENav._();
  }

  LevelDNav popToLevelD() {
    _Screens.graph.pop(_Screens.levelD);
    return const LevelDNav._();
  }

  LevelCNav popToLevelC() {
    _Screens.graph.pop(_Screens.levelC);
    return const LevelCNav._();
  }

  N popTo<N extends AnyNav>(LevelCPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class LevelCPop<N extends AnyNav> {
  const LevelCPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const levelB = LevelCPop<LevelBNav>._(_Screens.levelB, LevelBNav._());
  static const levelA = LevelCPop<LevelANav>._(_Screens.levelA, LevelANav._());
  static const deepDemo = LevelCPop<DeepDemoNav>._(
    _Screens.deepDemo,
    DeepDemoNav._(),
  );
  static const levelF = LevelCPop<LevelFNav>._(_Screens.levelF, LevelFNav._());
  static const levelE = LevelCPop<LevelENav>._(_Screens.levelE, LevelENav._());
  static const levelD = LevelCPop<LevelDNav>._(_Screens.levelD, LevelDNav._());
  static const levelC = LevelCPop<LevelCNav>._(_Screens.levelC, LevelCNav._());
}

final class LevelDNav extends AnyPlacement
    implements LevelDLevelFPopPlacement, PopDestPlacement {
  const LevelDNav._() : super._();
  LevelDNav surface() {
    _Screens.graph.popTo(_Screens.levelD);
    return const LevelDNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.levelD);
  LevelENav goLevelE(String id) {
    _Screens.graph.popTo(_Screens.levelD);
    _Screens.graph.go(_Screens.levelE, id, true);
    return const LevelENav._();
  }

  LevelCLevelFPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveLevelCLevelFPopPlacement();
  }

  LevelBNav popToLevelB() {
    _Screens.graph.pop(_Screens.levelB);
    return const LevelBNav._();
  }

  LevelANav popToLevelA() {
    _Screens.graph.pop(_Screens.levelA);
    return const LevelANav._();
  }

  DeepDemoNav popToDeepDemo() {
    _Screens.graph.pop(_Screens.deepDemo);
    return const DeepDemoNav._();
  }

  LevelFNav popToLevelF() {
    _Screens.graph.pop(_Screens.levelF);
    return const LevelFNav._();
  }

  LevelENav popToLevelE() {
    _Screens.graph.pop(_Screens.levelE);
    return const LevelENav._();
  }

  LevelDNav popToLevelD() {
    _Screens.graph.pop(_Screens.levelD);
    return const LevelDNav._();
  }

  N popTo<N extends AnyNav>(LevelDPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class LevelDPop<N extends AnyNav> {
  const LevelDPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const levelC = LevelDPop<LevelCNav>._(_Screens.levelC, LevelCNav._());
  static const levelB = LevelDPop<LevelBNav>._(_Screens.levelB, LevelBNav._());
  static const levelA = LevelDPop<LevelANav>._(_Screens.levelA, LevelANav._());
  static const deepDemo = LevelDPop<DeepDemoNav>._(
    _Screens.deepDemo,
    DeepDemoNav._(),
  );
  static const levelF = LevelDPop<LevelFNav>._(_Screens.levelF, LevelFNav._());
  static const levelE = LevelDPop<LevelENav>._(_Screens.levelE, LevelENav._());
  static const levelD = LevelDPop<LevelDNav>._(_Screens.levelD, LevelDNav._());
}

final class LevelENav extends AnyPlacement
    implements LevelELevelFPopPlacement, PopDestPlacement {
  const LevelENav._() : super._();
  LevelENav surface() {
    _Screens.graph.popTo(_Screens.levelE);
    return const LevelENav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.levelE);
  LevelFNav goLevelF(String id) {
    _Screens.graph.popTo(_Screens.levelE);
    _Screens.graph.go(_Screens.levelF, id, true);
    return const LevelFNav._();
  }

  LevelDLevelFPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveLevelDLevelFPopPlacement();
  }

  LevelCNav popToLevelC() {
    _Screens.graph.pop(_Screens.levelC);
    return const LevelCNav._();
  }

  LevelBNav popToLevelB() {
    _Screens.graph.pop(_Screens.levelB);
    return const LevelBNav._();
  }

  LevelANav popToLevelA() {
    _Screens.graph.pop(_Screens.levelA);
    return const LevelANav._();
  }

  DeepDemoNav popToDeepDemo() {
    _Screens.graph.pop(_Screens.deepDemo);
    return const DeepDemoNav._();
  }

  LevelFNav popToLevelF() {
    _Screens.graph.pop(_Screens.levelF);
    return const LevelFNav._();
  }

  LevelENav popToLevelE() {
    _Screens.graph.pop(_Screens.levelE);
    return const LevelENav._();
  }

  N popTo<N extends AnyNav>(LevelEPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class LevelEPop<N extends AnyNav> {
  const LevelEPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const levelD = LevelEPop<LevelDNav>._(_Screens.levelD, LevelDNav._());
  static const levelC = LevelEPop<LevelCNav>._(_Screens.levelC, LevelCNav._());
  static const levelB = LevelEPop<LevelBNav>._(_Screens.levelB, LevelBNav._());
  static const levelA = LevelEPop<LevelANav>._(_Screens.levelA, LevelANav._());
  static const deepDemo = LevelEPop<DeepDemoNav>._(
    _Screens.deepDemo,
    DeepDemoNav._(),
  );
  static const levelF = LevelEPop<LevelFNav>._(_Screens.levelF, LevelFNav._());
  static const levelE = LevelEPop<LevelENav>._(_Screens.levelE, LevelENav._());
}

final class LevelFNav extends AnyPlacement
    implements
        DeepDemoLevelFPopPlacement,
        LevelALevelFPopPlacement,
        LevelBLevelFPopPlacement,
        LevelCLevelFPopPlacement,
        LevelDLevelFPopPlacement,
        LevelELevelFPopPlacement,
        PopDestPlacement {
  const LevelFNav._() : super._();
  LevelFNav surface() {
    _Screens.graph.popTo(_Screens.levelF);
    return const LevelFNav._();
  }

  int get depth => _Screens.graph.countOf(_Screens.levelF);
  LevelANav goLevelA(String id) {
    _Screens.graph.popTo(_Screens.levelF);
    _Screens.graph.go(_Screens.levelA, id, true);
    return const LevelANav._();
  }

  LevelBNav goLevelB(String id) {
    _Screens.graph.popTo(_Screens.levelF);
    _Screens.graph.go(_Screens.levelB, id, true);
    return const LevelBNav._();
  }

  LevelCNav goLevelC(String id) {
    _Screens.graph.popTo(_Screens.levelF);
    _Screens.graph.go(_Screens.levelC, id, true);
    return const LevelCNav._();
  }

  LevelDNav goLevelD(String id) {
    _Screens.graph.popTo(_Screens.levelF);
    _Screens.graph.go(_Screens.levelD, id, true);
    return const LevelDNav._();
  }

  LevelENav goLevelE(String id) {
    _Screens.graph.popTo(_Screens.levelF);
    _Screens.graph.go(_Screens.levelE, id, true);
    return const LevelENav._();
  }

  LevelFNav goLevelF(String id) {
    _Screens.graph.popTo(_Screens.levelF);
    _Screens.graph.go(_Screens.levelF, id, true);
    return const LevelFNav._();
  }

  N go<N extends AnyNav>(LevelFHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  LevelELevelFPopPlacement pop() {
    _Screens.graph.pop();
    return _resolveLevelELevelFPopPlacement();
  }

  LevelDNav popToLevelD() {
    _Screens.graph.pop(_Screens.levelD);
    return const LevelDNav._();
  }

  LevelCNav popToLevelC() {
    _Screens.graph.pop(_Screens.levelC);
    return const LevelCNav._();
  }

  LevelBNav popToLevelB() {
    _Screens.graph.pop(_Screens.levelB);
    return const LevelBNav._();
  }

  LevelANav popToLevelA() {
    _Screens.graph.pop(_Screens.levelA);
    return const LevelANav._();
  }

  DeepDemoNav popToDeepDemo() {
    _Screens.graph.pop(_Screens.deepDemo);
    return const DeepDemoNav._();
  }

  LevelFNav popToLevelF() {
    _Screens.graph.pop(_Screens.levelF);
    return const LevelFNav._();
  }

  N popTo<N extends AnyNav>(LevelFPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class LevelFPop<N extends AnyNav> {
  const LevelFPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const levelE = LevelFPop<LevelENav>._(_Screens.levelE, LevelENav._());
  static const levelD = LevelFPop<LevelDNav>._(_Screens.levelD, LevelDNav._());
  static const levelC = LevelFPop<LevelCNav>._(_Screens.levelC, LevelCNav._());
  static const levelB = LevelFPop<LevelBNav>._(_Screens.levelB, LevelBNav._());
  static const levelA = LevelFPop<LevelANav>._(_Screens.levelA, LevelANav._());
  static const deepDemo = LevelFPop<DeepDemoNav>._(
    _Screens.deepDemo,
    DeepDemoNav._(),
  );
  static const levelF = LevelFPop<LevelFNav>._(_Screens.levelF, LevelFNav._());
}

final class LevelFHop<N extends AnyNav> {
  const LevelFHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static LevelFHop<LevelANav> levelA(String id) =>
      LevelFHop._(_Screens.levelA, id, const LevelANav._());
  static LevelFHop<LevelBNav> levelB(String id) =>
      LevelFHop._(_Screens.levelB, id, const LevelBNav._());
  static LevelFHop<LevelCNav> levelC(String id) =>
      LevelFHop._(_Screens.levelC, id, const LevelCNav._());
  static LevelFHop<LevelDNav> levelD(String id) =>
      LevelFHop._(_Screens.levelD, id, const LevelDNav._());
  static LevelFHop<LevelENav> levelE(String id) =>
      LevelFHop._(_Screens.levelE, id, const LevelENav._());
  static LevelFHop<LevelFNav> levelF(String id) =>
      LevelFHop._(_Screens.levelF, id, const LevelFNav._());
}

final class IntegrationsNav extends AnyPlacement implements PopDestPlacement {
  const IntegrationsNav._() : super._();
  IntegrationsNav surface() {
    _Screens.graph.popTo(_Screens.integrations);
    return const IntegrationsNav._();
  }

  ApiKeysNav goApiKeys() {
    _Screens.graph.popTo(_Screens.integrations);
    _Screens.graph.go(_Screens.apiKeys, null, true);
    return const ApiKeysNav._();
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class ApiKeysNav extends AnyPlacement {
  const ApiKeysNav._() : super._();
  ApiKeysNav surface() {
    _Screens.graph.popTo(_Screens.apiKeys);
    return const ApiKeysNav._();
  }

  IntegrationsNav pop() {
    _Screens.graph.pop();
    return const IntegrationsNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(ApiKeysPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ApiKeysPop<N extends AnyNav> {
  const ApiKeysPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const integrations = ApiKeysPop<IntegrationsNav>._(
    _Screens.integrations,
    IntegrationsNav._(),
  );
  static const settings = ApiKeysPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class StudioNav extends AnyPlacement implements PopDestPlacement {
  const StudioNav._() : super._();
  StudioNav surface() {
    _Screens.graph.popTo(CreatorStudio.studio);
    return const StudioNav._();
  }

  AnalyticsNav goAnalytics() {
    _Screens.graph.popTo(CreatorStudio.studio);
    _Screens.graph.go(CreatorStudio.analytics, null, true);
    return const AnalyticsNav._();
  }

  ScheduledNav goScheduled() {
    _Screens.graph.popTo(CreatorStudio.studio);
    _Screens.graph.go(CreatorStudio.scheduled, null, true);
    return const ScheduledNav._();
  }

  MonetizationNav goMonetization() {
    _Screens.graph.popTo(CreatorStudio.studio);
    _Screens.graph.go(CreatorStudio.monetization, null, true);
    return const MonetizationNav._();
  }

  ScheduledPostNav goScheduledPost(String id) {
    _Screens.graph.go(CreatorStudio.scheduled, null, true);
    _Screens.graph.go(CreatorStudio.scheduledPost, id, true);
    return const ScheduledPostNav._();
  }

  EditScheduledNav goEditScheduled(String id) {
    _Screens.graph.go(CreatorStudio.scheduled, null, true);
    _Screens.graph.go(CreatorStudio.scheduledPost, id, true);
    _Screens.graph.go(CreatorStudio.editScheduled, id, true);
    return const EditScheduledNav._();
  }

  N go<N extends AnyNav>(StudioHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  HomeNav pop() {
    _Screens.graph.pop();
    return const HomeNav._();
  }
}

final class StudioHop<N extends AnyNav> {
  const StudioHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const analytics = StudioHop<AnalyticsNav>._(
    CreatorStudio.analytics,
    null,
    AnalyticsNav._(),
  );
  static const scheduled = StudioHop<ScheduledNav>._(
    CreatorStudio.scheduled,
    null,
    ScheduledNav._(),
  );
  static const monetization = StudioHop<MonetizationNav>._(
    CreatorStudio.monetization,
    null,
    MonetizationNav._(),
  );
}

final class AnalyticsNav extends AnyPlacement implements PopDestPlacement {
  const AnalyticsNav._() : super._();
  AnalyticsNav surface() {
    _Screens.graph.popTo(CreatorStudio.analytics);
    return const AnalyticsNav._();
  }

  AudienceNav goAudience() {
    _Screens.graph.popTo(CreatorStudio.analytics);
    _Screens.graph.go(CreatorStudio.audience, null, true);
    return const AudienceNav._();
  }

  StudioNav pop() {
    _Screens.graph.pop();
    return const StudioNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(AnalyticsPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AnalyticsPop<N extends AnyNav> {
  const AnalyticsPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const studio = AnalyticsPop<StudioNav>._(
    CreatorStudio.studio,
    StudioNav._(),
  );
  static const home = AnalyticsPop<HomeNav>._(_Screens.home, HomeNav._());
}

final class AudienceNav extends AnyPlacement {
  const AudienceNav._() : super._();
  AudienceNav surface() {
    _Screens.graph.popTo(CreatorStudio.audience);
    return const AudienceNav._();
  }

  AnalyticsNav pop() {
    _Screens.graph.pop();
    return const AnalyticsNav._();
  }

  StudioNav popToStudio() {
    _Screens.graph.pop(CreatorStudio.studio);
    return const StudioNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(AudiencePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AudiencePop<N extends AnyNav> {
  const AudiencePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const analytics = AudiencePop<AnalyticsNav>._(
    CreatorStudio.analytics,
    AnalyticsNav._(),
  );
  static const studio = AudiencePop<StudioNav>._(
    CreatorStudio.studio,
    StudioNav._(),
  );
  static const home = AudiencePop<HomeNav>._(_Screens.home, HomeNav._());
}

final class ScheduledNav extends AnyPlacement implements PopDestPlacement {
  const ScheduledNav._() : super._();
  ScheduledNav surface() {
    _Screens.graph.popTo(CreatorStudio.scheduled);
    return const ScheduledNav._();
  }

  ScheduledPostNav goScheduledPost(String id) {
    _Screens.graph.popTo(CreatorStudio.scheduled);
    _Screens.graph.go(CreatorStudio.scheduledPost, id, true);
    return const ScheduledPostNav._();
  }

  EditScheduledNav goEditScheduled(String id) {
    _Screens.graph.go(CreatorStudio.scheduledPost, id, true);
    _Screens.graph.go(CreatorStudio.editScheduled, id, true);
    return const EditScheduledNav._();
  }

  StudioNav pop() {
    _Screens.graph.pop();
    return const StudioNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(ScheduledPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ScheduledPop<N extends AnyNav> {
  const ScheduledPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const studio = ScheduledPop<StudioNav>._(
    CreatorStudio.studio,
    StudioNav._(),
  );
  static const home = ScheduledPop<HomeNav>._(_Screens.home, HomeNav._());
}

final class ScheduledPostNav extends AnyPlacement implements PopDestPlacement {
  const ScheduledPostNav._() : super._();
  ScheduledPostNav surface() {
    _Screens.graph.popTo(CreatorStudio.scheduledPost);
    return const ScheduledPostNav._();
  }

  EditScheduledNav goEditScheduled() {
    _Screens.graph.popTo(CreatorStudio.scheduledPost);
    _Screens.graph.go(
      CreatorStudio.editScheduled,
      _idOf(CreatorStudio.scheduledPost),
      true,
    );
    return const EditScheduledNav._();
  }

  ScheduledNav pop() {
    _Screens.graph.pop();
    return const ScheduledNav._();
  }

  StudioNav popToStudio() {
    _Screens.graph.pop(CreatorStudio.studio);
    return const StudioNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(ScheduledPostPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ScheduledPostPop<N extends AnyNav> {
  const ScheduledPostPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const scheduled = ScheduledPostPop<ScheduledNav>._(
    CreatorStudio.scheduled,
    ScheduledNav._(),
  );
  static const studio = ScheduledPostPop<StudioNav>._(
    CreatorStudio.studio,
    StudioNav._(),
  );
  static const home = ScheduledPostPop<HomeNav>._(_Screens.home, HomeNav._());
}

final class EditScheduledNav extends AnyPlacement {
  const EditScheduledNav._() : super._();
  EditScheduledNav surface() {
    _Screens.graph.popTo(CreatorStudio.editScheduled);
    return const EditScheduledNav._();
  }

  ScheduledPostNav pop() {
    _Screens.graph.pop();
    return const ScheduledPostNav._();
  }

  ScheduledNav popToScheduled() {
    _Screens.graph.pop(CreatorStudio.scheduled);
    return const ScheduledNav._();
  }

  StudioNav popToStudio() {
    _Screens.graph.pop(CreatorStudio.studio);
    return const StudioNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(EditScheduledPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class EditScheduledPop<N extends AnyNav> {
  const EditScheduledPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const scheduledPost = EditScheduledPop<ScheduledPostNav>._(
    CreatorStudio.scheduledPost,
    ScheduledPostNav._(),
  );
  static const scheduled = EditScheduledPop<ScheduledNav>._(
    CreatorStudio.scheduled,
    ScheduledNav._(),
  );
  static const studio = EditScheduledPop<StudioNav>._(
    CreatorStudio.studio,
    StudioNav._(),
  );
  static const home = EditScheduledPop<HomeNav>._(_Screens.home, HomeNav._());
}

final class MonetizationNav extends AnyPlacement implements PopDestPlacement {
  const MonetizationNav._() : super._();
  MonetizationNav surface() {
    _Screens.graph.popTo(CreatorStudio.monetization);
    return const MonetizationNav._();
  }

  PayoutsNav goPayouts() {
    _Screens.graph.popTo(CreatorStudio.monetization);
    _Screens.graph.go(CreatorStudio.payouts, null, true);
    return const PayoutsNav._();
  }

  StudioNav pop() {
    _Screens.graph.pop();
    return const StudioNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(MonetizationPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class MonetizationPop<N extends AnyNav> {
  const MonetizationPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const studio = MonetizationPop<StudioNav>._(
    CreatorStudio.studio,
    StudioNav._(),
  );
  static const home = MonetizationPop<HomeNav>._(_Screens.home, HomeNav._());
}

final class PayoutsNav extends AnyPlacement {
  const PayoutsNav._() : super._();
  PayoutsNav surface() {
    _Screens.graph.popTo(CreatorStudio.payouts);
    return const PayoutsNav._();
  }

  MonetizationNav pop() {
    _Screens.graph.pop();
    return const MonetizationNav._();
  }

  StudioNav popToStudio() {
    _Screens.graph.pop(CreatorStudio.studio);
    return const StudioNav._();
  }

  HomeNav popToHome() {
    _Screens.graph.pop(_Screens.home);
    return const HomeNav._();
  }

  N popTo<N extends AnyNav>(PayoutsPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class PayoutsPop<N extends AnyNav> {
  const PayoutsPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const monetization = PayoutsPop<MonetizationNav>._(
    CreatorStudio.monetization,
    MonetizationNav._(),
  );
  static const studio = PayoutsPop<StudioNav>._(
    CreatorStudio.studio,
    StudioNav._(),
  );
  static const home = PayoutsPop<HomeNav>._(_Screens.home, HomeNav._());
}

final class EventsNav extends AnyPlacement implements PopDestPlacement {
  const EventsNav._() : super._();
  EventsNav surface() {
    _Screens.graph.popTo(Events.events);
    return const EventsNav._();
  }

  EventNav goEvent(String id) {
    _Screens.graph.popTo(Events.events);
    _Screens.graph.go(Events.event, id, true);
    return const EventNav._();
  }

  CreateEventNav goCreateEvent() {
    _Screens.graph.popTo(Events.events);
    _Screens.graph.go(Events.createEvent, null, true);
    return const CreateEventNav._();
  }

  AttendeesNav goAttendees(String id) {
    _Screens.graph.go(Events.event, id, true);
    _Screens.graph.go(Events.attendees, id, true);
    return const AttendeesNav._();
  }

  EditEventNav goEditEvent(String id) {
    _Screens.graph.go(Events.event, id, true);
    _Screens.graph.go(Events.editEvent, id, true);
    return const EditEventNav._();
  }

  TicketsNav goTickets(String id) {
    _Screens.graph.go(Events.event, id, true);
    _Screens.graph.go(Events.tickets, id, true);
    return const TicketsNav._();
  }

  N go<N extends AnyNav>(EventsHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  DiscoverNav pop() {
    _Screens.graph.pop();
    return const DiscoverNav._();
  }
}

final class EventsHop<N extends AnyNav> {
  const EventsHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static EventsHop<EventNav> event(String id) =>
      EventsHop._(Events.event, id, const EventNav._());
  static const createEvent = EventsHop<CreateEventNav>._(
    Events.createEvent,
    null,
    CreateEventNav._(),
  );
}

final class EventNav extends AnyPlacement implements PopDestPlacement {
  const EventNav._() : super._();
  EventNav surface() {
    _Screens.graph.popTo(Events.event);
    return const EventNav._();
  }

  AttendeesNav goAttendees() {
    _Screens.graph.popTo(Events.event);
    _Screens.graph.go(Events.attendees, _idOf(Events.event), true);
    return const AttendeesNav._();
  }

  EditEventNav goEditEvent() {
    _Screens.graph.popTo(Events.event);
    _Screens.graph.go(Events.editEvent, _idOf(Events.event), true);
    return const EditEventNav._();
  }

  TicketsNav goTickets() {
    _Screens.graph.popTo(Events.event);
    _Screens.graph.go(Events.tickets, _idOf(Events.event), true);
    return const TicketsNav._();
  }

  EventsNav pop() {
    _Screens.graph.pop();
    return const EventsNav._();
  }

  DiscoverNav popToDiscover() {
    _Screens.graph.pop(_Screens.discover);
    return const DiscoverNav._();
  }

  N popTo<N extends AnyNav>(EventPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class EventPop<N extends AnyNav> {
  const EventPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const events = EventPop<EventsNav>._(Events.events, EventsNav._());
  static const discover = EventPop<DiscoverNav>._(
    _Screens.discover,
    DiscoverNav._(),
  );
}

final class AttendeesNav extends AnyPlacement {
  const AttendeesNav._() : super._();
  AttendeesNav surface() {
    _Screens.graph.popTo(Events.attendees);
    return const AttendeesNav._();
  }

  EventNav pop() {
    _Screens.graph.pop();
    return const EventNav._();
  }

  EventsNav popToEvents() {
    _Screens.graph.pop(Events.events);
    return const EventsNav._();
  }

  DiscoverNav popToDiscover() {
    _Screens.graph.pop(_Screens.discover);
    return const DiscoverNav._();
  }

  N popTo<N extends AnyNav>(AttendeesPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AttendeesPop<N extends AnyNav> {
  const AttendeesPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const event = AttendeesPop<EventNav>._(Events.event, EventNav._());
  static const events = AttendeesPop<EventsNav>._(Events.events, EventsNav._());
  static const discover = AttendeesPop<DiscoverNav>._(
    _Screens.discover,
    DiscoverNav._(),
  );
}

final class EditEventNav extends AnyPlacement {
  const EditEventNav._() : super._();
  EditEventNav surface() {
    _Screens.graph.popTo(Events.editEvent);
    return const EditEventNav._();
  }

  EventNav pop() {
    _Screens.graph.pop();
    return const EventNav._();
  }

  EventsNav popToEvents() {
    _Screens.graph.pop(Events.events);
    return const EventsNav._();
  }

  DiscoverNav popToDiscover() {
    _Screens.graph.pop(_Screens.discover);
    return const DiscoverNav._();
  }

  N popTo<N extends AnyNav>(EditEventPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class EditEventPop<N extends AnyNav> {
  const EditEventPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const event = EditEventPop<EventNav>._(Events.event, EventNav._());
  static const events = EditEventPop<EventsNav>._(Events.events, EventsNav._());
  static const discover = EditEventPop<DiscoverNav>._(
    _Screens.discover,
    DiscoverNav._(),
  );
}

final class CreateEventNav extends AnyPlacement {
  const CreateEventNav._() : super._();
  CreateEventNav surface() {
    _Screens.graph.popTo(Events.createEvent);
    return const CreateEventNav._();
  }

  EventsNav pop() {
    _Screens.graph.pop();
    return const EventsNav._();
  }

  DiscoverNav popToDiscover() {
    _Screens.graph.pop(_Screens.discover);
    return const DiscoverNav._();
  }

  N popTo<N extends AnyNav>(CreateEventPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class CreateEventPop<N extends AnyNav> {
  const CreateEventPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const events = CreateEventPop<EventsNav>._(
    Events.events,
    EventsNav._(),
  );
  static const discover = CreateEventPop<DiscoverNav>._(
    _Screens.discover,
    DiscoverNav._(),
  );
}

final class TicketsNav extends AnyPlacement {
  const TicketsNav._() : super._();
  TicketsNav surface() {
    _Screens.graph.popTo(Events.tickets);
    return const TicketsNav._();
  }

  EventNav pop() {
    _Screens.graph.pop();
    return const EventNav._();
  }

  EventsNav popToEvents() {
    _Screens.graph.pop(Events.events);
    return const EventsNav._();
  }

  DiscoverNav popToDiscover() {
    _Screens.graph.pop(_Screens.discover);
    return const DiscoverNav._();
  }

  N popTo<N extends AnyNav>(TicketsPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class TicketsPop<N extends AnyNav> {
  const TicketsPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const event = TicketsPop<EventNav>._(Events.event, EventNav._());
  static const events = TicketsPop<EventsNav>._(Events.events, EventsNav._());
  static const discover = TicketsPop<DiscoverNav>._(
    _Screens.discover,
    DiscoverNav._(),
  );
}

final class SupportNav extends AnyPlacement implements PopDestPlacement {
  const SupportNav._() : super._();
  SupportNav surface() {
    _Screens.graph.popTo(Support.support);
    return const SupportNav._();
  }

  SupportTicketsNav goSupportTickets() {
    _Screens.graph.popTo(Support.support);
    _Screens.graph.go(Support.supportTickets, null, true);
    return const SupportTicketsNav._();
  }

  NewTicketNav goNewTicket() {
    _Screens.graph.popTo(Support.support);
    _Screens.graph.go(Support.newTicket, null, true);
    return const NewTicketNav._();
  }

  KnowledgeBaseNav goKnowledgeBase() {
    _Screens.graph.popTo(Support.support);
    _Screens.graph.go(Support.knowledgeBase, null, true);
    return const KnowledgeBaseNav._();
  }

  SupportTicketNav goSupportTicket(String id) {
    _Screens.graph.go(Support.supportTickets, null, true);
    _Screens.graph.go(Support.supportTicket, id, true);
    return const SupportTicketNav._();
  }

  ArticleNav goArticle(String id) {
    _Screens.graph.go(Support.knowledgeBase, null, true);
    _Screens.graph.go(Support.article, id, true);
    return const ArticleNav._();
  }

  N go<N extends AnyNav>(SupportHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class SupportHop<N extends AnyNav> {
  const SupportHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const supportTickets = SupportHop<SupportTicketsNav>._(
    Support.supportTickets,
    null,
    SupportTicketsNav._(),
  );
  static const newTicket = SupportHop<NewTicketNav>._(
    Support.newTicket,
    null,
    NewTicketNav._(),
  );
  static const knowledgeBase = SupportHop<KnowledgeBaseNav>._(
    Support.knowledgeBase,
    null,
    KnowledgeBaseNav._(),
  );
}

final class SupportTicketsNav extends AnyPlacement implements PopDestPlacement {
  const SupportTicketsNav._() : super._();
  SupportTicketsNav surface() {
    _Screens.graph.popTo(Support.supportTickets);
    return const SupportTicketsNav._();
  }

  SupportTicketNav goSupportTicket(String id) {
    _Screens.graph.popTo(Support.supportTickets);
    _Screens.graph.go(Support.supportTicket, id, true);
    return const SupportTicketNav._();
  }

  SupportNav pop() {
    _Screens.graph.pop();
    return const SupportNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(SupportTicketsPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class SupportTicketsPop<N extends AnyNav> {
  const SupportTicketsPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const support = SupportTicketsPop<SupportNav>._(
    Support.support,
    SupportNav._(),
  );
  static const settings = SupportTicketsPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class SupportTicketNav extends AnyPlacement {
  const SupportTicketNav._() : super._();
  SupportTicketNav surface() {
    _Screens.graph.popTo(Support.supportTicket);
    return const SupportTicketNav._();
  }

  SupportTicketsNav pop() {
    _Screens.graph.pop();
    return const SupportTicketsNav._();
  }

  SupportNav popToSupport() {
    _Screens.graph.pop(Support.support);
    return const SupportNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(SupportTicketPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class SupportTicketPop<N extends AnyNav> {
  const SupportTicketPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const supportTickets = SupportTicketPop<SupportTicketsNav>._(
    Support.supportTickets,
    SupportTicketsNav._(),
  );
  static const support = SupportTicketPop<SupportNav>._(
    Support.support,
    SupportNav._(),
  );
  static const settings = SupportTicketPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class NewTicketNav extends AnyPlacement {
  const NewTicketNav._() : super._();
  NewTicketNav surface() {
    _Screens.graph.popTo(Support.newTicket);
    return const NewTicketNav._();
  }

  SupportNav pop() {
    _Screens.graph.pop();
    return const SupportNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(NewTicketPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class NewTicketPop<N extends AnyNav> {
  const NewTicketPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const support = NewTicketPop<SupportNav>._(
    Support.support,
    SupportNav._(),
  );
  static const settings = NewTicketPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class KnowledgeBaseNav extends AnyPlacement implements PopDestPlacement {
  const KnowledgeBaseNav._() : super._();
  KnowledgeBaseNav surface() {
    _Screens.graph.popTo(Support.knowledgeBase);
    return const KnowledgeBaseNav._();
  }

  ArticleNav goArticle(String id) {
    _Screens.graph.popTo(Support.knowledgeBase);
    _Screens.graph.go(Support.article, id, true);
    return const ArticleNav._();
  }

  SupportNav pop() {
    _Screens.graph.pop();
    return const SupportNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(KnowledgeBasePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class KnowledgeBasePop<N extends AnyNav> {
  const KnowledgeBasePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const support = KnowledgeBasePop<SupportNav>._(
    Support.support,
    SupportNav._(),
  );
  static const settings = KnowledgeBasePop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class ArticleNav extends AnyPlacement {
  const ArticleNav._() : super._();
  ArticleNav surface() {
    _Screens.graph.popTo(Support.article);
    return const ArticleNav._();
  }

  KnowledgeBaseNav pop() {
    _Screens.graph.pop();
    return const KnowledgeBaseNav._();
  }

  SupportNav popToSupport() {
    _Screens.graph.pop(Support.support);
    return const SupportNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(ArticlePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class ArticlePop<N extends AnyNav> {
  const ArticlePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const knowledgeBase = ArticlePop<KnowledgeBaseNav>._(
    Support.knowledgeBase,
    KnowledgeBaseNav._(),
  );
  static const support = ArticlePop<SupportNav>._(
    Support.support,
    SupportNav._(),
  );
  static const settings = ArticlePop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class AdminNav extends AnyPlacement implements PopDestPlacement {
  const AdminNav._() : super._();
  AdminNav surface() {
    _Screens.graph.popTo(Admin.admin);
    return const AdminNav._();
  }

  AdminUsersNav goAdminUsers() {
    _Screens.graph.popTo(Admin.admin);
    _Screens.graph.go(Admin.adminUsers, null, true);
    return const AdminUsersNav._();
  }

  AdminAuditLogNav goAdminAuditLog() {
    _Screens.graph.popTo(Admin.admin);
    _Screens.graph.go(Admin.adminAuditLog, null, true);
    return const AdminAuditLogNav._();
  }

  AdminFeatureFlagsNav goAdminFeatureFlags() {
    _Screens.graph.popTo(Admin.admin);
    _Screens.graph.go(Admin.adminFeatureFlags, null, true);
    return const AdminFeatureFlagsNav._();
  }

  WebhooksNav goWebhooks() {
    _Screens.graph.popTo(Admin.admin);
    _Screens.graph.go(Admin.webhooks, null, true);
    return const WebhooksNav._();
  }

  AdminUserNav goAdminUser(String id) {
    _Screens.graph.go(Admin.adminUsers, null, true);
    _Screens.graph.go(Admin.adminUser, id, true);
    return const AdminUserNav._();
  }

  WebhookNav goWebhook(String id) {
    _Screens.graph.go(Admin.webhooks, null, true);
    _Screens.graph.go(Admin.webhook, id, true);
    return const WebhookNav._();
  }

  N go<N extends AnyNav>(AdminHop<N> hop) {
    _Screens.graph.go(hop.spec, hop.id, true);
    return hop.nav;
  }

  SettingsNav pop() {
    _Screens.graph.pop();
    return const SettingsNav._();
  }
}

final class AdminHop<N extends AnyNav> {
  const AdminHop._(this.spec, this.id, this.nav);
  final Enum spec;
  final Object? id;
  final N nav;
  static const adminUsers = AdminHop<AdminUsersNav>._(
    Admin.adminUsers,
    null,
    AdminUsersNav._(),
  );
  static const adminAuditLog = AdminHop<AdminAuditLogNav>._(
    Admin.adminAuditLog,
    null,
    AdminAuditLogNav._(),
  );
  static const adminFeatureFlags = AdminHop<AdminFeatureFlagsNav>._(
    Admin.adminFeatureFlags,
    null,
    AdminFeatureFlagsNav._(),
  );
  static const webhooks = AdminHop<WebhooksNav>._(
    Admin.webhooks,
    null,
    WebhooksNav._(),
  );
}

final class AdminUsersNav extends AnyPlacement implements PopDestPlacement {
  const AdminUsersNav._() : super._();
  AdminUsersNav surface() {
    _Screens.graph.popTo(Admin.adminUsers);
    return const AdminUsersNav._();
  }

  AdminUserNav goAdminUser(String id) {
    _Screens.graph.popTo(Admin.adminUsers);
    _Screens.graph.go(Admin.adminUser, id, true);
    return const AdminUserNav._();
  }

  AdminNav pop() {
    _Screens.graph.pop();
    return const AdminNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(AdminUsersPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AdminUsersPop<N extends AnyNav> {
  const AdminUsersPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const admin = AdminUsersPop<AdminNav>._(Admin.admin, AdminNav._());
  static const settings = AdminUsersPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class AdminUserNav extends AnyPlacement implements PopDestPlacement {
  const AdminUserNav._() : super._();
  AdminUserNav surface() {
    _Screens.graph.popTo(Admin.adminUser);
    return const AdminUserNav._();
  }

  AdminRoleNav goAdminRole(String id) {
    _Screens.graph.popTo(Admin.adminUser);
    _Screens.graph.go(Admin.adminRole, id, true);
    return const AdminRoleNav._();
  }

  AdminUsersNav pop() {
    _Screens.graph.pop();
    return const AdminUsersNav._();
  }

  AdminNav popToAdmin() {
    _Screens.graph.pop(Admin.admin);
    return const AdminNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(AdminUserPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AdminUserPop<N extends AnyNav> {
  const AdminUserPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const adminUsers = AdminUserPop<AdminUsersNav>._(
    Admin.adminUsers,
    AdminUsersNav._(),
  );
  static const admin = AdminUserPop<AdminNav>._(Admin.admin, AdminNav._());
  static const settings = AdminUserPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class AdminAuditLogNav extends AnyPlacement {
  const AdminAuditLogNav._() : super._();
  AdminAuditLogNav surface() {
    _Screens.graph.popTo(Admin.adminAuditLog);
    return const AdminAuditLogNav._();
  }

  AdminNav pop() {
    _Screens.graph.pop();
    return const AdminNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(AdminAuditLogPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AdminAuditLogPop<N extends AnyNav> {
  const AdminAuditLogPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const admin = AdminAuditLogPop<AdminNav>._(Admin.admin, AdminNav._());
  static const settings = AdminAuditLogPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class AdminRoleNav extends AnyPlacement {
  const AdminRoleNav._() : super._();
  AdminRoleNav surface() {
    _Screens.graph.popTo(Admin.adminRole);
    return const AdminRoleNav._();
  }

  AdminUserNav pop() {
    _Screens.graph.pop();
    return const AdminUserNav._();
  }

  AdminUsersNav popToAdminUsers() {
    _Screens.graph.pop(Admin.adminUsers);
    return const AdminUsersNav._();
  }

  AdminNav popToAdmin() {
    _Screens.graph.pop(Admin.admin);
    return const AdminNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(AdminRolePop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AdminRolePop<N extends AnyNav> {
  const AdminRolePop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const adminUser = AdminRolePop<AdminUserNav>._(
    Admin.adminUser,
    AdminUserNav._(),
  );
  static const adminUsers = AdminRolePop<AdminUsersNav>._(
    Admin.adminUsers,
    AdminUsersNav._(),
  );
  static const admin = AdminRolePop<AdminNav>._(Admin.admin, AdminNav._());
  static const settings = AdminRolePop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class AdminFeatureFlagsNav extends AnyPlacement {
  const AdminFeatureFlagsNav._() : super._();
  AdminFeatureFlagsNav surface() {
    _Screens.graph.popTo(Admin.adminFeatureFlags);
    return const AdminFeatureFlagsNav._();
  }

  AdminNav pop() {
    _Screens.graph.pop();
    return const AdminNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(AdminFeatureFlagsPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class AdminFeatureFlagsPop<N extends AnyNav> {
  const AdminFeatureFlagsPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const admin = AdminFeatureFlagsPop<AdminNav>._(
    Admin.admin,
    AdminNav._(),
  );
  static const settings = AdminFeatureFlagsPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class WebhooksNav extends AnyPlacement implements PopDestPlacement {
  const WebhooksNav._() : super._();
  WebhooksNav surface() {
    _Screens.graph.popTo(Admin.webhooks);
    return const WebhooksNav._();
  }

  WebhookNav goWebhook(String id) {
    _Screens.graph.popTo(Admin.webhooks);
    _Screens.graph.go(Admin.webhook, id, true);
    return const WebhookNav._();
  }

  AdminNav pop() {
    _Screens.graph.pop();
    return const AdminNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(WebhooksPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class WebhooksPop<N extends AnyNav> {
  const WebhooksPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const admin = WebhooksPop<AdminNav>._(Admin.admin, AdminNav._());
  static const settings = WebhooksPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

final class WebhookNav extends AnyPlacement {
  const WebhookNav._() : super._();
  WebhookNav surface() {
    _Screens.graph.popTo(Admin.webhook);
    return const WebhookNav._();
  }

  WebhooksNav pop() {
    _Screens.graph.pop();
    return const WebhooksNav._();
  }

  AdminNav popToAdmin() {
    _Screens.graph.pop(Admin.admin);
    return const AdminNav._();
  }

  SettingsNav popToSettings() {
    _Screens.graph.pop(_Screens.settings);
    return const SettingsNav._();
  }

  N popTo<N extends AnyNav>(WebhookPop<N> to) {
    _Screens.graph.pop(to.spec);
    return _atOf(to.spec) as N;
  }
}

final class WebhookPop<N extends AnyNav> {
  const WebhookPop._(this.spec, this.nav);
  final Enum spec;
  final N? nav;
  static const webhooks = WebhookPop<WebhooksNav>._(
    Admin.webhooks,
    WebhooksNav._(),
  );
  static const admin = WebhookPop<AdminNav>._(Admin.admin, AdminNav._());
  static const settings = WebhookPop<SettingsNav>._(
    _Screens.settings,
    SettingsNav._(),
  );
}

extension type const ScreenId<I>._(Enum spec) {
  static const resetPassword = ScreenId<String>._(_Screens.resetPassword);
  static const story = ScreenId<String>._(_Screens.story);
  static const post = ScreenId<String>._(_Screens.post);
  static const comment = ScreenId<String>._(_Screens.comment);
  static const postAuthor = ScreenId<String>._(_Screens.postAuthor);
  static const postComments = ScreenId<String>._(_Screens.postComments);
  static const postLikes = ScreenId<String>._(_Screens.postLikes);
  static const editPost = ScreenId<String>._(_Screens.editPost);
  static const repost = ScreenId<String>._(_Screens.repost);
  static const topic = ScreenId<String>._(_Screens.topic);
  static const subtopic = ScreenId<String>._(_Screens.subtopic);
  static const hashtag = ScreenId<String>._(_Screens.hashtag);
  static const liveRoom = ScreenId<String>._(_Screens.liveRoom);
  static const category = ScreenId<String>._(_Screens.category);
  static const listing = ScreenId<String>._(_Screens.listing);
  static const listingVariant = ScreenId<String>._(_Screens.listingVariant);
  static const editListing = ScreenId<String>._(_Screens.editListing);
  static const sellerProfile = ScreenId<String>._(_Screens.sellerProfile);
  static const checkout = ScreenId<String>._(_Screens.checkout);
  static const orderConfirmation = ScreenId<String>._(
    _Screens.orderConfirmation,
  );
  static const order = ScreenId<String>._(_Screens.order);
  static const chat = ScreenId<String>._(_Screens.chat);
  static const thread = ScreenId<String>._(_Screens.thread);
  static const message = ScreenId<String>._(_Screens.message);
  static const messageReply = ScreenId<String>._(_Screens.messageReply);
  static const voiceCall = ScreenId<String>._(_Screens.voiceCall);
  static const groupChat = ScreenId<String>._(_Screens.groupChat);
  static const groupInfo = ScreenId<String>._(_Screens.groupInfo);
  static const account = ScreenId<String>._(_Screens.account);
  static const transaction = ScreenId<String>._(_Screens.transaction);
  static const transactionItem = ScreenId<String>._(_Screens.transactionItem);
  static const card = ScreenId<String>._(_Screens.card);
  static const statement = ScreenId<String>._(_Screens.statement);
  static const userProfile = ScreenId<String>._(_Screens.userProfile);
  static const followers = ScreenId<String>._(_Screens.followers);
  static const following = ScreenId<String>._(_Screens.following);
  static const connection = ScreenId<String>._(_Screens.connection);
  static const badge = ScreenId<String>._(_Screens.badge);
  static const helpCategory = ScreenId<String>._(_Screens.helpCategory);
  static const faqArticle = ScreenId<String>._(_Screens.faqArticle);
  static const device = ScreenId<String>._(_Screens.device);
  static const session = ScreenId<String>._(_Screens.session);
  static const project = ScreenId<String>._(_Screens.project);
  static const board = ScreenId<String>._(_Screens.board);
  static const taskList = ScreenId<String>._(_Screens.taskList);
  static const task = ScreenId<String>._(_Screens.task);
  static const subtask = ScreenId<String>._(_Screens.subtask);
  static const checklistItem = ScreenId<String>._(_Screens.checklistItem);
  static const editTask = ScreenId<String>._(_Screens.editTask);
  static const taskComment = ScreenId<String>._(_Screens.taskComment);
  static const assignee = ScreenId<String>._(_Screens.assignee);
  static const label = ScreenId<String>._(_Screens.label);
  static const milestone = ScreenId<String>._(_Screens.milestone);
  static const sprint = ScreenId<String>._(_Screens.sprint);
  static const forumCategory = ScreenId<String>._(_Screens.forumCategory);
  static const forumThread = ScreenId<String>._(_Screens.forumThread);
  static const forumReply = ScreenId<String>._(_Screens.forumReply);
  static const reportThread = ScreenId<String>._(_Screens.reportThread);
  static const course = ScreenId<String>._(_Screens.course);
  static const courseModule = ScreenId<String>._(_Screens.courseModule);
  static const lesson = ScreenId<String>._(_Screens.lesson);
  static const quiz = ScreenId<String>._(_Screens.quiz);
  static const question = ScreenId<String>._(_Screens.question);
  static const answer = ScreenId<String>._(_Screens.answer);
  static const courseReview = ScreenId<String>._(_Screens.courseReview);
  static const instructor = ScreenId<String>._(_Screens.instructor);
  static const certificate = ScreenId<String>._(_Screens.certificate);
  static const shopDept = ScreenId<String>._(_Screens.shopDept);
  static const shopCategory = ScreenId<String>._(_Screens.shopCategory);
  static const shopSubcategory = ScreenId<String>._(_Screens.shopSubcategory);
  static const product = ScreenId<String>._(_Screens.product);
  static const productVariant = ScreenId<String>._(_Screens.productVariant);
  static const productReview = ScreenId<String>._(_Screens.productReview);
  static const brand = ScreenId<String>._(_Screens.brand);
  static const workout = ScreenId<String>._(_Screens.workout);
  static const exercise = ScreenId<String>._(_Screens.exercise);
  static const exerciseSet = ScreenId<String>._(_Screens.exerciseSet);
  static const levelA = ScreenId<String>._(_Screens.levelA);
  static const levelB = ScreenId<String>._(_Screens.levelB);
  static const levelC = ScreenId<String>._(_Screens.levelC);
  static const levelD = ScreenId<String>._(_Screens.levelD);
  static const levelE = ScreenId<String>._(_Screens.levelE);
  static const levelF = ScreenId<String>._(_Screens.levelF);
  static const scheduledPost = ScreenId<String>._(CreatorStudio.scheduledPost);
  static const editScheduled = ScreenId<String>._(CreatorStudio.editScheduled);
  static const event = ScreenId<String>._(Events.event);
  static const attendees = ScreenId<String>._(Events.attendees);
  static const editEvent = ScreenId<String>._(Events.editEvent);
  static const tickets = ScreenId<String>._(Events.tickets);
  static const supportTicket = ScreenId<String>._(Support.supportTicket);
  static const article = ScreenId<String>._(Support.article);
  static const adminUser = ScreenId<String>._(Admin.adminUser);
  static const adminRole = ScreenId<String>._(Admin.adminRole);
  static const webhook = ScreenId<String>._(Admin.webhook);
}

extension ScreenIdOf on BuildContext {
  I idOf<I>(ScreenId<I> screen) => ScreenScope.idOf<I>(this, screen.spec);

  /// The screen this widget belongs to (its enclosing scope).
  Screen<Object?> get screen => Screen._forSpec(ScreenScope.of(this));
}

void verifyScreens() {
  assert(() {
    assert(
      _Screens.splash.id == null,
      'splash has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.signIn.id == null,
      'signIn has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.signUp.id == null,
      'signUp has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.onboarding.id == null,
      'onboarding has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.forgotPassword.id == null,
      'forgotPassword has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.resetPassword.id != null,
      'resetPassword is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.verifyEmail.id == null,
      'verifyEmail has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.twoFactor.id == null,
      'twoFactor has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.home.id == null,
      'home has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.feed.id == null,
      'feed has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.composePost.id == null,
      'composePost has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.story.id != null,
      'story is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.post.id != null,
      'post is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.comment.id != null,
      'comment is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.postAuthor.id != null,
      'postAuthor is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.postComments.id != null,
      'postComments is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.postLikes.id != null,
      'postLikes is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.editPost.id != null,
      'editPost is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.repost.id != null,
      'repost is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.discover.id == null,
      'discover has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.trending.id == null,
      'trending has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.topics.id == null,
      'topics has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.topic.id != null,
      'topic is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.subtopic.id != null,
      'subtopic is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.hashtag.id != null,
      'hashtag is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.liveNow.id == null,
      'liveNow has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.liveRoom.id != null,
      'liveRoom is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.nearby.id == null,
      'nearby has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.marketplace.id == null,
      'marketplace has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.categories.id == null,
      'categories has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.category.id != null,
      'category is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.listing.id != null,
      'listing is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.listingVariant.id != null,
      'listingVariant is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.editListing.id != null,
      'editListing is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.sellerProfile.id != null,
      'sellerProfile is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.cart.id == null,
      'cart has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.checkout.id != null,
      'checkout is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.orderConfirmation.id != null,
      'orderConfirmation is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.myOrders.id == null,
      'myOrders has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.order.id != null,
      'order is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.wishlist.id == null,
      'wishlist has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.messages.id == null,
      'messages has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.chats.id == null,
      'chats has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.chat.id != null,
      'chat is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.thread.id != null,
      'thread is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.message.id != null,
      'message is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.messageReply.id != null,
      'messageReply is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.voiceCall.id != null,
      'voiceCall is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.newChat.id == null,
      'newChat has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.groupChat.id != null,
      'groupChat is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.groupInfo.id != null,
      'groupInfo is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.wallet.id == null,
      'wallet has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.balance.id == null,
      'balance has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.accounts.id == null,
      'accounts has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.account.id != null,
      'account is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.transactions.id == null,
      'transactions has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.transaction.id != null,
      'transaction is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.transactionItem.id != null,
      'transactionItem is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.sendMoney.id == null,
      'sendMoney has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.receiveMoney.id == null,
      'receiveMoney has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.paymentMethods.id == null,
      'paymentMethods has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.addCard.id == null,
      'addCard has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.card.id != null,
      'card is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.statements.id == null,
      'statements has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.statement.id != null,
      'statement is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.profile.id == null,
      'profile has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.userProfile.id != null,
      'userProfile is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.followers.id != null,
      'followers is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.following.id != null,
      'following is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.connection.id != null,
      'connection is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.mutualConnections.id == null,
      'mutualConnections has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.editProfile.id == null,
      'editProfile has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.achievements.id == null,
      'achievements has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.badges.id == null,
      'badges has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.badge.id != null,
      'badge is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.savedPosts.id == null,
      'savedPosts has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.drafts.id == null,
      'drafts has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.myListings.id == null,
      'myListings has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.notifications.id == null,
      'notifications has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.notificationSettings.id == null,
      'notificationSettings has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.search.id == null,
      'search has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.searchResults.id == null,
      'searchResults has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.settings.id == null,
      'settings has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.accountSettings.id == null,
      'accountSettings has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.security.id == null,
      'security has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.twoFactorSettings.id == null,
      'twoFactorSettings has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.privacy.id == null,
      'privacy has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.appearance.id == null,
      'appearance has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.language.id == null,
      'language has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.connectedApps.id == null,
      'connectedApps has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.about.id == null,
      'about has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.help.id == null,
      'help has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.helpCategory.id != null,
      'helpCategory is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.faq.id == null,
      'faq has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.faqArticle.id != null,
      'faqArticle is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.feedback.id == null,
      'feedback has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.blockedUsers.id == null,
      'blockedUsers has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.devices.id == null,
      'devices has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.device.id != null,
      'device is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.sessions.id == null,
      'sessions has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.session.id != null,
      'session is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.dataExport.id == null,
      'dataExport has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.deleteAccount.id == null,
      'deleteAccount has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.workspace.id == null,
      'workspace has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.project.id != null,
      'project is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.board.id != null,
      'board is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.taskList.id != null,
      'taskList is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.task.id != null,
      'task is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.subtask.id != null,
      'subtask is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.checklistItem.id != null,
      'checklistItem is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.editTask.id != null,
      'editTask is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.taskComment.id != null,
      'taskComment is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.assignee.id != null,
      'assignee is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.label.id != null,
      'label is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.milestone.id != null,
      'milestone is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.sprint.id != null,
      'sprint is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.forum.id == null,
      'forum has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.forumCategory.id != null,
      'forumCategory is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.forumThread.id != null,
      'forumThread is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.forumReply.id != null,
      'forumReply is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.reportThread.id != null,
      'reportThread is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.learn.id == null,
      'learn has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.course.id != null,
      'course is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.courseModule.id != null,
      'courseModule is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.lesson.id != null,
      'lesson is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.quiz.id != null,
      'quiz is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.question.id != null,
      'question is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.answer.id != null,
      'answer is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.courseReview.id != null,
      'courseReview is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.instructor.id != null,
      'instructor is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.certificate.id != null,
      'certificate is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.shop.id == null,
      'shop has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.shopDept.id != null,
      'shopDept is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.shopCategory.id != null,
      'shopCategory is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.shopSubcategory.id != null,
      'shopSubcategory is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.product.id != null,
      'product is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.productVariant.id != null,
      'productVariant is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.productReview.id != null,
      'productReview is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.brand.id != null,
      'brand is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.compareProducts.id == null,
      'compareProducts has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.activity.id == null,
      'activity has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.workout.id != null,
      'workout is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.exercise.id != null,
      'exercise is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.exerciseSet.id != null,
      'exerciseSet is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.deepDemo.id == null,
      'deepDemo has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.levelA.id != null,
      'levelA is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.levelB.id != null,
      'levelB is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.levelC.id != null,
      'levelC is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.levelD.id != null,
      'levelD is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.levelE.id != null,
      'levelE is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.levelF.id != null,
      'levelF is missing its id codec — rerun build_runner',
    );
    assert(
      _Screens.integrations.id == null,
      'integrations has an unexpected id codec — rerun build_runner',
    );
    assert(
      _Screens.apiKeys.id == null,
      'apiKeys has an unexpected id codec — rerun build_runner',
    );
    assert(
      CreatorStudio.studio.id == null,
      'studio has an unexpected id codec — rerun build_runner',
    );
    assert(
      CreatorStudio.analytics.id == null,
      'analytics has an unexpected id codec — rerun build_runner',
    );
    assert(
      CreatorStudio.audience.id == null,
      'audience has an unexpected id codec — rerun build_runner',
    );
    assert(
      CreatorStudio.scheduled.id == null,
      'scheduled has an unexpected id codec — rerun build_runner',
    );
    assert(
      CreatorStudio.scheduledPost.id != null,
      'scheduledPost is missing its id codec — rerun build_runner',
    );
    assert(
      CreatorStudio.editScheduled.id != null,
      'editScheduled is missing its id codec — rerun build_runner',
    );
    assert(
      CreatorStudio.monetization.id == null,
      'monetization has an unexpected id codec — rerun build_runner',
    );
    assert(
      CreatorStudio.payouts.id == null,
      'payouts has an unexpected id codec — rerun build_runner',
    );
    assert(
      Events.events.id == null,
      'events has an unexpected id codec — rerun build_runner',
    );
    assert(
      Events.event.id != null,
      'event is missing its id codec — rerun build_runner',
    );
    assert(
      Events.attendees.id != null,
      'attendees is missing its id codec — rerun build_runner',
    );
    assert(
      Events.editEvent.id != null,
      'editEvent is missing its id codec — rerun build_runner',
    );
    assert(
      Events.createEvent.id == null,
      'createEvent has an unexpected id codec — rerun build_runner',
    );
    assert(
      Events.tickets.id != null,
      'tickets is missing its id codec — rerun build_runner',
    );
    assert(
      Support.support.id == null,
      'support has an unexpected id codec — rerun build_runner',
    );
    assert(
      Support.supportTickets.id == null,
      'supportTickets has an unexpected id codec — rerun build_runner',
    );
    assert(
      Support.supportTicket.id != null,
      'supportTicket is missing its id codec — rerun build_runner',
    );
    assert(
      Support.newTicket.id == null,
      'newTicket has an unexpected id codec — rerun build_runner',
    );
    assert(
      Support.knowledgeBase.id == null,
      'knowledgeBase has an unexpected id codec — rerun build_runner',
    );
    assert(
      Support.article.id != null,
      'article is missing its id codec — rerun build_runner',
    );
    assert(
      Admin.admin.id == null,
      'admin has an unexpected id codec — rerun build_runner',
    );
    assert(
      Admin.adminUsers.id == null,
      'adminUsers has an unexpected id codec — rerun build_runner',
    );
    assert(
      Admin.adminUser.id != null,
      'adminUser is missing its id codec — rerun build_runner',
    );
    assert(
      Admin.adminAuditLog.id == null,
      'adminAuditLog has an unexpected id codec — rerun build_runner',
    );
    assert(
      Admin.adminRole.id != null,
      'adminRole is missing its id codec — rerun build_runner',
    );
    assert(
      Admin.adminFeatureFlags.id == null,
      'adminFeatureFlags has an unexpected id codec — rerun build_runner',
    );
    assert(
      Admin.webhooks.id == null,
      'webhooks has an unexpected id codec — rerun build_runner',
    );
    assert(
      Admin.webhook.id != null,
      'webhook is missing its id codec — rerun build_runner',
    );
    return true;
  }());
}

bool _endsWith(List<Enum> chain, List<Enum> suffix) {
  if (chain.length < suffix.length) return false;
  final off = chain.length - suffix.length;
  for (var i = 0; i < suffix.length; i++) {
    if (chain[off + i] != suffix[i]) return false;
  }
  return true;
}

/// A URL the app understands: a [Place] or a [Link]. Build one with
/// `Url.<route>…` and `.toUri([domain])`; `parseUrl` returns one.
sealed class Url {
  const Url([this.domain]);
  Uri toUri([String? domain]);

  /// The inbound origin (`scheme://host[:port]`) when this came from
  /// `parseUrl` (read it in `Screen.resolver`); null when built locally.
  final String? domain;
  static _WLSplash get splash => _WLSplash._([_Screens.splash], [null]);
  static _WLSignIn get signIn => _WLSignIn._([_Screens.signIn], [null]);
  static _WLSignUp get signUp => _WLSignUp._([_Screens.signUp], [null]);
  static _WLOnboarding get onboarding =>
      _WLOnboarding._([_Screens.onboarding], [null]);
  static _WLForgotPassword get forgotPassword =>
      _WLForgotPassword._([_Screens.forgotPassword], [null]);
  static _WLForgotPasswordResetPassword resetPassword(String id) =>
      _WLForgotPasswordResetPassword._(
        [_Screens.forgotPassword, _Screens.resetPassword],
        [null, id],
      );
  static _WLVerifyEmail get verifyEmail =>
      _WLVerifyEmail._([_Screens.verifyEmail], [null]);
  static _WLTwoFactor get twoFactor =>
      _WLTwoFactor._([_Screens.twoFactor], [null]);
  static _WLHome get home => _WLHome._([_Screens.home], [null]);
  static _WLHomeFeed get feed =>
      _WLHomeFeed._([_Screens.home, _Screens.feed], [null, null]);
  static _WLHomeFeedComposePost get composePost => _WLHomeFeedComposePost._(
    [_Screens.home, _Screens.feed, _Screens.composePost],
    [null, null, null],
  );
  static _WLHomeFeedStory story(String id) => _WLHomeFeedStory._(
    [_Screens.home, _Screens.feed, _Screens.story],
    [null, null, id],
  );
  static _WLHomeFeedPost post(String id) => _WLHomeFeedPost._(
    [_Screens.home, _Screens.feed, _Screens.post],
    [null, null, id],
  );
  static _WLHomeFeedPostPostComments postComments(String id) =>
      _WLHomeFeedPostPostComments._(
        [_Screens.home, _Screens.feed, _Screens.post, _Screens.postComments],
        [null, null, id, null],
      );
  static _WLHomeFeedPostPostLikes postLikes(String id) =>
      _WLHomeFeedPostPostLikes._(
        [_Screens.home, _Screens.feed, _Screens.post, _Screens.postLikes],
        [null, null, id, null],
      );
  static _WLHomeFeedPostEditPost editPost(String id) =>
      _WLHomeFeedPostEditPost._(
        [_Screens.home, _Screens.feed, _Screens.post, _Screens.editPost],
        [null, null, id, null],
      );
  static _WLHomeFeedPostRepost repost(String id) => _WLHomeFeedPostRepost._(
    [_Screens.home, _Screens.feed, _Screens.post, _Screens.repost],
    [null, null, id, null],
  );
  static _WLDiscover get discover => _WLDiscover._([_Screens.discover], [null]);
  static _WLDiscoverTrending get trending => _WLDiscoverTrending._(
    [_Screens.discover, _Screens.trending],
    [null, null],
  );
  static _WLDiscoverTopics get topics =>
      _WLDiscoverTopics._([_Screens.discover, _Screens.topics], [null, null]);
  static _WLDiscoverTrendingTopic topic(String id) =>
      _WLDiscoverTrendingTopic._(
        [_Screens.discover, _Screens.trending, _Screens.topic],
        [null, null, id],
      );
  static _WLDiscoverTrendingHashtag hashtag(String id) =>
      _WLDiscoverTrendingHashtag._(
        [_Screens.discover, _Screens.trending, _Screens.hashtag],
        [null, null, id],
      );
  static _WLDiscoverLiveNow get liveNow =>
      _WLDiscoverLiveNow._([_Screens.discover, _Screens.liveNow], [null, null]);
  static _WLDiscoverLiveNowLiveRoom liveRoom(String id) =>
      _WLDiscoverLiveNowLiveRoom._(
        [_Screens.discover, _Screens.liveNow, _Screens.liveRoom],
        [null, null, id],
      );
  static _WLDiscoverNearby get nearby =>
      _WLDiscoverNearby._([_Screens.discover, _Screens.nearby], [null, null]);
  static _WLMarketplace get marketplace =>
      _WLMarketplace._([_Screens.marketplace], [null]);
  static _WLMarketplaceCategories get categories => _WLMarketplaceCategories._(
    [_Screens.marketplace, _Screens.categories],
    [null, null],
  );
  static _WLMarketplaceCategoriesCategory category(String id) =>
      _WLMarketplaceCategoriesCategory._(
        [_Screens.marketplace, _Screens.categories, _Screens.category],
        [null, null, id],
      );
  static _WLMarketplaceCart get cart =>
      _WLMarketplaceCart._([_Screens.marketplace, _Screens.cart], [null, null]);
  static _WLMarketplaceCartCheckout checkout(String id) =>
      _WLMarketplaceCartCheckout._(
        [_Screens.marketplace, _Screens.cart, _Screens.checkout],
        [null, null, id],
      );
  static _WLMarketplaceMyOrders get myOrders => _WLMarketplaceMyOrders._(
    [_Screens.marketplace, _Screens.myOrders],
    [null, null],
  );
  static _WLMarketplaceMyOrdersOrder order(String id) =>
      _WLMarketplaceMyOrdersOrder._(
        [_Screens.marketplace, _Screens.myOrders, _Screens.order],
        [null, null, id],
      );
  static _WLMarketplaceWishlist get wishlist => _WLMarketplaceWishlist._(
    [_Screens.marketplace, _Screens.wishlist],
    [null, null],
  );
  static _WLMessages get messages => _WLMessages._([_Screens.messages], [null]);
  static _WLMessagesChats get chats =>
      _WLMessagesChats._([_Screens.messages, _Screens.chats], [null, null]);
  static _WLMessagesChatsChat chat(String id) => _WLMessagesChatsChat._(
    [_Screens.messages, _Screens.chats, _Screens.chat],
    [null, null, id],
  );
  static _WLMessagesChatsChatVoiceCall voiceCall(String id) =>
      _WLMessagesChatsChatVoiceCall._(
        [_Screens.messages, _Screens.chats, _Screens.chat, _Screens.voiceCall],
        [null, null, id, null],
      );
  static _WLMessagesNewChat get newChat =>
      _WLMessagesNewChat._([_Screens.messages, _Screens.newChat], [null, null]);
  static _WLMessagesGroupChat groupChat(String id) => _WLMessagesGroupChat._(
    [_Screens.messages, _Screens.groupChat],
    [null, id],
  );
  static _WLMessagesGroupChatGroupInfo groupInfo(String id) =>
      _WLMessagesGroupChatGroupInfo._(
        [_Screens.messages, _Screens.groupChat, _Screens.groupInfo],
        [null, id, null],
      );
  static _WLWallet get wallet => _WLWallet._([_Screens.wallet], [null]);
  static _WLWalletBalance get balance =>
      _WLWalletBalance._([_Screens.wallet, _Screens.balance], [null, null]);
  static _WLWalletAccounts get accounts =>
      _WLWalletAccounts._([_Screens.wallet, _Screens.accounts], [null, null]);
  static _WLWalletAccountsAccount account(String id) =>
      _WLWalletAccountsAccount._(
        [_Screens.wallet, _Screens.accounts, _Screens.account],
        [null, null, id],
      );
  static _WLWalletSendMoney get sendMoney =>
      _WLWalletSendMoney._([_Screens.wallet, _Screens.sendMoney], [null, null]);
  static _WLWalletReceiveMoney get receiveMoney => _WLWalletReceiveMoney._(
    [_Screens.wallet, _Screens.receiveMoney],
    [null, null],
  );
  static _WLWalletPaymentMethods get paymentMethods =>
      _WLWalletPaymentMethods._(
        [_Screens.wallet, _Screens.paymentMethods],
        [null, null],
      );
  static _WLWalletPaymentMethodsAddCard get addCard =>
      _WLWalletPaymentMethodsAddCard._(
        [_Screens.wallet, _Screens.paymentMethods, _Screens.addCard],
        [null, null, null],
      );
  static _WLWalletPaymentMethodsCard card(String id) =>
      _WLWalletPaymentMethodsCard._(
        [_Screens.wallet, _Screens.paymentMethods, _Screens.card],
        [null, null, id],
      );
  static _WLProfile get profile => _WLProfile._([_Screens.profile], [null]);
  static _WLProfileFollowers followers(String id) =>
      _WLProfileFollowers._([_Screens.profile, _Screens.followers], [null, id]);
  static _WLProfileFollowing following(String id) =>
      _WLProfileFollowing._([_Screens.profile, _Screens.following], [null, id]);
  static _WLProfileEditProfile get editProfile => _WLProfileEditProfile._(
    [_Screens.profile, _Screens.editProfile],
    [null, null],
  );
  static _WLProfileAchievements get achievements => _WLProfileAchievements._(
    [_Screens.profile, _Screens.achievements],
    [null, null],
  );
  static _WLProfileBadges get badges =>
      _WLProfileBadges._([_Screens.profile, _Screens.badges], [null, null]);
  static _WLProfileBadgesBadge badge(String id) => _WLProfileBadgesBadge._(
    [_Screens.profile, _Screens.badges, _Screens.badge],
    [null, null, id],
  );
  static _WLProfileSavedPosts get savedPosts => _WLProfileSavedPosts._(
    [_Screens.profile, _Screens.savedPosts],
    [null, null],
  );
  static _WLProfileDrafts get drafts =>
      _WLProfileDrafts._([_Screens.profile, _Screens.drafts], [null, null]);
  static _WLProfileMyListings get myListings => _WLProfileMyListings._(
    [_Screens.profile, _Screens.myListings],
    [null, null],
  );
  static _WLNotifications get notifications =>
      _WLNotifications._([_Screens.notifications], [null]);
  static _WLNotificationsNotificationSettings get notificationSettings =>
      _WLNotificationsNotificationSettings._(
        [_Screens.notifications, _Screens.notificationSettings],
        [null, null],
      );
  static _WLSearch get search => _WLSearch._([_Screens.search], [null]);
  static _WLSearchSearchResults get searchResults => _WLSearchSearchResults._(
    [_Screens.search, _Screens.searchResults],
    [null, null],
  );
  static _WLSettings get settings => _WLSettings._([_Screens.settings], [null]);
  static _WLSettingsAccountSettings get accountSettings =>
      _WLSettingsAccountSettings._(
        [_Screens.settings, _Screens.accountSettings],
        [null, null],
      );
  static _WLSettingsSecurity get security => _WLSettingsSecurity._(
    [_Screens.settings, _Screens.security],
    [null, null],
  );
  static _WLSettingsSecurityTwoFactorSettings get twoFactorSettings =>
      _WLSettingsSecurityTwoFactorSettings._(
        [_Screens.settings, _Screens.security, _Screens.twoFactorSettings],
        [null, null, null],
      );
  static _WLSettingsPrivacy get privacy =>
      _WLSettingsPrivacy._([_Screens.settings, _Screens.privacy], [null, null]);
  static _WLSettingsAppearance get appearance => _WLSettingsAppearance._(
    [_Screens.settings, _Screens.appearance],
    [null, null],
  );
  static _WLSettingsLanguage get language => _WLSettingsLanguage._(
    [_Screens.settings, _Screens.language],
    [null, null],
  );
  static _WLSettingsConnectedApps get connectedApps =>
      _WLSettingsConnectedApps._(
        [_Screens.settings, _Screens.connectedApps],
        [null, null],
      );
  static _WLSettingsAbout get about =>
      _WLSettingsAbout._([_Screens.settings, _Screens.about], [null, null]);
  static _WLSettingsAboutHelp get help => _WLSettingsAboutHelp._(
    [_Screens.settings, _Screens.about, _Screens.help],
    [null, null, null],
  );
  static _WLSettingsAboutHelpHelpCategory helpCategory(String id) =>
      _WLSettingsAboutHelpHelpCategory._(
        [
          _Screens.settings,
          _Screens.about,
          _Screens.help,
          _Screens.helpCategory,
        ],
        [null, null, null, id],
      );
  static _WLSettingsAboutFeedback get feedback => _WLSettingsAboutFeedback._(
    [_Screens.settings, _Screens.about, _Screens.feedback],
    [null, null, null],
  );
  static _WLSettingsBlockedUsers get blockedUsers => _WLSettingsBlockedUsers._(
    [_Screens.settings, _Screens.blockedUsers],
    [null, null],
  );
  static _WLSettingsDevices get devices =>
      _WLSettingsDevices._([_Screens.settings, _Screens.devices], [null, null]);
  static _WLSettingsDevicesDevice device(String id) =>
      _WLSettingsDevicesDevice._(
        [_Screens.settings, _Screens.devices, _Screens.device],
        [null, null, id],
      );
  static _WLSettingsDataExport get dataExport => _WLSettingsDataExport._(
    [_Screens.settings, _Screens.dataExport],
    [null, null],
  );
  static _WLSettingsDeleteAccount get deleteAccount =>
      _WLSettingsDeleteAccount._(
        [_Screens.settings, _Screens.deleteAccount],
        [null, null],
      );
  static _WLWorkspace get workspace =>
      _WLWorkspace._([_Screens.workspace], [null]);
  static _WLWorkspaceProject project(String id) =>
      _WLWorkspaceProject._([_Screens.workspace, _Screens.project], [null, id]);
  static _WLForum get forum => _WLForum._([_Screens.forum], [null]);
  static _WLForumForumCategory forumCategory(String id) =>
      _WLForumForumCategory._(
        [_Screens.forum, _Screens.forumCategory],
        [null, id],
      );
  static _WLLearn get learn => _WLLearn._([_Screens.learn], [null]);
  static _WLLearnCourse course(String id) =>
      _WLLearnCourse._([_Screens.learn, _Screens.course], [null, id]);
  static _WLLearnCourseCertificate certificate(String id) =>
      _WLLearnCourseCertificate._(
        [_Screens.learn, _Screens.course, _Screens.certificate],
        [null, id, null],
      );
  static _WLShop get shop => _WLShop._([_Screens.shop], [null]);
  static _WLShopShopDept shopDept(String id) =>
      _WLShopShopDept._([_Screens.shop, _Screens.shopDept], [null, id]);
  static _WLShopCompareProducts get compareProducts => _WLShopCompareProducts._(
    [_Screens.shop, _Screens.compareProducts],
    [null, null],
  );
  static _WLActivity get activity => _WLActivity._([_Screens.activity], [null]);
  static _WLActivityWorkout workout(String id) =>
      _WLActivityWorkout._([_Screens.activity, _Screens.workout], [null, id]);
  static _WLDeepDemo get deepDemo => _WLDeepDemo._([_Screens.deepDemo], [null]);
  static _WLDeepDemoLevelA levelA(String id) =>
      _WLDeepDemoLevelA._([_Screens.deepDemo, _Screens.levelA], [null, id]);
  static _WLSettingsIntegrations get integrations => _WLSettingsIntegrations._(
    [_Screens.settings, _Screens.integrations],
    [null, null],
  );
  static _WLSettingsIntegrationsApiKeys get apiKeys =>
      _WLSettingsIntegrationsApiKeys._(
        [_Screens.settings, _Screens.integrations, _Screens.apiKeys],
        [null, null, null],
      );
  static _WLHomeStudio get studio =>
      _WLHomeStudio._([_Screens.home, CreatorStudio.studio], [null, null]);
  static _WLHomeStudioAnalytics get analytics => _WLHomeStudioAnalytics._(
    [_Screens.home, CreatorStudio.studio, CreatorStudio.analytics],
    [null, null, null],
  );
  static _WLHomeStudioAnalyticsAudience get audience =>
      _WLHomeStudioAnalyticsAudience._(
        [
          _Screens.home,
          CreatorStudio.studio,
          CreatorStudio.analytics,
          CreatorStudio.audience,
        ],
        [null, null, null, null],
      );
  static _WLHomeStudioScheduled get scheduled => _WLHomeStudioScheduled._(
    [_Screens.home, CreatorStudio.studio, CreatorStudio.scheduled],
    [null, null, null],
  );
  static _WLHomeStudioScheduledScheduledPost scheduledPost(String id) =>
      _WLHomeStudioScheduledScheduledPost._(
        [
          _Screens.home,
          CreatorStudio.studio,
          CreatorStudio.scheduled,
          CreatorStudio.scheduledPost,
        ],
        [null, null, null, id],
      );
  static _WLHomeStudioScheduledScheduledPostEditScheduled editScheduled(
    String id,
  ) => _WLHomeStudioScheduledScheduledPostEditScheduled._(
    [
      _Screens.home,
      CreatorStudio.studio,
      CreatorStudio.scheduled,
      CreatorStudio.scheduledPost,
      CreatorStudio.editScheduled,
    ],
    [null, null, null, id, null],
  );
  static _WLHomeStudioMonetization get monetization =>
      _WLHomeStudioMonetization._(
        [_Screens.home, CreatorStudio.studio, CreatorStudio.monetization],
        [null, null, null],
      );
  static _WLHomeStudioMonetizationPayouts get payouts =>
      _WLHomeStudioMonetizationPayouts._(
        [
          _Screens.home,
          CreatorStudio.studio,
          CreatorStudio.monetization,
          CreatorStudio.payouts,
        ],
        [null, null, null, null],
      );
  static _WLDiscoverEvents get events =>
      _WLDiscoverEvents._([_Screens.discover, Events.events], [null, null]);
  static _WLDiscoverEventsEvent event(String id) => _WLDiscoverEventsEvent._(
    [_Screens.discover, Events.events, Events.event],
    [null, null, id],
  );
  static _WLDiscoverEventsEventAttendees attendees(String id) =>
      _WLDiscoverEventsEventAttendees._(
        [_Screens.discover, Events.events, Events.event, Events.attendees],
        [null, null, id, null],
      );
  static _WLDiscoverEventsEventEditEvent editEvent(String id) =>
      _WLDiscoverEventsEventEditEvent._(
        [_Screens.discover, Events.events, Events.event, Events.editEvent],
        [null, null, id, null],
      );
  static _WLDiscoverEventsCreateEvent get createEvent =>
      _WLDiscoverEventsCreateEvent._(
        [_Screens.discover, Events.events, Events.createEvent],
        [null, null, null],
      );
  static _WLDiscoverEventsEventTickets tickets(String id) =>
      _WLDiscoverEventsEventTickets._(
        [_Screens.discover, Events.events, Events.event, Events.tickets],
        [null, null, id, null],
      );
  static _WLSettingsSupport get support =>
      _WLSettingsSupport._([_Screens.settings, Support.support], [null, null]);
  static _WLSettingsSupportSupportTickets get supportTickets =>
      _WLSettingsSupportSupportTickets._(
        [_Screens.settings, Support.support, Support.supportTickets],
        [null, null, null],
      );
  static _WLSettingsSupportSupportTicketsSupportTicket supportTicket(
    String id,
  ) => _WLSettingsSupportSupportTicketsSupportTicket._(
    [
      _Screens.settings,
      Support.support,
      Support.supportTickets,
      Support.supportTicket,
    ],
    [null, null, null, id],
  );
  static _WLSettingsSupportNewTicket get newTicket =>
      _WLSettingsSupportNewTicket._(
        [_Screens.settings, Support.support, Support.newTicket],
        [null, null, null],
      );
  static _WLSettingsSupportKnowledgeBase get knowledgeBase =>
      _WLSettingsSupportKnowledgeBase._(
        [_Screens.settings, Support.support, Support.knowledgeBase],
        [null, null, null],
      );
  static _WLSettingsSupportKnowledgeBaseArticle article(String id) =>
      _WLSettingsSupportKnowledgeBaseArticle._(
        [
          _Screens.settings,
          Support.support,
          Support.knowledgeBase,
          Support.article,
        ],
        [null, null, null, id],
      );
  static _WLSettingsAdmin get admin =>
      _WLSettingsAdmin._([_Screens.settings, Admin.admin], [null, null]);
  static _WLSettingsAdminAdminUsers get adminUsers =>
      _WLSettingsAdminAdminUsers._(
        [_Screens.settings, Admin.admin, Admin.adminUsers],
        [null, null, null],
      );
  static _WLSettingsAdminAdminUsersAdminUser adminUser(String id) =>
      _WLSettingsAdminAdminUsersAdminUser._(
        [_Screens.settings, Admin.admin, Admin.adminUsers, Admin.adminUser],
        [null, null, null, id],
      );
  static _WLSettingsAdminAdminAuditLog get adminAuditLog =>
      _WLSettingsAdminAdminAuditLog._(
        [_Screens.settings, Admin.admin, Admin.adminAuditLog],
        [null, null, null],
      );
  static _WLSettingsAdminAdminFeatureFlags get adminFeatureFlags =>
      _WLSettingsAdminAdminFeatureFlags._(
        [_Screens.settings, Admin.admin, Admin.adminFeatureFlags],
        [null, null, null],
      );
  static _WLSettingsAdminWebhooks get webhooks => _WLSettingsAdminWebhooks._(
    [_Screens.settings, Admin.admin, Admin.webhooks],
    [null, null, null],
  );
  static _WLSettingsAdminWebhooksWebhook webhook(String id) =>
      _WLSettingsAdminWebhooksWebhook._(
        [_Screens.settings, Admin.admin, Admin.webhooks, Admin.webhook],
        [null, null, null, id],
      );
  static _LXUserProfile get userProfile =>
      _LXUserProfile(const <Object?>[], const <int>[]);
  static _LXListing get listing => _LXListing(const <Object?>[], const <int>[]);
  static _LXProduct get product => _LXProduct(const <Object?>[], const <int>[]);
  static _LXTask get task => _LXTask(const <Object?>[], const <int>[]);
}

/// A POSITION in the tree — a screen with a widget to present and a nav
/// destination. Go-able: every `Place` is a [Hop], so `Screen.go(place)`
/// replays its root-down chain and lands the placement. Built root-down
/// (`Place.home.item(id)`); a parsed nav-mirror URL is one.
sealed class Place extends Url implements Hop<AnyNav> {
  const Place([super.domain]);
  @override
  List<(Enum, Object?)> get chain;
  @override
  Enum get spec => chain.last.$1;
  @override
  Object? get id => chain.last.$2;
  @override
  AnyNav get nav => _atOf(_Screens.graph.current);
  static _WLSplash get splash => _WLSplash._([_Screens.splash], [null]);
  static _WLSignIn get signIn => _WLSignIn._([_Screens.signIn], [null]);
  static _WLSignUp get signUp => _WLSignUp._([_Screens.signUp], [null]);
  static _WLOnboarding get onboarding =>
      _WLOnboarding._([_Screens.onboarding], [null]);
  static _WLForgotPassword get forgotPassword =>
      _WLForgotPassword._([_Screens.forgotPassword], [null]);
  static _WLForgotPasswordResetPassword resetPassword(String id) =>
      _WLForgotPasswordResetPassword._(
        [_Screens.forgotPassword, _Screens.resetPassword],
        [null, id],
      );
  static _WLVerifyEmail get verifyEmail =>
      _WLVerifyEmail._([_Screens.verifyEmail], [null]);
  static _WLTwoFactor get twoFactor =>
      _WLTwoFactor._([_Screens.twoFactor], [null]);
  static _WLHome get home => _WLHome._([_Screens.home], [null]);
  static _WLHomeFeed get feed =>
      _WLHomeFeed._([_Screens.home, _Screens.feed], [null, null]);
  static _WLHomeFeedComposePost get composePost => _WLHomeFeedComposePost._(
    [_Screens.home, _Screens.feed, _Screens.composePost],
    [null, null, null],
  );
  static _WLHomeFeedStory story(String id) => _WLHomeFeedStory._(
    [_Screens.home, _Screens.feed, _Screens.story],
    [null, null, id],
  );
  static _WLHomeFeedPost post(String id) => _WLHomeFeedPost._(
    [_Screens.home, _Screens.feed, _Screens.post],
    [null, null, id],
  );
  static _WLHomeFeedPostPostComments postComments(String id) =>
      _WLHomeFeedPostPostComments._(
        [_Screens.home, _Screens.feed, _Screens.post, _Screens.postComments],
        [null, null, id, null],
      );
  static _WLHomeFeedPostPostLikes postLikes(String id) =>
      _WLHomeFeedPostPostLikes._(
        [_Screens.home, _Screens.feed, _Screens.post, _Screens.postLikes],
        [null, null, id, null],
      );
  static _WLHomeFeedPostEditPost editPost(String id) =>
      _WLHomeFeedPostEditPost._(
        [_Screens.home, _Screens.feed, _Screens.post, _Screens.editPost],
        [null, null, id, null],
      );
  static _WLHomeFeedPostRepost repost(String id) => _WLHomeFeedPostRepost._(
    [_Screens.home, _Screens.feed, _Screens.post, _Screens.repost],
    [null, null, id, null],
  );
  static _WLDiscover get discover => _WLDiscover._([_Screens.discover], [null]);
  static _WLDiscoverTrending get trending => _WLDiscoverTrending._(
    [_Screens.discover, _Screens.trending],
    [null, null],
  );
  static _WLDiscoverTopics get topics =>
      _WLDiscoverTopics._([_Screens.discover, _Screens.topics], [null, null]);
  static _WLDiscoverTrendingTopic topic(String id) =>
      _WLDiscoverTrendingTopic._(
        [_Screens.discover, _Screens.trending, _Screens.topic],
        [null, null, id],
      );
  static _WLDiscoverTrendingHashtag hashtag(String id) =>
      _WLDiscoverTrendingHashtag._(
        [_Screens.discover, _Screens.trending, _Screens.hashtag],
        [null, null, id],
      );
  static _WLDiscoverLiveNow get liveNow =>
      _WLDiscoverLiveNow._([_Screens.discover, _Screens.liveNow], [null, null]);
  static _WLDiscoverLiveNowLiveRoom liveRoom(String id) =>
      _WLDiscoverLiveNowLiveRoom._(
        [_Screens.discover, _Screens.liveNow, _Screens.liveRoom],
        [null, null, id],
      );
  static _WLDiscoverNearby get nearby =>
      _WLDiscoverNearby._([_Screens.discover, _Screens.nearby], [null, null]);
  static _WLMarketplace get marketplace =>
      _WLMarketplace._([_Screens.marketplace], [null]);
  static _WLMarketplaceCategories get categories => _WLMarketplaceCategories._(
    [_Screens.marketplace, _Screens.categories],
    [null, null],
  );
  static _WLMarketplaceCategoriesCategory category(String id) =>
      _WLMarketplaceCategoriesCategory._(
        [_Screens.marketplace, _Screens.categories, _Screens.category],
        [null, null, id],
      );
  static _WLMarketplaceCart get cart =>
      _WLMarketplaceCart._([_Screens.marketplace, _Screens.cart], [null, null]);
  static _WLMarketplaceCartCheckout checkout(String id) =>
      _WLMarketplaceCartCheckout._(
        [_Screens.marketplace, _Screens.cart, _Screens.checkout],
        [null, null, id],
      );
  static _WLMarketplaceMyOrders get myOrders => _WLMarketplaceMyOrders._(
    [_Screens.marketplace, _Screens.myOrders],
    [null, null],
  );
  static _WLMarketplaceMyOrdersOrder order(String id) =>
      _WLMarketplaceMyOrdersOrder._(
        [_Screens.marketplace, _Screens.myOrders, _Screens.order],
        [null, null, id],
      );
  static _WLMarketplaceWishlist get wishlist => _WLMarketplaceWishlist._(
    [_Screens.marketplace, _Screens.wishlist],
    [null, null],
  );
  static _WLMessages get messages => _WLMessages._([_Screens.messages], [null]);
  static _WLMessagesChats get chats =>
      _WLMessagesChats._([_Screens.messages, _Screens.chats], [null, null]);
  static _WLMessagesChatsChat chat(String id) => _WLMessagesChatsChat._(
    [_Screens.messages, _Screens.chats, _Screens.chat],
    [null, null, id],
  );
  static _WLMessagesChatsChatVoiceCall voiceCall(String id) =>
      _WLMessagesChatsChatVoiceCall._(
        [_Screens.messages, _Screens.chats, _Screens.chat, _Screens.voiceCall],
        [null, null, id, null],
      );
  static _WLMessagesNewChat get newChat =>
      _WLMessagesNewChat._([_Screens.messages, _Screens.newChat], [null, null]);
  static _WLMessagesGroupChat groupChat(String id) => _WLMessagesGroupChat._(
    [_Screens.messages, _Screens.groupChat],
    [null, id],
  );
  static _WLMessagesGroupChatGroupInfo groupInfo(String id) =>
      _WLMessagesGroupChatGroupInfo._(
        [_Screens.messages, _Screens.groupChat, _Screens.groupInfo],
        [null, id, null],
      );
  static _WLWallet get wallet => _WLWallet._([_Screens.wallet], [null]);
  static _WLWalletBalance get balance =>
      _WLWalletBalance._([_Screens.wallet, _Screens.balance], [null, null]);
  static _WLWalletAccounts get accounts =>
      _WLWalletAccounts._([_Screens.wallet, _Screens.accounts], [null, null]);
  static _WLWalletAccountsAccount account(String id) =>
      _WLWalletAccountsAccount._(
        [_Screens.wallet, _Screens.accounts, _Screens.account],
        [null, null, id],
      );
  static _WLWalletSendMoney get sendMoney =>
      _WLWalletSendMoney._([_Screens.wallet, _Screens.sendMoney], [null, null]);
  static _WLWalletReceiveMoney get receiveMoney => _WLWalletReceiveMoney._(
    [_Screens.wallet, _Screens.receiveMoney],
    [null, null],
  );
  static _WLWalletPaymentMethods get paymentMethods =>
      _WLWalletPaymentMethods._(
        [_Screens.wallet, _Screens.paymentMethods],
        [null, null],
      );
  static _WLWalletPaymentMethodsAddCard get addCard =>
      _WLWalletPaymentMethodsAddCard._(
        [_Screens.wallet, _Screens.paymentMethods, _Screens.addCard],
        [null, null, null],
      );
  static _WLWalletPaymentMethodsCard card(String id) =>
      _WLWalletPaymentMethodsCard._(
        [_Screens.wallet, _Screens.paymentMethods, _Screens.card],
        [null, null, id],
      );
  static _WLProfile get profile => _WLProfile._([_Screens.profile], [null]);
  static _WLProfileFollowers followers(String id) =>
      _WLProfileFollowers._([_Screens.profile, _Screens.followers], [null, id]);
  static _WLProfileFollowing following(String id) =>
      _WLProfileFollowing._([_Screens.profile, _Screens.following], [null, id]);
  static _WLProfileEditProfile get editProfile => _WLProfileEditProfile._(
    [_Screens.profile, _Screens.editProfile],
    [null, null],
  );
  static _WLProfileAchievements get achievements => _WLProfileAchievements._(
    [_Screens.profile, _Screens.achievements],
    [null, null],
  );
  static _WLProfileBadges get badges =>
      _WLProfileBadges._([_Screens.profile, _Screens.badges], [null, null]);
  static _WLProfileBadgesBadge badge(String id) => _WLProfileBadgesBadge._(
    [_Screens.profile, _Screens.badges, _Screens.badge],
    [null, null, id],
  );
  static _WLProfileSavedPosts get savedPosts => _WLProfileSavedPosts._(
    [_Screens.profile, _Screens.savedPosts],
    [null, null],
  );
  static _WLProfileDrafts get drafts =>
      _WLProfileDrafts._([_Screens.profile, _Screens.drafts], [null, null]);
  static _WLProfileMyListings get myListings => _WLProfileMyListings._(
    [_Screens.profile, _Screens.myListings],
    [null, null],
  );
  static _WLNotifications get notifications =>
      _WLNotifications._([_Screens.notifications], [null]);
  static _WLNotificationsNotificationSettings get notificationSettings =>
      _WLNotificationsNotificationSettings._(
        [_Screens.notifications, _Screens.notificationSettings],
        [null, null],
      );
  static _WLSearch get search => _WLSearch._([_Screens.search], [null]);
  static _WLSearchSearchResults get searchResults => _WLSearchSearchResults._(
    [_Screens.search, _Screens.searchResults],
    [null, null],
  );
  static _WLSettings get settings => _WLSettings._([_Screens.settings], [null]);
  static _WLSettingsAccountSettings get accountSettings =>
      _WLSettingsAccountSettings._(
        [_Screens.settings, _Screens.accountSettings],
        [null, null],
      );
  static _WLSettingsSecurity get security => _WLSettingsSecurity._(
    [_Screens.settings, _Screens.security],
    [null, null],
  );
  static _WLSettingsSecurityTwoFactorSettings get twoFactorSettings =>
      _WLSettingsSecurityTwoFactorSettings._(
        [_Screens.settings, _Screens.security, _Screens.twoFactorSettings],
        [null, null, null],
      );
  static _WLSettingsPrivacy get privacy =>
      _WLSettingsPrivacy._([_Screens.settings, _Screens.privacy], [null, null]);
  static _WLSettingsAppearance get appearance => _WLSettingsAppearance._(
    [_Screens.settings, _Screens.appearance],
    [null, null],
  );
  static _WLSettingsLanguage get language => _WLSettingsLanguage._(
    [_Screens.settings, _Screens.language],
    [null, null],
  );
  static _WLSettingsConnectedApps get connectedApps =>
      _WLSettingsConnectedApps._(
        [_Screens.settings, _Screens.connectedApps],
        [null, null],
      );
  static _WLSettingsAbout get about =>
      _WLSettingsAbout._([_Screens.settings, _Screens.about], [null, null]);
  static _WLSettingsAboutHelp get help => _WLSettingsAboutHelp._(
    [_Screens.settings, _Screens.about, _Screens.help],
    [null, null, null],
  );
  static _WLSettingsAboutHelpHelpCategory helpCategory(String id) =>
      _WLSettingsAboutHelpHelpCategory._(
        [
          _Screens.settings,
          _Screens.about,
          _Screens.help,
          _Screens.helpCategory,
        ],
        [null, null, null, id],
      );
  static _WLSettingsAboutFeedback get feedback => _WLSettingsAboutFeedback._(
    [_Screens.settings, _Screens.about, _Screens.feedback],
    [null, null, null],
  );
  static _WLSettingsBlockedUsers get blockedUsers => _WLSettingsBlockedUsers._(
    [_Screens.settings, _Screens.blockedUsers],
    [null, null],
  );
  static _WLSettingsDevices get devices =>
      _WLSettingsDevices._([_Screens.settings, _Screens.devices], [null, null]);
  static _WLSettingsDevicesDevice device(String id) =>
      _WLSettingsDevicesDevice._(
        [_Screens.settings, _Screens.devices, _Screens.device],
        [null, null, id],
      );
  static _WLSettingsDataExport get dataExport => _WLSettingsDataExport._(
    [_Screens.settings, _Screens.dataExport],
    [null, null],
  );
  static _WLSettingsDeleteAccount get deleteAccount =>
      _WLSettingsDeleteAccount._(
        [_Screens.settings, _Screens.deleteAccount],
        [null, null],
      );
  static _WLWorkspace get workspace =>
      _WLWorkspace._([_Screens.workspace], [null]);
  static _WLWorkspaceProject project(String id) =>
      _WLWorkspaceProject._([_Screens.workspace, _Screens.project], [null, id]);
  static _WLForum get forum => _WLForum._([_Screens.forum], [null]);
  static _WLForumForumCategory forumCategory(String id) =>
      _WLForumForumCategory._(
        [_Screens.forum, _Screens.forumCategory],
        [null, id],
      );
  static _WLLearn get learn => _WLLearn._([_Screens.learn], [null]);
  static _WLLearnCourse course(String id) =>
      _WLLearnCourse._([_Screens.learn, _Screens.course], [null, id]);
  static _WLLearnCourseCertificate certificate(String id) =>
      _WLLearnCourseCertificate._(
        [_Screens.learn, _Screens.course, _Screens.certificate],
        [null, id, null],
      );
  static _WLShop get shop => _WLShop._([_Screens.shop], [null]);
  static _WLShopShopDept shopDept(String id) =>
      _WLShopShopDept._([_Screens.shop, _Screens.shopDept], [null, id]);
  static _WLShopCompareProducts get compareProducts => _WLShopCompareProducts._(
    [_Screens.shop, _Screens.compareProducts],
    [null, null],
  );
  static _WLActivity get activity => _WLActivity._([_Screens.activity], [null]);
  static _WLActivityWorkout workout(String id) =>
      _WLActivityWorkout._([_Screens.activity, _Screens.workout], [null, id]);
  static _WLDeepDemo get deepDemo => _WLDeepDemo._([_Screens.deepDemo], [null]);
  static _WLDeepDemoLevelA levelA(String id) =>
      _WLDeepDemoLevelA._([_Screens.deepDemo, _Screens.levelA], [null, id]);
  static _WLSettingsIntegrations get integrations => _WLSettingsIntegrations._(
    [_Screens.settings, _Screens.integrations],
    [null, null],
  );
  static _WLSettingsIntegrationsApiKeys get apiKeys =>
      _WLSettingsIntegrationsApiKeys._(
        [_Screens.settings, _Screens.integrations, _Screens.apiKeys],
        [null, null, null],
      );
  static _WLHomeStudio get studio =>
      _WLHomeStudio._([_Screens.home, CreatorStudio.studio], [null, null]);
  static _WLHomeStudioAnalytics get analytics => _WLHomeStudioAnalytics._(
    [_Screens.home, CreatorStudio.studio, CreatorStudio.analytics],
    [null, null, null],
  );
  static _WLHomeStudioAnalyticsAudience get audience =>
      _WLHomeStudioAnalyticsAudience._(
        [
          _Screens.home,
          CreatorStudio.studio,
          CreatorStudio.analytics,
          CreatorStudio.audience,
        ],
        [null, null, null, null],
      );
  static _WLHomeStudioScheduled get scheduled => _WLHomeStudioScheduled._(
    [_Screens.home, CreatorStudio.studio, CreatorStudio.scheduled],
    [null, null, null],
  );
  static _WLHomeStudioScheduledScheduledPost scheduledPost(String id) =>
      _WLHomeStudioScheduledScheduledPost._(
        [
          _Screens.home,
          CreatorStudio.studio,
          CreatorStudio.scheduled,
          CreatorStudio.scheduledPost,
        ],
        [null, null, null, id],
      );
  static _WLHomeStudioScheduledScheduledPostEditScheduled editScheduled(
    String id,
  ) => _WLHomeStudioScheduledScheduledPostEditScheduled._(
    [
      _Screens.home,
      CreatorStudio.studio,
      CreatorStudio.scheduled,
      CreatorStudio.scheduledPost,
      CreatorStudio.editScheduled,
    ],
    [null, null, null, id, null],
  );
  static _WLHomeStudioMonetization get monetization =>
      _WLHomeStudioMonetization._(
        [_Screens.home, CreatorStudio.studio, CreatorStudio.monetization],
        [null, null, null],
      );
  static _WLHomeStudioMonetizationPayouts get payouts =>
      _WLHomeStudioMonetizationPayouts._(
        [
          _Screens.home,
          CreatorStudio.studio,
          CreatorStudio.monetization,
          CreatorStudio.payouts,
        ],
        [null, null, null, null],
      );
  static _WLDiscoverEvents get events =>
      _WLDiscoverEvents._([_Screens.discover, Events.events], [null, null]);
  static _WLDiscoverEventsEvent event(String id) => _WLDiscoverEventsEvent._(
    [_Screens.discover, Events.events, Events.event],
    [null, null, id],
  );
  static _WLDiscoverEventsEventAttendees attendees(String id) =>
      _WLDiscoverEventsEventAttendees._(
        [_Screens.discover, Events.events, Events.event, Events.attendees],
        [null, null, id, null],
      );
  static _WLDiscoverEventsEventEditEvent editEvent(String id) =>
      _WLDiscoverEventsEventEditEvent._(
        [_Screens.discover, Events.events, Events.event, Events.editEvent],
        [null, null, id, null],
      );
  static _WLDiscoverEventsCreateEvent get createEvent =>
      _WLDiscoverEventsCreateEvent._(
        [_Screens.discover, Events.events, Events.createEvent],
        [null, null, null],
      );
  static _WLDiscoverEventsEventTickets tickets(String id) =>
      _WLDiscoverEventsEventTickets._(
        [_Screens.discover, Events.events, Events.event, Events.tickets],
        [null, null, id, null],
      );
  static _WLSettingsSupport get support =>
      _WLSettingsSupport._([_Screens.settings, Support.support], [null, null]);
  static _WLSettingsSupportSupportTickets get supportTickets =>
      _WLSettingsSupportSupportTickets._(
        [_Screens.settings, Support.support, Support.supportTickets],
        [null, null, null],
      );
  static _WLSettingsSupportSupportTicketsSupportTicket supportTicket(
    String id,
  ) => _WLSettingsSupportSupportTicketsSupportTicket._(
    [
      _Screens.settings,
      Support.support,
      Support.supportTickets,
      Support.supportTicket,
    ],
    [null, null, null, id],
  );
  static _WLSettingsSupportNewTicket get newTicket =>
      _WLSettingsSupportNewTicket._(
        [_Screens.settings, Support.support, Support.newTicket],
        [null, null, null],
      );
  static _WLSettingsSupportKnowledgeBase get knowledgeBase =>
      _WLSettingsSupportKnowledgeBase._(
        [_Screens.settings, Support.support, Support.knowledgeBase],
        [null, null, null],
      );
  static _WLSettingsSupportKnowledgeBaseArticle article(String id) =>
      _WLSettingsSupportKnowledgeBaseArticle._(
        [
          _Screens.settings,
          Support.support,
          Support.knowledgeBase,
          Support.article,
        ],
        [null, null, null, id],
      );
  static _WLSettingsAdmin get admin =>
      _WLSettingsAdmin._([_Screens.settings, Admin.admin], [null, null]);
  static _WLSettingsAdminAdminUsers get adminUsers =>
      _WLSettingsAdminAdminUsers._(
        [_Screens.settings, Admin.admin, Admin.adminUsers],
        [null, null, null],
      );
  static _WLSettingsAdminAdminUsersAdminUser adminUser(String id) =>
      _WLSettingsAdminAdminUsersAdminUser._(
        [_Screens.settings, Admin.admin, Admin.adminUsers, Admin.adminUser],
        [null, null, null, id],
      );
  static _WLSettingsAdminAdminAuditLog get adminAuditLog =>
      _WLSettingsAdminAdminAuditLog._(
        [_Screens.settings, Admin.admin, Admin.adminAuditLog],
        [null, null, null],
      );
  static _WLSettingsAdminAdminFeatureFlags get adminFeatureFlags =>
      _WLSettingsAdminAdminFeatureFlags._(
        [_Screens.settings, Admin.admin, Admin.adminFeatureFlags],
        [null, null, null],
      );
  static _WLSettingsAdminWebhooks get webhooks => _WLSettingsAdminWebhooks._(
    [_Screens.settings, Admin.admin, Admin.webhooks],
    [null, null, null],
  );
  static _WLSettingsAdminWebhooksWebhook webhook(String id) =>
      _WLSettingsAdminWebhooksWebhook._(
        [_Screens.settings, Admin.admin, Admin.webhooks, Admin.webhook],
        [null, null, null, id],
      );
}

/// A resolve-only branch (declared via `.link`/`slots`): URL-shaped DATA
/// the resolver interprets. NOT a position — no widget, never navigable.
/// Shareable via `Link.<route>.toUri()`; read its fields in `Screen.resolver`.
sealed class Link extends Url {
  const Link([super.domain]);
  static _LXPost get post => _LXPost(const <Object?>[], const <int>[]);
  static _LXUserProfile get userProfile =>
      _LXUserProfile(const <Object?>[], const <int>[]);
  static _LXListing get listing => _LXListing(const <Object?>[], const <int>[]);
  static _LXProduct get product => _LXProduct(const <Object?>[], const <int>[]);
  static _LXTask get task => _LXTask(const <Object?>[], const <int>[]);
}

/// The bare root `/` — a plain app-open (no specific destination).
final class RootUrl extends Url {
  const RootUrl([super.domain]);
  @override
  Uri toUri([String? domain]) =>
      Uri.parse((domain ?? 'https://mega.example') + '/');
}

/// A nav-mirror `Place` parsed from a URL (e.g. `/home/item/42`); carries
/// the root-down chain so `Screen.go` lands it.
final class _NavPlace extends Place {
  const _NavPlace(this.chain, [super.domain]);
  @override
  final List<(Enum, Object?)> chain;
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      [for (final c in chain) c.$1],
      [for (final c in chain) c.$2],
    ),
  );
}

sealed class PostLink implements Url {}

sealed class UserProfileLink implements Url {}

sealed class ListingLink implements Url {}

sealed class ProductLink implements Url {}

sealed class TaskLink implements Url {}

final class PostByIdLink extends Link implements PostLink {
  const PostByIdLink(this.postId, [super.domain]);
  final String postId;
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'post/*',
      <Object?>[postId],
      <int>[0],
    ),
  );
}

final class PostLatestLink extends Link implements PostLink {
  const PostLatestLink([super.domain]);
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'post/*',
      <Object?>['latest'],
      <int>[1],
    ),
  );
}

final class UserProfileByUsernameLink extends Link implements UserProfileLink {
  const UserProfileByUsernameLink(this.username, [super.domain]);
  final String username;
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'user-profile/*',
      <Object?>[username],
      <int>[0],
    ),
  );
}

final class UserProfileMeLink extends Link implements UserProfileLink {
  const UserProfileMeLink([super.domain]);
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'user-profile/*',
      <Object?>['me'],
      <int>[1],
    ),
  );
}

final class ListingByIdLink extends Link implements ListingLink {
  const ListingByIdLink(this.listingId, [super.domain]);
  final String listingId;
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'listing/*',
      <Object?>[listingId],
      <int>[0],
    ),
  );
}

final class ListingFeaturedLink extends Link implements ListingLink {
  const ListingFeaturedLink([super.domain]);
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'listing/*',
      <Object?>['featured'],
      <int>[1],
    ),
  );
}

final class ProductByIdLink extends Link implements ProductLink {
  const ProductByIdLink(this.productId, [super.domain]);
  final String productId;
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'product/*',
      <Object?>[productId],
      <int>[0],
    ),
  );
}

final class ProductFeaturedLink extends Link implements ProductLink {
  const ProductFeaturedLink([super.domain]);
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'product/*',
      <Object?>['featured'],
      <int>[1],
    ),
  );
}

final class TaskByIdLink extends Link implements TaskLink {
  const TaskByIdLink(this.taskId, [super.domain]);
  final String taskId;
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'task/*',
      <Object?>[taskId],
      <int>[0],
    ),
  );
}

final class TaskMineLink extends Link implements TaskLink {
  const TaskMineLink([super.domain]);
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'task/*',
      <Object?>['mine'],
      <int>[1],
    ),
  );
}

/// Parses [url] into a [Url]: a declared [Link], a nav-mirror [Place]
/// (go-able), [RootUrl] for bare `/`, or null if it resolves to nothing.
/// The result carries the inbound origin in [Url.domain].
Url? parseUrl(String url) {
  final uri = Uri.parse(url);
  final origin = uri.hasAuthority ? '${uri.scheme}://${uri.authority}' : null;
  final m = _Screens.graph.parseLink(url);
  if (m != null) {
    final link = switch (m.template) {
      'post/*' => switch (m.branches[0]) {
        0 => PostByIdLink(m.path[0] as String, origin),
        1 => PostLatestLink(origin),
        _ => throw StateError('bad union branch'),
      },
      'user-profile/*' => switch (m.branches[0]) {
        0 => UserProfileByUsernameLink(m.path[0] as String, origin),
        1 => UserProfileMeLink(origin),
        _ => throw StateError('bad union branch'),
      },
      'listing/*' => switch (m.branches[0]) {
        0 => ListingByIdLink(m.path[0] as String, origin),
        1 => ListingFeaturedLink(origin),
        _ => throw StateError('bad union branch'),
      },
      'product/*' => switch (m.branches[0]) {
        0 => ProductByIdLink(m.path[0] as String, origin),
        1 => ProductFeaturedLink(origin),
        _ => throw StateError('bad union branch'),
      },
      'task/*' => switch (m.branches[0]) {
        0 => TaskByIdLink(m.path[0] as String, origin),
        1 => TaskMineLink(origin),
        _ => throw StateError('bad union branch'),
      },
      _ => null,
    };
    if (link != null) return link;
  }
  // Bare root → a plain app-open.
  if (uri.pathSegments.where((s) => s.isNotEmpty).isEmpty) {
    return RootUrl(origin);
  }
  // Nav-mirror path → a go-able Place.
  final chain = _Screens.graph.parsePath(url);
  if (chain != null) return _NavPlace(chain, origin);
  return null;
}

class _LXPost {
  _LXPost(this._p, this._b);
  final List<Object?> _p;
  final List<int> _b;
  _LXPostSlot byId(String postId) => _LXPostSlot([..._p, postId], [..._b, 0]);
  _LXPostSlot latest() => _LXPostSlot([..._p, 'latest'], [..._b, 1]);
}

class _LXPostSlot {
  _LXPostSlot(this._p, this._b);
  final List<Object?> _p;
  final List<int> _b;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'post/*',
      _p,
      _b,
    ),
  );
}

class _LXUserProfile {
  _LXUserProfile(this._p, this._b);
  final List<Object?> _p;
  final List<int> _b;
  _LXUserProfileSlot byUsername(String username) =>
      _LXUserProfileSlot([..._p, username], [..._b, 0]);
  _LXUserProfileSlot me() => _LXUserProfileSlot([..._p, 'me'], [..._b, 1]);
}

class _LXUserProfileSlot {
  _LXUserProfileSlot(this._p, this._b);
  final List<Object?> _p;
  final List<int> _b;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'user-profile/*',
      _p,
      _b,
    ),
  );
}

class _LXListing {
  _LXListing(this._p, this._b);
  final List<Object?> _p;
  final List<int> _b;
  _LXListingSlot byId(String listingId) =>
      _LXListingSlot([..._p, listingId], [..._b, 0]);
  _LXListingSlot featured() => _LXListingSlot([..._p, 'featured'], [..._b, 1]);
}

class _LXListingSlot {
  _LXListingSlot(this._p, this._b);
  final List<Object?> _p;
  final List<int> _b;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'listing/*',
      _p,
      _b,
    ),
  );
}

class _LXProduct {
  _LXProduct(this._p, this._b);
  final List<Object?> _p;
  final List<int> _b;
  _LXProductSlot byId(String productId) =>
      _LXProductSlot([..._p, productId], [..._b, 0]);
  _LXProductSlot featured() => _LXProductSlot([..._p, 'featured'], [..._b, 1]);
}

class _LXProductSlot {
  _LXProductSlot(this._p, this._b);
  final List<Object?> _p;
  final List<int> _b;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'product/*',
      _p,
      _b,
    ),
  );
}

class _LXTask {
  _LXTask(this._p, this._b);
  final List<Object?> _p;
  final List<int> _b;
  _LXTaskSlot byId(String taskId) => _LXTaskSlot([..._p, taskId], [..._b, 0]);
  _LXTaskSlot mine() => _LXTaskSlot([..._p, 'mine'], [..._b, 1]);
}

class _LXTaskSlot {
  _LXTaskSlot(this._p, this._b);
  final List<Object?> _p;
  final List<int> _b;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'task/*',
      _p,
      _b,
    ),
  );
}

final class _WLSplash implements Hop<SplashNav> {
  const _WLSplash._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SplashNav get nav => const SplashNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSignIn implements Hop<SignInNav> {
  const _WLSignIn._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SignInNav get nav => const SignInNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSignUp implements Hop<SignUpNav> {
  const _WLSignUp._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SignUpNav get nav => const SignUpNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLOnboarding implements Hop<OnboardingNav> {
  const _WLOnboarding._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  OnboardingNav get nav => const OnboardingNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLForgotPassword implements Hop<ForgotPasswordNav> {
  const _WLForgotPassword._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ForgotPasswordNav get nav => const ForgotPasswordNav._();
  _WLForgotPasswordResetPassword resetPassword(String id) =>
      _WLForgotPasswordResetPassword._(
        [..._s, _Screens.resetPassword],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLForgotPasswordResetPassword implements Hop<ResetPasswordNav> {
  const _WLForgotPasswordResetPassword._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ResetPasswordNav get nav => const ResetPasswordNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLVerifyEmail implements Hop<VerifyEmailNav> {
  const _WLVerifyEmail._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  VerifyEmailNav get nav => const VerifyEmailNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLTwoFactor implements Hop<TwoFactorNav> {
  const _WLTwoFactor._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  TwoFactorNav get nav => const TwoFactorNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHome implements Hop<HomeNav> {
  const _WLHome._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeNav get nav => const HomeNav._();
  _WLHomeFeed get feed => _WLHomeFeed._([..._s, _Screens.feed], [..._i, null]);
  _WLHomeStudio get studio =>
      _WLHomeStudio._([..._s, CreatorStudio.studio], [..._i, null]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeFeed implements Hop<FeedNav> {
  const _WLHomeFeed._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  FeedNav get nav => const FeedNav._();
  _WLHomeFeedPost post(String id) =>
      _WLHomeFeedPost._([..._s, _Screens.post], [..._i, id]);
  _WLHomeFeedPostPostComments postComments(String id) =>
      _WLHomeFeedPostPostComments._(
        [..._s, _Screens.post, _Screens.postComments],
        [..._i, id, null],
      );
  _WLHomeFeedPostPostLikes postLikes(String id) => _WLHomeFeedPostPostLikes._(
    [..._s, _Screens.post, _Screens.postLikes],
    [..._i, id, null],
  );
  _WLHomeFeedPostEditPost editPost(String id) => _WLHomeFeedPostEditPost._(
    [..._s, _Screens.post, _Screens.editPost],
    [..._i, id, null],
  );
  _WLHomeFeedPostRepost repost(String id) => _WLHomeFeedPostRepost._(
    [..._s, _Screens.post, _Screens.repost],
    [..._i, id, null],
  );
  _WLHomeFeedStory story(String id) =>
      _WLHomeFeedStory._([..._s, _Screens.story], [..._i, id]);
  _WLHomeFeedComposePost get composePost =>
      _WLHomeFeedComposePost._([..._s, _Screens.composePost], [..._i, null]);
  _WLHomeFeedUserProfile userProfile(String id) =>
      _WLHomeFeedUserProfile._([..._s, _Screens.userProfile], [..._i, id]);
  _WLHomeFeedQ query(Set<FeedQueryArg> q) =>
      _WLHomeFeedQ(_s, _i, {for (final t in q) t.key: t.value}, const {});
  _WLHomeFeedF fragment(Set<FeedFragmentArg> f) =>
      _WLHomeFeedF(_s, _i, const {}, {for (final t in f) t.key: t.value});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLHomeFeedQ {
  _WLHomeFeedQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  _WLHomeFeedF fragment(Set<FeedFragmentArg> f) =>
      _WLHomeFeedF(_s, _i, _q, {for (final t in f) t.key: t.value});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

class _WLHomeFeedF {
  _WLHomeFeedF(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLHomeFeedPost implements Hop<PostNav> {
  const _WLHomeFeedPost._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  PostNav get nav => const PostNav._();
  _WLHomeFeedPostComment comment(String id) =>
      _WLHomeFeedPostComment._([..._s, _Screens.comment], [..._i, id]);
  _WLHomeFeedPostPostAuthor postAuthor(String id) =>
      _WLHomeFeedPostPostAuthor._([..._s, _Screens.postAuthor], [..._i, id]);
  _WLHomeFeedPostPostComments get postComments => _WLHomeFeedPostPostComments._(
    [..._s, _Screens.postComments],
    [..._i, null],
  );
  _WLHomeFeedPostPostLikes get postLikes =>
      _WLHomeFeedPostPostLikes._([..._s, _Screens.postLikes], [..._i, null]);
  _WLHomeFeedPostEditPost get editPost =>
      _WLHomeFeedPostEditPost._([..._s, _Screens.editPost], [..._i, null]);
  _WLHomeFeedPostRepost get repost =>
      _WLHomeFeedPostRepost._([..._s, _Screens.repost], [..._i, null]);
  _WLHomeFeedPostQ query(Set<PostQueryArg> q) =>
      _WLHomeFeedPostQ(_s, _i, {for (final t in q) t.key: t.value}, const {});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLHomeFeedPostQ {
  _WLHomeFeedPostQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLHomeFeedPostComment implements Hop<CommentNav> {
  const _WLHomeFeedPostComment._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CommentNav get nav => const CommentNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeFeedPostPostAuthor implements Hop<PostAuthorNav> {
  const _WLHomeFeedPostPostAuthor._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  PostAuthorNav get nav => const PostAuthorNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeFeedPostPostComments implements Hop<PostCommentsNav> {
  const _WLHomeFeedPostPostComments._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  PostCommentsNav get nav => const PostCommentsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeFeedPostPostLikes implements Hop<PostLikesNav> {
  const _WLHomeFeedPostPostLikes._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  PostLikesNav get nav => const PostLikesNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeFeedPostEditPost implements Hop<EditPostNav> {
  const _WLHomeFeedPostEditPost._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  EditPostNav get nav => const EditPostNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeFeedPostRepost implements Hop<RepostNav> {
  const _WLHomeFeedPostRepost._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  RepostNav get nav => const RepostNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeFeedStory implements Hop<StoryNav> {
  const _WLHomeFeedStory._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  StoryNav get nav => const StoryNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeFeedComposePost implements Hop<ComposePostNav> {
  const _WLHomeFeedComposePost._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ComposePostNav get nav => const ComposePostNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeFeedUserProfile implements Hop<HomeFeedUserProfileNav> {
  const _WLHomeFeedUserProfile._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HomeFeedUserProfileNav get nav => const HomeFeedUserProfileNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeStudio implements Hop<StudioNav> {
  const _WLHomeStudio._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  StudioNav get nav => const StudioNav._();
  _WLHomeStudioAnalytics get analytics =>
      _WLHomeStudioAnalytics._([..._s, CreatorStudio.analytics], [..._i, null]);
  _WLHomeStudioScheduled get scheduled =>
      _WLHomeStudioScheduled._([..._s, CreatorStudio.scheduled], [..._i, null]);
  _WLHomeStudioMonetization get monetization => _WLHomeStudioMonetization._(
    [..._s, CreatorStudio.monetization],
    [..._i, null],
  );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeStudioAnalytics implements Hop<AnalyticsNav> {
  const _WLHomeStudioAnalytics._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AnalyticsNav get nav => const AnalyticsNav._();
  _WLHomeStudioAnalyticsAudience get audience =>
      _WLHomeStudioAnalyticsAudience._(
        [..._s, CreatorStudio.audience],
        [..._i, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeStudioAnalyticsAudience implements Hop<AudienceNav> {
  const _WLHomeStudioAnalyticsAudience._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AudienceNav get nav => const AudienceNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeStudioScheduled implements Hop<ScheduledNav> {
  const _WLHomeStudioScheduled._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ScheduledNav get nav => const ScheduledNav._();
  _WLHomeStudioScheduledScheduledPost scheduledPost(String id) =>
      _WLHomeStudioScheduledScheduledPost._(
        [..._s, CreatorStudio.scheduledPost],
        [..._i, id],
      );
  _WLHomeStudioScheduledScheduledPostEditScheduled editScheduled(String id) =>
      _WLHomeStudioScheduledScheduledPostEditScheduled._(
        [..._s, CreatorStudio.scheduledPost, CreatorStudio.editScheduled],
        [..._i, id, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeStudioScheduledScheduledPost
    implements Hop<ScheduledPostNav> {
  const _WLHomeStudioScheduledScheduledPost._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ScheduledPostNav get nav => const ScheduledPostNav._();
  _WLHomeStudioScheduledScheduledPostEditScheduled get editScheduled =>
      _WLHomeStudioScheduledScheduledPostEditScheduled._(
        [..._s, CreatorStudio.editScheduled],
        [..._i, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeStudioScheduledScheduledPostEditScheduled
    implements Hop<EditScheduledNav> {
  const _WLHomeStudioScheduledScheduledPostEditScheduled._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  EditScheduledNav get nav => const EditScheduledNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeStudioMonetization implements Hop<MonetizationNav> {
  const _WLHomeStudioMonetization._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  MonetizationNav get nav => const MonetizationNav._();
  _WLHomeStudioMonetizationPayouts get payouts =>
      _WLHomeStudioMonetizationPayouts._(
        [..._s, CreatorStudio.payouts],
        [..._i, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLHomeStudioMonetizationPayouts implements Hop<PayoutsNav> {
  const _WLHomeStudioMonetizationPayouts._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  PayoutsNav get nav => const PayoutsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscover implements Hop<DiscoverNav> {
  const _WLDiscover._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  DiscoverNav get nav => const DiscoverNav._();
  _WLDiscoverTrending get trending =>
      _WLDiscoverTrending._([..._s, _Screens.trending], [..._i, null]);
  _WLDiscoverTopics get topics =>
      _WLDiscoverTopics._([..._s, _Screens.topics], [..._i, null]);
  _WLDiscoverLiveNow get liveNow =>
      _WLDiscoverLiveNow._([..._s, _Screens.liveNow], [..._i, null]);
  _WLDiscoverNearby get nearby =>
      _WLDiscoverNearby._([..._s, _Screens.nearby], [..._i, null]);
  _WLDiscoverEvents get events =>
      _WLDiscoverEvents._([..._s, Events.events], [..._i, null]);
  _WLDiscoverQ query(Set<DiscoverQueryArg> q) =>
      _WLDiscoverQ(_s, _i, {for (final t in q) t.key: t.value}, const {});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLDiscoverQ {
  _WLDiscoverQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLDiscoverTrending implements Hop<TrendingNav> {
  const _WLDiscoverTrending._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  TrendingNav get nav => const TrendingNav._();
  _WLDiscoverTrendingHashtag hashtag(String id) =>
      _WLDiscoverTrendingHashtag._([..._s, _Screens.hashtag], [..._i, id]);
  _WLDiscoverTrendingTopic topic(String id) =>
      _WLDiscoverTrendingTopic._([..._s, _Screens.topic], [..._i, id]);
  _WLDiscoverTrendingUserProfile userProfile(String id) =>
      _WLDiscoverTrendingUserProfile._(
        [..._s, _Screens.userProfile],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscoverTrendingHashtag implements Hop<HashtagNav> {
  const _WLDiscoverTrendingHashtag._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HashtagNav get nav => const HashtagNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscoverTrendingTopic implements Hop<TopicNav> {
  const _WLDiscoverTrendingTopic._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  TopicNav get nav => const TopicNav._();
  _WLDiscoverTrendingTopicSubtopic subtopic(String id) =>
      _WLDiscoverTrendingTopicSubtopic._(
        [..._s, _Screens.subtopic],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscoverTrendingTopicSubtopic implements Hop<SubtopicNav> {
  const _WLDiscoverTrendingTopicSubtopic._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SubtopicNav get nav => const SubtopicNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscoverTrendingUserProfile
    implements Hop<DiscoverTrendingUserProfileNav> {
  const _WLDiscoverTrendingUserProfile._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  DiscoverTrendingUserProfileNav get nav =>
      const DiscoverTrendingUserProfileNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscoverTopics implements Hop<TopicsNav> {
  const _WLDiscoverTopics._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  TopicsNav get nav => const TopicsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscoverLiveNow implements Hop<LiveNowNav> {
  const _WLDiscoverLiveNow._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  LiveNowNav get nav => const LiveNowNav._();
  _WLDiscoverLiveNowLiveRoom liveRoom(String id) =>
      _WLDiscoverLiveNowLiveRoom._([..._s, _Screens.liveRoom], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscoverLiveNowLiveRoom implements Hop<LiveRoomNav> {
  const _WLDiscoverLiveNowLiveRoom._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  LiveRoomNav get nav => const LiveRoomNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscoverNearby implements Hop<NearbyNav> {
  const _WLDiscoverNearby._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  NearbyNav get nav => const NearbyNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscoverEvents implements Hop<EventsNav> {
  const _WLDiscoverEvents._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  EventsNav get nav => const EventsNav._();
  _WLDiscoverEventsEvent event(String id) =>
      _WLDiscoverEventsEvent._([..._s, Events.event], [..._i, id]);
  _WLDiscoverEventsEventAttendees attendees(String id) =>
      _WLDiscoverEventsEventAttendees._(
        [..._s, Events.event, Events.attendees],
        [..._i, id, null],
      );
  _WLDiscoverEventsEventEditEvent editEvent(String id) =>
      _WLDiscoverEventsEventEditEvent._(
        [..._s, Events.event, Events.editEvent],
        [..._i, id, null],
      );
  _WLDiscoverEventsEventTickets tickets(String id) =>
      _WLDiscoverEventsEventTickets._(
        [..._s, Events.event, Events.tickets],
        [..._i, id, null],
      );
  _WLDiscoverEventsCreateEvent get createEvent =>
      _WLDiscoverEventsCreateEvent._(
        [..._s, Events.createEvent],
        [..._i, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscoverEventsEvent implements Hop<EventNav> {
  const _WLDiscoverEventsEvent._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  EventNav get nav => const EventNav._();
  _WLDiscoverEventsEventAttendees get attendees =>
      _WLDiscoverEventsEventAttendees._(
        [..._s, Events.attendees],
        [..._i, null],
      );
  _WLDiscoverEventsEventEditEvent get editEvent =>
      _WLDiscoverEventsEventEditEvent._(
        [..._s, Events.editEvent],
        [..._i, null],
      );
  _WLDiscoverEventsEventTickets get tickets =>
      _WLDiscoverEventsEventTickets._([..._s, Events.tickets], [..._i, null]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscoverEventsEventAttendees implements Hop<AttendeesNav> {
  const _WLDiscoverEventsEventAttendees._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AttendeesNav get nav => const AttendeesNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscoverEventsEventEditEvent implements Hop<EditEventNav> {
  const _WLDiscoverEventsEventEditEvent._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  EditEventNav get nav => const EditEventNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscoverEventsEventTickets implements Hop<TicketsNav> {
  const _WLDiscoverEventsEventTickets._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  TicketsNav get nav => const TicketsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDiscoverEventsCreateEvent implements Hop<CreateEventNav> {
  const _WLDiscoverEventsCreateEvent._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CreateEventNav get nav => const CreateEventNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMarketplace implements Hop<MarketplaceNav> {
  const _WLMarketplace._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  MarketplaceNav get nav => const MarketplaceNav._();
  _WLMarketplaceCategories get categories =>
      _WLMarketplaceCategories._([..._s, _Screens.categories], [..._i, null]);
  _WLMarketplaceCart get cart =>
      _WLMarketplaceCart._([..._s, _Screens.cart], [..._i, null]);
  _WLMarketplaceMyOrders get myOrders =>
      _WLMarketplaceMyOrders._([..._s, _Screens.myOrders], [..._i, null]);
  _WLMarketplaceWishlist get wishlist =>
      _WLMarketplaceWishlist._([..._s, _Screens.wishlist], [..._i, null]);
  _WLMarketplaceQ query(Set<MarketplaceQueryArg> q) =>
      _WLMarketplaceQ(_s, _i, {for (final t in q) t.key: t.value}, const {});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLMarketplaceQ {
  _WLMarketplaceQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLMarketplaceCategories implements Hop<CategoriesNav> {
  const _WLMarketplaceCategories._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CategoriesNav get nav => const CategoriesNav._();
  _WLMarketplaceCategoriesCategory category(String id) =>
      _WLMarketplaceCategoriesCategory._(
        [..._s, _Screens.category],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMarketplaceCategoriesCategory implements Hop<CategoryNav> {
  const _WLMarketplaceCategoriesCategory._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CategoryNav get nav => const CategoryNav._();
  _WLMarketplaceCategoriesCategoryListing listing(String id) =>
      _WLMarketplaceCategoriesCategoryListing._(
        [..._s, _Screens.listing],
        [..._i, id],
      );
  _WLMarketplaceCategoriesCategoryListingEditListing editListing(String id) =>
      _WLMarketplaceCategoriesCategoryListingEditListing._(
        [..._s, _Screens.listing, _Screens.editListing],
        [..._i, id, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMarketplaceCategoriesCategoryListing implements Hop<ListingNav> {
  const _WLMarketplaceCategoriesCategoryListing._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ListingNav get nav => const ListingNav._();
  _WLMarketplaceCategoriesCategoryListingEditListing get editListing =>
      _WLMarketplaceCategoriesCategoryListingEditListing._(
        [..._s, _Screens.editListing],
        [..._i, null],
      );
  _WLMarketplaceCategoriesCategoryListingSellerProfile sellerProfile(
    String id,
  ) => _WLMarketplaceCategoriesCategoryListingSellerProfile._(
    [..._s, _Screens.sellerProfile],
    [..._i, id],
  );
  _WLMarketplaceCategoriesCategoryListingListingVariant listingVariant(
    String id,
  ) => _WLMarketplaceCategoriesCategoryListingListingVariant._(
    [..._s, _Screens.listingVariant],
    [..._i, id],
  );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMarketplaceCategoriesCategoryListingEditListing
    implements Hop<EditListingNav> {
  const _WLMarketplaceCategoriesCategoryListingEditListing._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  EditListingNav get nav => const EditListingNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMarketplaceCategoriesCategoryListingSellerProfile
    implements Hop<SellerProfileNav> {
  const _WLMarketplaceCategoriesCategoryListingSellerProfile._(
    this._s,
    this._i,
  );
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SellerProfileNav get nav => const SellerProfileNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMarketplaceCategoriesCategoryListingListingVariant
    implements Hop<ListingVariantNav> {
  const _WLMarketplaceCategoriesCategoryListingListingVariant._(
    this._s,
    this._i,
  );
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ListingVariantNav get nav => const ListingVariantNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMarketplaceCart implements Hop<CartNav> {
  const _WLMarketplaceCart._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CartNav get nav => const CartNav._();
  _WLMarketplaceCartCheckout checkout(String id) =>
      _WLMarketplaceCartCheckout._([..._s, _Screens.checkout], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMarketplaceCartCheckout implements Hop<CheckoutNav> {
  const _WLMarketplaceCartCheckout._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CheckoutNav get nav => const CheckoutNav._();
  _WLMarketplaceCartCheckoutOrderConfirmation orderConfirmation(String id) =>
      _WLMarketplaceCartCheckoutOrderConfirmation._(
        [..._s, _Screens.orderConfirmation],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMarketplaceCartCheckoutOrderConfirmation
    implements Hop<OrderConfirmationNav> {
  const _WLMarketplaceCartCheckoutOrderConfirmation._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  OrderConfirmationNav get nav => const OrderConfirmationNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMarketplaceMyOrders implements Hop<MyOrdersNav> {
  const _WLMarketplaceMyOrders._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  MyOrdersNav get nav => const MyOrdersNav._();
  _WLMarketplaceMyOrdersOrder order(String id) =>
      _WLMarketplaceMyOrdersOrder._([..._s, _Screens.order], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMarketplaceMyOrdersOrder implements Hop<OrderNav> {
  const _WLMarketplaceMyOrdersOrder._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  OrderNav get nav => const OrderNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMarketplaceWishlist implements Hop<WishlistNav> {
  const _WLMarketplaceWishlist._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  WishlistNav get nav => const WishlistNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMessages implements Hop<MessagesNav> {
  const _WLMessages._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  MessagesNav get nav => const MessagesNav._();
  _WLMessagesChats get chats =>
      _WLMessagesChats._([..._s, _Screens.chats], [..._i, null]);
  _WLMessagesNewChat get newChat =>
      _WLMessagesNewChat._([..._s, _Screens.newChat], [..._i, null]);
  _WLMessagesGroupChat groupChat(String id) =>
      _WLMessagesGroupChat._([..._s, _Screens.groupChat], [..._i, id]);
  _WLMessagesGroupChatGroupInfo groupInfo(String id) =>
      _WLMessagesGroupChatGroupInfo._(
        [..._s, _Screens.groupChat, _Screens.groupInfo],
        [..._i, id, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMessagesChats implements Hop<ChatsNav> {
  const _WLMessagesChats._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ChatsNav get nav => const ChatsNav._();
  _WLMessagesChatsChat chat(String id) =>
      _WLMessagesChatsChat._([..._s, _Screens.chat], [..._i, id]);
  _WLMessagesChatsChatVoiceCall voiceCall(String id) =>
      _WLMessagesChatsChatVoiceCall._(
        [..._s, _Screens.chat, _Screens.voiceCall],
        [..._i, id, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMessagesChatsChat implements Hop<ChatNav> {
  const _WLMessagesChatsChat._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ChatNav get nav => const ChatNav._();
  _WLMessagesChatsChatThread thread(String id) =>
      _WLMessagesChatsChatThread._([..._s, _Screens.thread], [..._i, id]);
  _WLMessagesChatsChatVoiceCall get voiceCall =>
      _WLMessagesChatsChatVoiceCall._(
        [..._s, _Screens.voiceCall],
        [..._i, null],
      );
  _WLMessagesChatsChatUserProfile userProfile(String id) =>
      _WLMessagesChatsChatUserProfile._(
        [..._s, _Screens.userProfile],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMessagesChatsChatThread implements Hop<ThreadNav> {
  const _WLMessagesChatsChatThread._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ThreadNav get nav => const ThreadNav._();
  _WLMessagesChatsChatThreadMessage message(String id) =>
      _WLMessagesChatsChatThreadMessage._(
        [..._s, _Screens.message],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMessagesChatsChatThreadMessage implements Hop<MessageNav> {
  const _WLMessagesChatsChatThreadMessage._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  MessageNav get nav => const MessageNav._();
  _WLMessagesChatsChatThreadMessageMessageReply messageReply(String id) =>
      _WLMessagesChatsChatThreadMessageMessageReply._(
        [..._s, _Screens.messageReply],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMessagesChatsChatThreadMessageMessageReply
    implements Hop<MessageReplyNav> {
  const _WLMessagesChatsChatThreadMessageMessageReply._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  MessageReplyNav get nav => const MessageReplyNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMessagesChatsChatVoiceCall implements Hop<VoiceCallNav> {
  const _WLMessagesChatsChatVoiceCall._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  VoiceCallNav get nav => const VoiceCallNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMessagesChatsChatUserProfile
    implements Hop<MessagesChatsChatUserProfileNav> {
  const _WLMessagesChatsChatUserProfile._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  MessagesChatsChatUserProfileNav get nav =>
      const MessagesChatsChatUserProfileNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMessagesNewChat implements Hop<NewChatNav> {
  const _WLMessagesNewChat._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  NewChatNav get nav => const NewChatNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMessagesGroupChat implements Hop<GroupChatNav> {
  const _WLMessagesGroupChat._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  GroupChatNav get nav => const GroupChatNav._();
  _WLMessagesGroupChatGroupInfo get groupInfo =>
      _WLMessagesGroupChatGroupInfo._(
        [..._s, _Screens.groupInfo],
        [..._i, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLMessagesGroupChatGroupInfo implements Hop<GroupInfoNav> {
  const _WLMessagesGroupChatGroupInfo._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  GroupInfoNav get nav => const GroupInfoNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWallet implements Hop<WalletNav> {
  const _WLWallet._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  WalletNav get nav => const WalletNav._();
  _WLWalletBalance get balance =>
      _WLWalletBalance._([..._s, _Screens.balance], [..._i, null]);
  _WLWalletAccounts get accounts =>
      _WLWalletAccounts._([..._s, _Screens.accounts], [..._i, null]);
  _WLWalletSendMoney get sendMoney =>
      _WLWalletSendMoney._([..._s, _Screens.sendMoney], [..._i, null]);
  _WLWalletReceiveMoney get receiveMoney =>
      _WLWalletReceiveMoney._([..._s, _Screens.receiveMoney], [..._i, null]);
  _WLWalletPaymentMethods get paymentMethods => _WLWalletPaymentMethods._(
    [..._s, _Screens.paymentMethods],
    [..._i, null],
  );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWalletBalance implements Hop<BalanceNav> {
  const _WLWalletBalance._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  BalanceNav get nav => const BalanceNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWalletAccounts implements Hop<AccountsNav> {
  const _WLWalletAccounts._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AccountsNav get nav => const AccountsNav._();
  _WLWalletAccountsAccount account(String id) =>
      _WLWalletAccountsAccount._([..._s, _Screens.account], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWalletAccountsAccount implements Hop<AccountNav> {
  const _WLWalletAccountsAccount._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AccountNav get nav => const AccountNav._();
  _WLWalletAccountsAccountTransactions get transactions =>
      _WLWalletAccountsAccountTransactions._(
        [..._s, _Screens.transactions],
        [..._i, null],
      );
  _WLWalletAccountsAccountStatements get statements =>
      _WLWalletAccountsAccountStatements._(
        [..._s, _Screens.statements],
        [..._i, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWalletAccountsAccountTransactions
    implements Hop<TransactionsNav> {
  const _WLWalletAccountsAccountTransactions._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  TransactionsNav get nav => const TransactionsNav._();
  _WLWalletAccountsAccountTransactionsTransaction transaction(String id) =>
      _WLWalletAccountsAccountTransactionsTransaction._(
        [..._s, _Screens.transaction],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWalletAccountsAccountTransactionsTransaction
    implements Hop<TransactionNav> {
  const _WLWalletAccountsAccountTransactionsTransaction._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  TransactionNav get nav => const TransactionNav._();
  _WLWalletAccountsAccountTransactionsTransactionTransactionItem
  transactionItem(String id) =>
      _WLWalletAccountsAccountTransactionsTransactionTransactionItem._(
        [..._s, _Screens.transactionItem],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWalletAccountsAccountTransactionsTransactionTransactionItem
    implements Hop<TransactionItemNav> {
  const _WLWalletAccountsAccountTransactionsTransactionTransactionItem._(
    this._s,
    this._i,
  );
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  TransactionItemNav get nav => const TransactionItemNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWalletAccountsAccountStatements implements Hop<StatementsNav> {
  const _WLWalletAccountsAccountStatements._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  StatementsNav get nav => const StatementsNav._();
  _WLWalletAccountsAccountStatementsStatement statement(String id) =>
      _WLWalletAccountsAccountStatementsStatement._(
        [..._s, _Screens.statement],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWalletAccountsAccountStatementsStatement
    implements Hop<StatementNav> {
  const _WLWalletAccountsAccountStatementsStatement._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  StatementNav get nav => const StatementNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWalletSendMoney implements Hop<SendMoneyNav> {
  const _WLWalletSendMoney._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SendMoneyNav get nav => const SendMoneyNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWalletReceiveMoney implements Hop<ReceiveMoneyNav> {
  const _WLWalletReceiveMoney._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ReceiveMoneyNav get nav => const ReceiveMoneyNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWalletPaymentMethods implements Hop<PaymentMethodsNav> {
  const _WLWalletPaymentMethods._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  PaymentMethodsNav get nav => const PaymentMethodsNav._();
  _WLWalletPaymentMethodsAddCard get addCard =>
      _WLWalletPaymentMethodsAddCard._(
        [..._s, _Screens.addCard],
        [..._i, null],
      );
  _WLWalletPaymentMethodsCard card(String id) =>
      _WLWalletPaymentMethodsCard._([..._s, _Screens.card], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWalletPaymentMethodsAddCard implements Hop<AddCardNav> {
  const _WLWalletPaymentMethodsAddCard._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AddCardNav get nav => const AddCardNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWalletPaymentMethodsCard implements Hop<CardNav> {
  const _WLWalletPaymentMethodsCard._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CardNav get nav => const CardNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLProfile implements Hop<ProfileNav> {
  const _WLProfile._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ProfileNav get nav => const ProfileNav._();
  _WLProfileUserProfile userProfile(String id) =>
      _WLProfileUserProfile._([..._s, _Screens.userProfile], [..._i, id]);
  _WLProfileFollowers followers(String id) =>
      _WLProfileFollowers._([..._s, _Screens.followers], [..._i, id]);
  _WLProfileFollowing following(String id) =>
      _WLProfileFollowing._([..._s, _Screens.following], [..._i, id]);
  _WLProfileEditProfile get editProfile =>
      _WLProfileEditProfile._([..._s, _Screens.editProfile], [..._i, null]);
  _WLProfileAchievements get achievements =>
      _WLProfileAchievements._([..._s, _Screens.achievements], [..._i, null]);
  _WLProfileBadges get badges =>
      _WLProfileBadges._([..._s, _Screens.badges], [..._i, null]);
  _WLProfileSavedPosts get savedPosts =>
      _WLProfileSavedPosts._([..._s, _Screens.savedPosts], [..._i, null]);
  _WLProfileDrafts get drafts =>
      _WLProfileDrafts._([..._s, _Screens.drafts], [..._i, null]);
  _WLProfileMyListings get myListings =>
      _WLProfileMyListings._([..._s, _Screens.myListings], [..._i, null]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLProfileUserProfile implements Hop<ProfileUserProfileNav> {
  const _WLProfileUserProfile._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ProfileUserProfileNav get nav => const ProfileUserProfileNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLProfileFollowers implements Hop<FollowersNav> {
  const _WLProfileFollowers._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  FollowersNav get nav => const FollowersNav._();
  _WLProfileFollowersConnection connection(String id) =>
      _WLProfileFollowersConnection._(
        [..._s, _Screens.connection],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLProfileFollowersConnection implements Hop<ConnectionNav> {
  const _WLProfileFollowersConnection._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ConnectionNav get nav => const ConnectionNav._();
  _WLProfileFollowersConnectionMutualConnections get mutualConnections =>
      _WLProfileFollowersConnectionMutualConnections._(
        [..._s, _Screens.mutualConnections],
        [..._i, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLProfileFollowersConnectionMutualConnections
    implements Hop<MutualConnectionsNav> {
  const _WLProfileFollowersConnectionMutualConnections._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  MutualConnectionsNav get nav => const MutualConnectionsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLProfileFollowing implements Hop<FollowingNav> {
  const _WLProfileFollowing._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  FollowingNav get nav => const FollowingNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLProfileEditProfile implements Hop<EditProfileNav> {
  const _WLProfileEditProfile._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  EditProfileNav get nav => const EditProfileNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLProfileAchievements implements Hop<AchievementsNav> {
  const _WLProfileAchievements._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AchievementsNav get nav => const AchievementsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLProfileBadges implements Hop<BadgesNav> {
  const _WLProfileBadges._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  BadgesNav get nav => const BadgesNav._();
  _WLProfileBadgesBadge badge(String id) =>
      _WLProfileBadgesBadge._([..._s, _Screens.badge], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLProfileBadgesBadge implements Hop<BadgeNav> {
  const _WLProfileBadgesBadge._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  BadgeNav get nav => const BadgeNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLProfileSavedPosts implements Hop<SavedPostsNav> {
  const _WLProfileSavedPosts._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SavedPostsNav get nav => const SavedPostsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLProfileDrafts implements Hop<DraftsNav> {
  const _WLProfileDrafts._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  DraftsNav get nav => const DraftsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLProfileMyListings implements Hop<MyListingsNav> {
  const _WLProfileMyListings._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  MyListingsNav get nav => const MyListingsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLNotifications implements Hop<NotificationsNav> {
  const _WLNotifications._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  NotificationsNav get nav => const NotificationsNav._();
  _WLNotificationsNotificationSettings get notificationSettings =>
      _WLNotificationsNotificationSettings._(
        [..._s, _Screens.notificationSettings],
        [..._i, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLNotificationsNotificationSettings
    implements Hop<NotificationSettingsNav> {
  const _WLNotificationsNotificationSettings._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  NotificationSettingsNav get nav => const NotificationSettingsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSearch implements Hop<SearchNav> {
  const _WLSearch._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SearchNav get nav => const SearchNav._();
  _WLSearchSearchResults get searchResults =>
      _WLSearchSearchResults._([..._s, _Screens.searchResults], [..._i, null]);
  _WLSearchQ query(Set<SearchQueryArg> q) =>
      _WLSearchQ(_s, _i, {for (final t in q) t.key: t.value}, const {});
  _WLSearchF fragment(Set<SearchFragmentArg> f) =>
      _WLSearchF(_s, _i, const {}, {for (final t in f) t.key: t.value});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLSearchQ {
  _WLSearchQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  _WLSearchF fragment(Set<SearchFragmentArg> f) =>
      _WLSearchF(_s, _i, _q, {for (final t in f) t.key: t.value});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

class _WLSearchF {
  _WLSearchF(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLSearchSearchResults implements Hop<SearchResultsNav> {
  const _WLSearchSearchResults._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SearchResultsNav get nav => const SearchResultsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettings implements Hop<SettingsNav> {
  const _WLSettings._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SettingsNav get nav => const SettingsNav._();
  _WLSettingsAccountSettings get accountSettings =>
      _WLSettingsAccountSettings._(
        [..._s, _Screens.accountSettings],
        [..._i, null],
      );
  _WLSettingsSecurity get security =>
      _WLSettingsSecurity._([..._s, _Screens.security], [..._i, null]);
  _WLSettingsPrivacy get privacy =>
      _WLSettingsPrivacy._([..._s, _Screens.privacy], [..._i, null]);
  _WLSettingsAppearance get appearance =>
      _WLSettingsAppearance._([..._s, _Screens.appearance], [..._i, null]);
  _WLSettingsLanguage get language =>
      _WLSettingsLanguage._([..._s, _Screens.language], [..._i, null]);
  _WLSettingsConnectedApps get connectedApps => _WLSettingsConnectedApps._(
    [..._s, _Screens.connectedApps],
    [..._i, null],
  );
  _WLSettingsAbout get about =>
      _WLSettingsAbout._([..._s, _Screens.about], [..._i, null]);
  _WLSettingsBlockedUsers get blockedUsers =>
      _WLSettingsBlockedUsers._([..._s, _Screens.blockedUsers], [..._i, null]);
  _WLSettingsDevices get devices =>
      _WLSettingsDevices._([..._s, _Screens.devices], [..._i, null]);
  _WLSettingsDataExport get dataExport =>
      _WLSettingsDataExport._([..._s, _Screens.dataExport], [..._i, null]);
  _WLSettingsDeleteAccount get deleteAccount => _WLSettingsDeleteAccount._(
    [..._s, _Screens.deleteAccount],
    [..._i, null],
  );
  _WLSettingsIntegrations get integrations =>
      _WLSettingsIntegrations._([..._s, _Screens.integrations], [..._i, null]);
  _WLSettingsSupport get support =>
      _WLSettingsSupport._([..._s, Support.support], [..._i, null]);
  _WLSettingsAdmin get admin =>
      _WLSettingsAdmin._([..._s, Admin.admin], [..._i, null]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAccountSettings implements Hop<AccountSettingsNav> {
  const _WLSettingsAccountSettings._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AccountSettingsNav get nav => const AccountSettingsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsSecurity implements Hop<SecurityNav> {
  const _WLSettingsSecurity._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SecurityNav get nav => const SecurityNav._();
  _WLSettingsSecurityTwoFactorSettings get twoFactorSettings =>
      _WLSettingsSecurityTwoFactorSettings._(
        [..._s, _Screens.twoFactorSettings],
        [..._i, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsSecurityTwoFactorSettings
    implements Hop<TwoFactorSettingsNav> {
  const _WLSettingsSecurityTwoFactorSettings._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  TwoFactorSettingsNav get nav => const TwoFactorSettingsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsPrivacy implements Hop<PrivacyNav> {
  const _WLSettingsPrivacy._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  PrivacyNav get nav => const PrivacyNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAppearance implements Hop<AppearanceNav> {
  const _WLSettingsAppearance._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AppearanceNav get nav => const AppearanceNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsLanguage implements Hop<LanguageNav> {
  const _WLSettingsLanguage._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  LanguageNav get nav => const LanguageNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsConnectedApps implements Hop<ConnectedAppsNav> {
  const _WLSettingsConnectedApps._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ConnectedAppsNav get nav => const ConnectedAppsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAbout implements Hop<AboutNav> {
  const _WLSettingsAbout._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AboutNav get nav => const AboutNav._();
  _WLSettingsAboutHelp get help =>
      _WLSettingsAboutHelp._([..._s, _Screens.help], [..._i, null]);
  _WLSettingsAboutFeedback get feedback =>
      _WLSettingsAboutFeedback._([..._s, _Screens.feedback], [..._i, null]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAboutHelp implements Hop<HelpNav> {
  const _WLSettingsAboutHelp._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HelpNav get nav => const HelpNav._();
  _WLSettingsAboutHelpHelpCategory helpCategory(String id) =>
      _WLSettingsAboutHelpHelpCategory._(
        [..._s, _Screens.helpCategory],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAboutHelpHelpCategory implements Hop<HelpCategoryNav> {
  const _WLSettingsAboutHelpHelpCategory._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  HelpCategoryNav get nav => const HelpCategoryNav._();
  _WLSettingsAboutHelpHelpCategoryFaq get faq =>
      _WLSettingsAboutHelpHelpCategoryFaq._(
        [..._s, _Screens.faq],
        [..._i, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAboutHelpHelpCategoryFaq implements Hop<FaqNav> {
  const _WLSettingsAboutHelpHelpCategoryFaq._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  FaqNav get nav => const FaqNav._();
  _WLSettingsAboutHelpHelpCategoryFaqFaqArticle faqArticle(String id) =>
      _WLSettingsAboutHelpHelpCategoryFaqFaqArticle._(
        [..._s, _Screens.faqArticle],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAboutHelpHelpCategoryFaqFaqArticle
    implements Hop<FaqArticleNav> {
  const _WLSettingsAboutHelpHelpCategoryFaqFaqArticle._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  FaqArticleNav get nav => const FaqArticleNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAboutFeedback implements Hop<FeedbackNav> {
  const _WLSettingsAboutFeedback._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  FeedbackNav get nav => const FeedbackNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsBlockedUsers implements Hop<BlockedUsersNav> {
  const _WLSettingsBlockedUsers._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  BlockedUsersNav get nav => const BlockedUsersNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsDevices implements Hop<DevicesNav> {
  const _WLSettingsDevices._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  DevicesNav get nav => const DevicesNav._();
  _WLSettingsDevicesDevice device(String id) =>
      _WLSettingsDevicesDevice._([..._s, _Screens.device], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsDevicesDevice implements Hop<DeviceNav> {
  const _WLSettingsDevicesDevice._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  DeviceNav get nav => const DeviceNav._();
  _WLSettingsDevicesDeviceSessions get sessions =>
      _WLSettingsDevicesDeviceSessions._(
        [..._s, _Screens.sessions],
        [..._i, null],
      );
  _WLSettingsDevicesDeviceSession session(String id) =>
      _WLSettingsDevicesDeviceSession._([..._s, _Screens.session], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsDevicesDeviceSessions implements Hop<SessionsNav> {
  const _WLSettingsDevicesDeviceSessions._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SessionsNav get nav => const SessionsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsDevicesDeviceSession implements Hop<SessionNav> {
  const _WLSettingsDevicesDeviceSession._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SessionNav get nav => const SessionNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsDataExport implements Hop<DataExportNav> {
  const _WLSettingsDataExport._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  DataExportNav get nav => const DataExportNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsDeleteAccount implements Hop<DeleteAccountNav> {
  const _WLSettingsDeleteAccount._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  DeleteAccountNav get nav => const DeleteAccountNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsIntegrations implements Hop<IntegrationsNav> {
  const _WLSettingsIntegrations._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  IntegrationsNav get nav => const IntegrationsNav._();
  _WLSettingsIntegrationsApiKeys get apiKeys =>
      _WLSettingsIntegrationsApiKeys._(
        [..._s, _Screens.apiKeys],
        [..._i, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsIntegrationsApiKeys implements Hop<ApiKeysNav> {
  const _WLSettingsIntegrationsApiKeys._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ApiKeysNav get nav => const ApiKeysNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsSupport implements Hop<SupportNav> {
  const _WLSettingsSupport._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SupportNav get nav => const SupportNav._();
  _WLSettingsSupportSupportTickets get supportTickets =>
      _WLSettingsSupportSupportTickets._(
        [..._s, Support.supportTickets],
        [..._i, null],
      );
  _WLSettingsSupportNewTicket get newTicket =>
      _WLSettingsSupportNewTicket._([..._s, Support.newTicket], [..._i, null]);
  _WLSettingsSupportKnowledgeBase get knowledgeBase =>
      _WLSettingsSupportKnowledgeBase._(
        [..._s, Support.knowledgeBase],
        [..._i, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsSupportSupportTickets implements Hop<SupportTicketsNav> {
  const _WLSettingsSupportSupportTickets._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SupportTicketsNav get nav => const SupportTicketsNav._();
  _WLSettingsSupportSupportTicketsSupportTicket supportTicket(String id) =>
      _WLSettingsSupportSupportTicketsSupportTicket._(
        [..._s, Support.supportTicket],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsSupportSupportTicketsSupportTicket
    implements Hop<SupportTicketNav> {
  const _WLSettingsSupportSupportTicketsSupportTicket._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SupportTicketNav get nav => const SupportTicketNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsSupportNewTicket implements Hop<NewTicketNav> {
  const _WLSettingsSupportNewTicket._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  NewTicketNav get nav => const NewTicketNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsSupportKnowledgeBase implements Hop<KnowledgeBaseNav> {
  const _WLSettingsSupportKnowledgeBase._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  KnowledgeBaseNav get nav => const KnowledgeBaseNav._();
  _WLSettingsSupportKnowledgeBaseArticle article(String id) =>
      _WLSettingsSupportKnowledgeBaseArticle._(
        [..._s, Support.article],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsSupportKnowledgeBaseArticle implements Hop<ArticleNav> {
  const _WLSettingsSupportKnowledgeBaseArticle._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ArticleNav get nav => const ArticleNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAdmin implements Hop<AdminNav> {
  const _WLSettingsAdmin._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AdminNav get nav => const AdminNav._();
  _WLSettingsAdminAdminUsers get adminUsers =>
      _WLSettingsAdminAdminUsers._([..._s, Admin.adminUsers], [..._i, null]);
  _WLSettingsAdminAdminAuditLog get adminAuditLog =>
      _WLSettingsAdminAdminAuditLog._(
        [..._s, Admin.adminAuditLog],
        [..._i, null],
      );
  _WLSettingsAdminAdminFeatureFlags get adminFeatureFlags =>
      _WLSettingsAdminAdminFeatureFlags._(
        [..._s, Admin.adminFeatureFlags],
        [..._i, null],
      );
  _WLSettingsAdminWebhooks get webhooks =>
      _WLSettingsAdminWebhooks._([..._s, Admin.webhooks], [..._i, null]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAdminAdminUsers implements Hop<AdminUsersNav> {
  const _WLSettingsAdminAdminUsers._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AdminUsersNav get nav => const AdminUsersNav._();
  _WLSettingsAdminAdminUsersAdminUser adminUser(String id) =>
      _WLSettingsAdminAdminUsersAdminUser._(
        [..._s, Admin.adminUser],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAdminAdminUsersAdminUser implements Hop<AdminUserNav> {
  const _WLSettingsAdminAdminUsersAdminUser._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AdminUserNav get nav => const AdminUserNav._();
  _WLSettingsAdminAdminUsersAdminUserAdminRole adminRole(String id) =>
      _WLSettingsAdminAdminUsersAdminUserAdminRole._(
        [..._s, Admin.adminRole],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAdminAdminUsersAdminUserAdminRole
    implements Hop<AdminRoleNav> {
  const _WLSettingsAdminAdminUsersAdminUserAdminRole._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AdminRoleNav get nav => const AdminRoleNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAdminAdminAuditLog implements Hop<AdminAuditLogNav> {
  const _WLSettingsAdminAdminAuditLog._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AdminAuditLogNav get nav => const AdminAuditLogNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAdminAdminFeatureFlags
    implements Hop<AdminFeatureFlagsNav> {
  const _WLSettingsAdminAdminFeatureFlags._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AdminFeatureFlagsNav get nav => const AdminFeatureFlagsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAdminWebhooks implements Hop<WebhooksNav> {
  const _WLSettingsAdminWebhooks._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  WebhooksNav get nav => const WebhooksNav._();
  _WLSettingsAdminWebhooksWebhook webhook(String id) =>
      _WLSettingsAdminWebhooksWebhook._([..._s, Admin.webhook], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLSettingsAdminWebhooksWebhook implements Hop<WebhookNav> {
  const _WLSettingsAdminWebhooksWebhook._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  WebhookNav get nav => const WebhookNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWorkspace implements Hop<WorkspaceNav> {
  const _WLWorkspace._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  WorkspaceNav get nav => const WorkspaceNav._();
  _WLWorkspaceProject project(String id) =>
      _WLWorkspaceProject._([..._s, _Screens.project], [..._i, id]);
  _WLWorkspaceQ query(Set<WorkspaceQueryArg> q) =>
      _WLWorkspaceQ(_s, _i, {for (final t in q) t.key: t.value}, const {});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLWorkspaceQ {
  _WLWorkspaceQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLWorkspaceProject implements Hop<ProjectNav> {
  const _WLWorkspaceProject._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ProjectNav get nav => const ProjectNav._();
  _WLWorkspaceProjectBoard board(String id) =>
      _WLWorkspaceProjectBoard._([..._s, _Screens.board], [..._i, id]);
  _WLWorkspaceProjectUserProfile userProfile(String id) =>
      _WLWorkspaceProjectUserProfile._(
        [..._s, _Screens.userProfile],
        [..._i, id],
      );
  _WLWorkspaceProjectQ query(Set<ProjectQueryArg> q) => _WLWorkspaceProjectQ(
    _s,
    _i,
    {for (final t in q) t.key: t.value},
    const {},
  );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLWorkspaceProjectQ {
  _WLWorkspaceProjectQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLWorkspaceProjectBoard implements Hop<BoardNav> {
  const _WLWorkspaceProjectBoard._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  BoardNav get nav => const BoardNav._();
  _WLWorkspaceProjectBoardTaskList taskList(String id) =>
      _WLWorkspaceProjectBoardTaskList._(
        [..._s, _Screens.taskList],
        [..._i, id],
      );
  _WLWorkspaceProjectBoardQ query(Set<BoardQueryArg> q) =>
      _WLWorkspaceProjectBoardQ(_s, _i, {
        for (final t in q) t.key: t.value,
      }, const {});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLWorkspaceProjectBoardQ {
  _WLWorkspaceProjectBoardQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLWorkspaceProjectBoardTaskList implements Hop<TaskListNav> {
  const _WLWorkspaceProjectBoardTaskList._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  TaskListNav get nav => const TaskListNav._();
  _WLWorkspaceProjectBoardTaskListTask task(String id) =>
      _WLWorkspaceProjectBoardTaskListTask._(
        [..._s, _Screens.task],
        [..._i, id],
      );
  _WLWorkspaceProjectBoardTaskListTaskEditTask editTask(String id) =>
      _WLWorkspaceProjectBoardTaskListTaskEditTask._(
        [..._s, _Screens.task, _Screens.editTask],
        [..._i, id, null],
      );
  _WLWorkspaceProjectBoardTaskListTaskTaskComment taskComment(String id) =>
      _WLWorkspaceProjectBoardTaskListTaskTaskComment._(
        [..._s, _Screens.task, _Screens.taskComment],
        [..._i, id, null],
      );
  _WLWorkspaceProjectBoardTaskListMilestone milestone(String id) =>
      _WLWorkspaceProjectBoardTaskListMilestone._(
        [..._s, _Screens.milestone],
        [..._i, id],
      );
  _WLWorkspaceProjectBoardTaskListSprint sprint(String id) =>
      _WLWorkspaceProjectBoardTaskListSprint._(
        [..._s, _Screens.sprint],
        [..._i, id],
      );
  _WLWorkspaceProjectBoardTaskListQ query(Set<TaskListQueryArg> q) =>
      _WLWorkspaceProjectBoardTaskListQ(_s, _i, {
        for (final t in q) t.key: t.value,
      }, const {});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLWorkspaceProjectBoardTaskListQ {
  _WLWorkspaceProjectBoardTaskListQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLWorkspaceProjectBoardTaskListTask implements Hop<TaskNav> {
  const _WLWorkspaceProjectBoardTaskListTask._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  TaskNav get nav => const TaskNav._();
  _WLWorkspaceProjectBoardTaskListTaskSubtask subtask(String id) =>
      _WLWorkspaceProjectBoardTaskListTaskSubtask._(
        [..._s, _Screens.subtask],
        [..._i, id],
      );
  _WLWorkspaceProjectBoardTaskListTaskEditTask get editTask =>
      _WLWorkspaceProjectBoardTaskListTaskEditTask._(
        [..._s, _Screens.editTask],
        [..._i, null],
      );
  _WLWorkspaceProjectBoardTaskListTaskTaskComment get taskComment =>
      _WLWorkspaceProjectBoardTaskListTaskTaskComment._(
        [..._s, _Screens.taskComment],
        [..._i, null],
      );
  _WLWorkspaceProjectBoardTaskListTaskAssignee assignee(String id) =>
      _WLWorkspaceProjectBoardTaskListTaskAssignee._(
        [..._s, _Screens.assignee],
        [..._i, id],
      );
  _WLWorkspaceProjectBoardTaskListTaskLabel label(String id) =>
      _WLWorkspaceProjectBoardTaskListTaskLabel._(
        [..._s, _Screens.label],
        [..._i, id],
      );
  _WLWorkspaceProjectBoardTaskListTaskQ query(Set<TaskQueryArg> q) =>
      _WLWorkspaceProjectBoardTaskListTaskQ(_s, _i, {
        for (final t in q) t.key: t.value,
      }, const {});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLWorkspaceProjectBoardTaskListTaskQ {
  _WLWorkspaceProjectBoardTaskListTaskQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLWorkspaceProjectBoardTaskListTaskSubtask
    implements Hop<SubtaskNav> {
  const _WLWorkspaceProjectBoardTaskListTaskSubtask._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SubtaskNav get nav => const SubtaskNav._();
  _WLWorkspaceProjectBoardTaskListTaskSubtaskChecklistItem checklistItem(
    String id,
  ) => _WLWorkspaceProjectBoardTaskListTaskSubtaskChecklistItem._(
    [..._s, _Screens.checklistItem],
    [..._i, id],
  );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWorkspaceProjectBoardTaskListTaskSubtaskChecklistItem
    implements Hop<ChecklistItemNav> {
  const _WLWorkspaceProjectBoardTaskListTaskSubtaskChecklistItem._(
    this._s,
    this._i,
  );
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ChecklistItemNav get nav => const ChecklistItemNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWorkspaceProjectBoardTaskListTaskEditTask
    implements Hop<EditTaskNav> {
  const _WLWorkspaceProjectBoardTaskListTaskEditTask._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  EditTaskNav get nav => const EditTaskNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWorkspaceProjectBoardTaskListTaskTaskComment
    implements Hop<TaskCommentNav> {
  const _WLWorkspaceProjectBoardTaskListTaskTaskComment._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  TaskCommentNav get nav => const TaskCommentNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWorkspaceProjectBoardTaskListTaskAssignee
    implements Hop<AssigneeNav> {
  const _WLWorkspaceProjectBoardTaskListTaskAssignee._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AssigneeNav get nav => const AssigneeNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWorkspaceProjectBoardTaskListTaskLabel implements Hop<LabelNav> {
  const _WLWorkspaceProjectBoardTaskListTaskLabel._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  LabelNav get nav => const LabelNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWorkspaceProjectBoardTaskListMilestone
    implements Hop<MilestoneNav> {
  const _WLWorkspaceProjectBoardTaskListMilestone._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  MilestoneNav get nav => const MilestoneNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWorkspaceProjectBoardTaskListSprint implements Hop<SprintNav> {
  const _WLWorkspaceProjectBoardTaskListSprint._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  SprintNav get nav => const SprintNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLWorkspaceProjectUserProfile
    implements Hop<WorkspaceProjectUserProfileNav> {
  const _WLWorkspaceProjectUserProfile._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  WorkspaceProjectUserProfileNav get nav =>
      const WorkspaceProjectUserProfileNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLForum implements Hop<ForumNav> {
  const _WLForum._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ForumNav get nav => const ForumNav._();
  _WLForumForumCategory forumCategory(String id) =>
      _WLForumForumCategory._([..._s, _Screens.forumCategory], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLForumForumCategory implements Hop<ForumCategoryNav> {
  const _WLForumForumCategory._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ForumCategoryNav get nav => const ForumCategoryNav._();
  _WLForumForumCategoryForumThread forumThread(String id) =>
      _WLForumForumCategoryForumThread._(
        [..._s, _Screens.forumThread],
        [..._i, id],
      );
  _WLForumForumCategoryForumThreadReportThread reportThread(String id) =>
      _WLForumForumCategoryForumThreadReportThread._(
        [..._s, _Screens.forumThread, _Screens.reportThread],
        [..._i, id, null],
      );
  _WLForumForumCategoryQ query(Set<ForumCategoryQueryArg> q) =>
      _WLForumForumCategoryQ(_s, _i, {
        for (final t in q) t.key: t.value,
      }, const {});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLForumForumCategoryQ {
  _WLForumForumCategoryQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLForumForumCategoryForumThread implements Hop<ForumThreadNav> {
  const _WLForumForumCategoryForumThread._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ForumThreadNav get nav => const ForumThreadNav._();
  _WLForumForumCategoryForumThreadForumReply forumReply(String id) =>
      _WLForumForumCategoryForumThreadForumReply._(
        [..._s, _Screens.forumReply],
        [..._i, id],
      );
  _WLForumForumCategoryForumThreadReportThread get reportThread =>
      _WLForumForumCategoryForumThreadReportThread._(
        [..._s, _Screens.reportThread],
        [..._i, null],
      );
  _WLForumForumCategoryForumThreadQ query(Set<ForumThreadQueryArg> q) =>
      _WLForumForumCategoryForumThreadQ(_s, _i, {
        for (final t in q) t.key: t.value,
      }, const {});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLForumForumCategoryForumThreadQ {
  _WLForumForumCategoryForumThreadQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLForumForumCategoryForumThreadForumReply
    implements Hop<ForumReplyNav> {
  const _WLForumForumCategoryForumThreadForumReply._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ForumReplyNav get nav => const ForumReplyNav._();
  _WLForumForumCategoryForumThreadForumReplyUserProfile userProfile(
    String id,
  ) => _WLForumForumCategoryForumThreadForumReplyUserProfile._(
    [..._s, _Screens.userProfile],
    [..._i, id],
  );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLForumForumCategoryForumThreadForumReplyUserProfile
    implements Hop<ForumForumCategoryForumThreadForumReplyUserProfileNav> {
  const _WLForumForumCategoryForumThreadForumReplyUserProfile._(
    this._s,
    this._i,
  );
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ForumForumCategoryForumThreadForumReplyUserProfileNav get nav =>
      const ForumForumCategoryForumThreadForumReplyUserProfileNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLForumForumCategoryForumThreadReportThread
    implements Hop<ReportThreadNav> {
  const _WLForumForumCategoryForumThreadReportThread._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ReportThreadNav get nav => const ReportThreadNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLLearn implements Hop<LearnNav> {
  const _WLLearn._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  LearnNav get nav => const LearnNav._();
  _WLLearnCourse course(String id) =>
      _WLLearnCourse._([..._s, _Screens.course], [..._i, id]);
  _WLLearnCourseCertificate certificate(String id) =>
      _WLLearnCourseCertificate._(
        [..._s, _Screens.course, _Screens.certificate],
        [..._i, id, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLLearnCourse implements Hop<CourseNav> {
  const _WLLearnCourse._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CourseNav get nav => const CourseNav._();
  _WLLearnCourseCourseModule courseModule(String id) =>
      _WLLearnCourseCourseModule._([..._s, _Screens.courseModule], [..._i, id]);
  _WLLearnCourseCertificate get certificate =>
      _WLLearnCourseCertificate._([..._s, _Screens.certificate], [..._i, null]);
  _WLLearnCourseQ query(Set<CourseQueryArg> q) =>
      _WLLearnCourseQ(_s, _i, {for (final t in q) t.key: t.value}, const {});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLLearnCourseQ {
  _WLLearnCourseQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLLearnCourseCourseModule implements Hop<CourseModuleNav> {
  const _WLLearnCourseCourseModule._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CourseModuleNav get nav => const CourseModuleNav._();
  _WLLearnCourseCourseModuleLesson lesson(String id) =>
      _WLLearnCourseCourseModuleLesson._([..._s, _Screens.lesson], [..._i, id]);
  _WLLearnCourseCourseModuleInstructor instructor(String id) =>
      _WLLearnCourseCourseModuleInstructor._(
        [..._s, _Screens.instructor],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLLearnCourseCourseModuleLesson implements Hop<LessonNav> {
  const _WLLearnCourseCourseModuleLesson._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  LessonNav get nav => const LessonNav._();
  _WLLearnCourseCourseModuleLessonQuiz quiz(String id) =>
      _WLLearnCourseCourseModuleLessonQuiz._(
        [..._s, _Screens.quiz],
        [..._i, id],
      );
  _WLLearnCourseCourseModuleLessonCourseReview courseReview(String id) =>
      _WLLearnCourseCourseModuleLessonCourseReview._(
        [..._s, _Screens.courseReview],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLLearnCourseCourseModuleLessonQuiz implements Hop<QuizNav> {
  const _WLLearnCourseCourseModuleLessonQuiz._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  QuizNav get nav => const QuizNav._();
  _WLLearnCourseCourseModuleLessonQuizQuestion question(String id) =>
      _WLLearnCourseCourseModuleLessonQuizQuestion._(
        [..._s, _Screens.question],
        [..._i, id],
      );
  _WLLearnCourseCourseModuleLessonQuizQuestionAnswer answer(String id) =>
      _WLLearnCourseCourseModuleLessonQuizQuestionAnswer._(
        [..._s, _Screens.question, _Screens.answer],
        [..._i, id, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLLearnCourseCourseModuleLessonQuizQuestion
    implements Hop<QuestionNav> {
  const _WLLearnCourseCourseModuleLessonQuizQuestion._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  QuestionNav get nav => const QuestionNav._();
  _WLLearnCourseCourseModuleLessonQuizQuestionAnswer get answer =>
      _WLLearnCourseCourseModuleLessonQuizQuestionAnswer._(
        [..._s, _Screens.answer],
        [..._i, null],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLLearnCourseCourseModuleLessonQuizQuestionAnswer
    implements Hop<AnswerNav> {
  const _WLLearnCourseCourseModuleLessonQuizQuestionAnswer._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  AnswerNav get nav => const AnswerNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLLearnCourseCourseModuleLessonCourseReview
    implements Hop<CourseReviewNav> {
  const _WLLearnCourseCourseModuleLessonCourseReview._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CourseReviewNav get nav => const CourseReviewNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLLearnCourseCourseModuleInstructor implements Hop<InstructorNav> {
  const _WLLearnCourseCourseModuleInstructor._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  InstructorNav get nav => const InstructorNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLLearnCourseCertificate implements Hop<CertificateNav> {
  const _WLLearnCourseCertificate._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CertificateNav get nav => const CertificateNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLShop implements Hop<ShopNav> {
  const _WLShop._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ShopNav get nav => const ShopNav._();
  _WLShopShopDept shopDept(String id) =>
      _WLShopShopDept._([..._s, _Screens.shopDept], [..._i, id]);
  _WLShopCompareProducts get compareProducts => _WLShopCompareProducts._(
    [..._s, _Screens.compareProducts],
    [..._i, null],
  );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLShopShopDept implements Hop<ShopDeptNav> {
  const _WLShopShopDept._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ShopDeptNav get nav => const ShopDeptNav._();
  _WLShopShopDeptShopCategory shopCategory(String id) =>
      _WLShopShopDeptShopCategory._(
        [..._s, _Screens.shopCategory],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLShopShopDeptShopCategory implements Hop<ShopCategoryNav> {
  const _WLShopShopDeptShopCategory._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ShopCategoryNav get nav => const ShopCategoryNav._();
  _WLShopShopDeptShopCategoryShopSubcategory shopSubcategory(String id) =>
      _WLShopShopDeptShopCategoryShopSubcategory._(
        [..._s, _Screens.shopSubcategory],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLShopShopDeptShopCategoryShopSubcategory
    implements Hop<ShopSubcategoryNav> {
  const _WLShopShopDeptShopCategoryShopSubcategory._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ShopSubcategoryNav get nav => const ShopSubcategoryNav._();
  _WLShopShopDeptShopCategoryShopSubcategoryProduct product(String id) =>
      _WLShopShopDeptShopCategoryShopSubcategoryProduct._(
        [..._s, _Screens.product],
        [..._i, id],
      );
  _WLShopShopDeptShopCategoryShopSubcategoryQ query(
    Set<ShopSubcategoryQueryArg> q,
  ) => _WLShopShopDeptShopCategoryShopSubcategoryQ(_s, _i, {
    for (final t in q) t.key: t.value,
  }, const {});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLShopShopDeptShopCategoryShopSubcategoryQ {
  _WLShopShopDeptShopCategoryShopSubcategoryQ(
    this._s,
    this._i,
    this._q,
    this._f,
  );
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLShopShopDeptShopCategoryShopSubcategoryProduct
    implements Hop<ProductNav> {
  const _WLShopShopDeptShopCategoryShopSubcategoryProduct._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ProductNav get nav => const ProductNav._();
  _WLShopShopDeptShopCategoryShopSubcategoryProductProductVariant
  productVariant(String id) =>
      _WLShopShopDeptShopCategoryShopSubcategoryProductProductVariant._(
        [..._s, _Screens.productVariant],
        [..._i, id],
      );
  _WLShopShopDeptShopCategoryShopSubcategoryProductProductReview productReview(
    String id,
  ) => _WLShopShopDeptShopCategoryShopSubcategoryProductProductReview._(
    [..._s, _Screens.productReview],
    [..._i, id],
  );
  _WLShopShopDeptShopCategoryShopSubcategoryProductBrand brand(String id) =>
      _WLShopShopDeptShopCategoryShopSubcategoryProductBrand._(
        [..._s, _Screens.brand],
        [..._i, id],
      );
  _WLShopShopDeptShopCategoryShopSubcategoryProductQ query(
    Set<ProductQueryArg> q,
  ) => _WLShopShopDeptShopCategoryShopSubcategoryProductQ(_s, _i, {
    for (final t in q) t.key: t.value,
  }, const {});
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLShopShopDeptShopCategoryShopSubcategoryProductQ {
  _WLShopShopDeptShopCategoryShopSubcategoryProductQ(
    this._s,
    this._i,
    this._q,
    this._f,
  );
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLShopShopDeptShopCategoryShopSubcategoryProductProductVariant
    implements Hop<ProductVariantNav> {
  const _WLShopShopDeptShopCategoryShopSubcategoryProductProductVariant._(
    this._s,
    this._i,
  );
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ProductVariantNav get nav => const ProductVariantNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLShopShopDeptShopCategoryShopSubcategoryProductProductReview
    implements Hop<ProductReviewNav> {
  const _WLShopShopDeptShopCategoryShopSubcategoryProductProductReview._(
    this._s,
    this._i,
  );
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ProductReviewNav get nav => const ProductReviewNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLShopShopDeptShopCategoryShopSubcategoryProductBrand
    implements Hop<BrandNav> {
  const _WLShopShopDeptShopCategoryShopSubcategoryProductBrand._(
    this._s,
    this._i,
  );
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  BrandNav get nav => const BrandNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLShopCompareProducts implements Hop<CompareProductsNav> {
  const _WLShopCompareProducts._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  CompareProductsNav get nav => const CompareProductsNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLActivity implements Hop<ActivityNav> {
  const _WLActivity._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ActivityNav get nav => const ActivityNav._();
  _WLActivityWorkout workout(String id) =>
      _WLActivityWorkout._([..._s, _Screens.workout], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLActivityWorkout implements Hop<WorkoutNav> {
  const _WLActivityWorkout._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  WorkoutNav get nav => const WorkoutNav._();
  _WLActivityWorkoutExercise exercise(String id) =>
      _WLActivityWorkoutExercise._([..._s, _Screens.exercise], [..._i, id]);
  _WLActivityWorkoutQ query(Set<WorkoutQueryArg> q) => _WLActivityWorkoutQ(
    _s,
    _i,
    {for (final t in q) t.key: t.value},
    const {},
  );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

class _WLActivityWorkoutQ {
  _WLActivityWorkoutQ(this._s, this._i, this._q, this._f);
  final List<Enum> _s;
  final List<Object?> _i;
  final Map<String, Object?> _q;
  final Map<String, Object?> _f;
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      _s,
      _i,
      _q,
      _f,
    ),
  );
}

final class _WLActivityWorkoutExercise implements Hop<ExerciseNav> {
  const _WLActivityWorkoutExercise._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ExerciseNav get nav => const ExerciseNav._();
  _WLActivityWorkoutExerciseExerciseSet exerciseSet(String id) =>
      _WLActivityWorkoutExerciseExerciseSet._(
        [..._s, _Screens.exerciseSet],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLActivityWorkoutExerciseExerciseSet
    implements Hop<ExerciseSetNav> {
  const _WLActivityWorkoutExerciseExerciseSet._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  ExerciseSetNav get nav => const ExerciseSetNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDeepDemo implements Hop<DeepDemoNav> {
  const _WLDeepDemo._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  DeepDemoNav get nav => const DeepDemoNav._();
  _WLDeepDemoLevelA levelA(String id) =>
      _WLDeepDemoLevelA._([..._s, _Screens.levelA], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDeepDemoLevelA implements Hop<LevelANav> {
  const _WLDeepDemoLevelA._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  LevelANav get nav => const LevelANav._();
  _WLDeepDemoLevelALevelB levelB(String id) =>
      _WLDeepDemoLevelALevelB._([..._s, _Screens.levelB], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDeepDemoLevelALevelB implements Hop<LevelBNav> {
  const _WLDeepDemoLevelALevelB._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  LevelBNav get nav => const LevelBNav._();
  _WLDeepDemoLevelALevelBLevelC levelC(String id) =>
      _WLDeepDemoLevelALevelBLevelC._([..._s, _Screens.levelC], [..._i, id]);
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDeepDemoLevelALevelBLevelC implements Hop<LevelCNav> {
  const _WLDeepDemoLevelALevelBLevelC._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  LevelCNav get nav => const LevelCNav._();
  _WLDeepDemoLevelALevelBLevelCLevelD levelD(String id) =>
      _WLDeepDemoLevelALevelBLevelCLevelD._(
        [..._s, _Screens.levelD],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDeepDemoLevelALevelBLevelCLevelD implements Hop<LevelDNav> {
  const _WLDeepDemoLevelALevelBLevelCLevelD._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  LevelDNav get nav => const LevelDNav._();
  _WLDeepDemoLevelALevelBLevelCLevelDLevelE levelE(String id) =>
      _WLDeepDemoLevelALevelBLevelCLevelDLevelE._(
        [..._s, _Screens.levelE],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDeepDemoLevelALevelBLevelCLevelDLevelE
    implements Hop<LevelENav> {
  const _WLDeepDemoLevelALevelBLevelCLevelDLevelE._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  LevelENav get nav => const LevelENav._();
  _WLDeepDemoLevelALevelBLevelCLevelDLevelELevelF levelF(String id) =>
      _WLDeepDemoLevelALevelBLevelCLevelDLevelELevelF._(
        [..._s, _Screens.levelF],
        [..._i, id],
      );
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

final class _WLDeepDemoLevelALevelBLevelCLevelDLevelELevelF
    implements Hop<LevelFNav> {
  const _WLDeepDemoLevelALevelBLevelCLevelDLevelELevelF._(this._s, this._i);
  final List<Enum> _s;
  final List<Object?> _i;
  @override
  List<(Enum, Object?)> get chain => [
    for (var k = 0; k < _s.length; k++) (_s[k], _i[k]),
  ];
  @override
  Enum get spec => _s.last;
  @override
  Object? get id => _i.last;
  @override
  LevelFNav get nav => const LevelFNav._();
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(domain ?? 'https://mega.example', _s, _i),
  );
}

/// Read-only placement view — the reactive reads return these.
sealed class AnyView {}

/// GLOBAL query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class QueryCond<T> implements ViewCond {
  const QueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  QueryCond<T> call(T v) => QueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static QueryCond<String> get filter =>
      const QueryCond._('filter', null, presence: true);
  static QueryCond<String> get sort =>
      const QueryCond._('sort', null, presence: true);
  static const QueryCond posts = QueryCond._('posts', true);
  static const QueryCond people = QueryCond._('people', true);
  static const QueryCond tags = QueryCond._('tags', true);
  static QueryCond<int> get min =>
      const QueryCond._('min', null, presence: true);
  static QueryCond<int> get max =>
      const QueryCond._('max', null, presence: true);
  static QueryCond<String> get q =>
      const QueryCond._('q', null, presence: true);
  static const QueryCond all = QueryCond._('all', true);
  static QueryCond<DateTime> get from =>
      const QueryCond._('from', null, presence: true);
  static QueryCond<DateTime> get to =>
      const QueryCond._('to', null, presence: true);
  static const QueryCond active = QueryCond._('active', true);
  static const QueryCond archived = QueryCond._('archived', true);
  static const QueryCond draft = QueryCond._('draft', true);
  static QueryCond<String> get dir =>
      const QueryCond._('dir', null, presence: true);
  static QueryCond<int> get minPrice =>
      const QueryCond._('minPrice', null, presence: true);
  static QueryCond<int> get maxPrice =>
      const QueryCond._('maxPrice', null, presence: true);
  static QueryCond<String> get brand =>
      const QueryCond._('brand', null, presence: true);
  static QueryCond<String> get condition =>
      const QueryCond._('condition', null, presence: true);
  static const QueryNot not = QueryNot._();
}

final class QueryNot {
  const QueryNot._();
  QueryCond<String> get filter =>
      const QueryCond._('filter', null, presence: true, negate: true);
  QueryCond<String> get sort =>
      const QueryCond._('sort', null, presence: true, negate: true);
  QueryCond get posts => const QueryCond._('posts', true, negate: true);
  QueryCond get people => const QueryCond._('people', true, negate: true);
  QueryCond get tags => const QueryCond._('tags', true, negate: true);
  QueryCond<int> get min =>
      const QueryCond._('min', null, presence: true, negate: true);
  QueryCond<int> get max =>
      const QueryCond._('max', null, presence: true, negate: true);
  QueryCond<String> get q =>
      const QueryCond._('q', null, presence: true, negate: true);
  QueryCond get all => const QueryCond._('all', true, negate: true);
  QueryCond<DateTime> get from =>
      const QueryCond._('from', null, presence: true, negate: true);
  QueryCond<DateTime> get to =>
      const QueryCond._('to', null, presence: true, negate: true);
  QueryCond get active => const QueryCond._('active', true, negate: true);
  QueryCond get archived => const QueryCond._('archived', true, negate: true);
  QueryCond get draft => const QueryCond._('draft', true, negate: true);
  QueryCond<String> get dir =>
      const QueryCond._('dir', null, presence: true, negate: true);
  QueryCond<int> get minPrice =>
      const QueryCond._('minPrice', null, presence: true, negate: true);
  QueryCond<int> get maxPrice =>
      const QueryCond._('maxPrice', null, presence: true, negate: true);
  QueryCond<String> get brand =>
      const QueryCond._('brand', null, presence: true, negate: true);
  QueryCond<String> get condition =>
      const QueryCond._('condition', null, presence: true, negate: true);
}

/// GLOBAL fragment condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class FragmentCond<T> implements ViewCond {
  const FragmentCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  FragmentCond<T> call(T v) => FragmentCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static FragmentCond<String> get tab =>
      const FragmentCond._('tab', null, presence: true);
  static FragmentCond<String> get pane =>
      const FragmentCond._('pane', null, presence: true);
  static const FragmentCond top = FragmentCond._('top', true);
  static FragmentCond<String> get view =>
      const FragmentCond._('view', null, presence: true);
  static const FragmentNot not = FragmentNot._();
}

final class FragmentNot {
  const FragmentNot._();
  FragmentCond<String> get tab =>
      const FragmentCond._('tab', null, presence: true, negate: true);
  FragmentCond<String> get pane =>
      const FragmentCond._('pane', null, presence: true, negate: true);
  FragmentCond get top => const FragmentCond._('top', true, negate: true);
  FragmentCond<String> get view =>
      const FragmentCond._('view', null, presence: true, negate: true);
}

/// Screen-local query view-state for `feed` (read-only).
class FeedQuery {
  const FeedQuery._();
  String? get filter =>
      _Screens.graph.viewGet(_Screens.feed, 'filter') as String?;
  String? get sort => _Screens.graph.viewGet(_Screens.feed, 'sort') as String?;
}

/// Mutable [FeedQuery] — set a key (null clears / removes from URL).
final class FeedQueryMut extends FeedQuery {
  const FeedQueryMut._() : super._();
  set filter(String? v) => _Screens.graph.viewSet(_Screens.feed, 'filter', v);
  set sort(String? v) => _Screens.graph.viewSet(_Screens.feed, 'sort', v);
}

/// Exactly-one `oneOf` choice for `feed` fragment view-state.
sealed class FeedFragmentChoice {
  const FeedFragmentChoice();
}

final class FeedFragmentTab extends FeedFragmentChoice {
  const FeedFragmentTab(this.value);
  final String value;
}

final class FeedFragmentPane extends FeedFragmentChoice {
  const FeedFragmentPane(this.value);
  final String value;
}

/// Screen-local fragment view-state for `feed` (read-only).
class FeedFragment {
  const FeedFragment._();
  FeedFragmentChoice? get choice {
    {
      final v = _Screens.graph.viewGet(_Screens.feed, 'tab') as String?;
      if (v != null) return FeedFragmentTab(v);
    }
    {
      final v = _Screens.graph.viewGet(_Screens.feed, 'pane') as String?;
      if (v != null) return FeedFragmentPane(v);
    }
    return null;
  }

  bool get top => _Screens.graph.viewGet(_Screens.feed, 'top') == true;
}

/// Mutable [FeedFragment] — set a key (null clears / removes from URL).
final class FeedFragmentMut extends FeedFragment {
  const FeedFragmentMut._() : super._();
  set choice(FeedFragmentChoice? v) {
    _Screens.graph.viewSet(
      _Screens.feed,
      'tab',
      v is FeedFragmentTab ? v.value : null,
    );
    _Screens.graph.viewSet(
      _Screens.feed,
      'pane',
      v is FeedFragmentPane ? v.value : null,
    );
  }

  set top(bool v) =>
      _Screens.graph.viewSet(_Screens.feed, 'top', v ? true : null);
}

/// `Feed` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class FeedQueryCond<T> implements ViewCond {
  const FeedQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  FeedQueryCond<T> call(T v) => FeedQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static FeedQueryCond<String> get filter =>
      const FeedQueryCond._('filter', null, presence: true);
  static FeedQueryCond<String> get sort =>
      const FeedQueryCond._('sort', null, presence: true);
  static const FeedQueryNot not = FeedQueryNot._();
}

final class FeedQueryNot {
  const FeedQueryNot._();
  FeedQueryCond<String> get filter =>
      const FeedQueryCond._('filter', null, presence: true, negate: true);
  FeedQueryCond<String> get sort =>
      const FeedQueryCond._('sort', null, presence: true, negate: true);
}

/// `Feed` fragment condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class FeedFragmentCond<T> implements ViewCond {
  const FeedFragmentCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  FeedFragmentCond<T> call(T v) =>
      FeedFragmentCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static FeedFragmentCond<String> get tab =>
      const FeedFragmentCond._('tab', null, presence: true);
  static FeedFragmentCond<String> get pane =>
      const FeedFragmentCond._('pane', null, presence: true);
  static const FeedFragmentCond top = FeedFragmentCond._('top', true);
  static const FeedFragmentNot not = FeedFragmentNot._();
}

final class FeedFragmentNot {
  const FeedFragmentNot._();
  FeedFragmentCond<String> get tab =>
      const FeedFragmentCond._('tab', null, presence: true, negate: true);
  FeedFragmentCond<String> get pane =>
      const FeedFragmentCond._('pane', null, presence: true, negate: true);
  FeedFragmentCond get top =>
      const FeedFragmentCond._('top', true, negate: true);
}

/// `Feed` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class FeedQueryArg {
  const FeedQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static FeedQueryArg filter(String v) => FeedQueryArg._('filter', v);
  static FeedQueryArg sort(String v) => FeedQueryArg._('sort', v);
}

/// `Feed` fragment build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class FeedFragmentArg {
  const FeedFragmentArg._(this.key, this.value);
  final String key;
  final Object? value;
  static FeedFragmentArg tab(String v) => FeedFragmentArg._('tab', v);
  static FeedFragmentArg pane(String v) => FeedFragmentArg._('pane', v);
  static const FeedFragmentArg top = FeedFragmentArg._('top', true);
}

/// Read-only view-state of `feed` — the reactive reads return
/// this; the navigable `FeedNav` adds the setters.
abstract interface class FeedView implements AnyView {
  FeedQuery get query;
  FeedFragment get fragment;
}

/// Screen-local query view-state for `post` (read-only).
class PostQuery {
  const PostQuery._();
  String? get sort => _Screens.graph.viewGet(_Screens.post, 'sort') as String?;
}

/// Mutable [PostQuery] — set a key (null clears / removes from URL).
final class PostQueryMut extends PostQuery {
  const PostQueryMut._() : super._();
  set sort(String? v) => _Screens.graph.viewSet(_Screens.post, 'sort', v);
}

/// `Post` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class PostQueryCond<T> implements ViewCond {
  const PostQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  PostQueryCond<T> call(T v) => PostQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static PostQueryCond<String> get sort =>
      const PostQueryCond._('sort', null, presence: true);
  static const PostQueryNot not = PostQueryNot._();
}

final class PostQueryNot {
  const PostQueryNot._();
  PostQueryCond<String> get sort =>
      const PostQueryCond._('sort', null, presence: true, negate: true);
}

/// `Post` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class PostQueryArg {
  const PostQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static PostQueryArg sort(String v) => PostQueryArg._('sort', v);
}

/// Read-only view-state of `post` — the reactive reads return
/// this; the navigable `PostNav` adds the setters.
abstract interface class PostView implements AnyView {
  PostQuery get query;
}

/// Exactly-one `oneOf` choice for `discover` query view-state.
sealed class DiscoverQueryChoice {
  const DiscoverQueryChoice();
}

final class DiscoverQueryPosts extends DiscoverQueryChoice {
  const DiscoverQueryPosts();
}

final class DiscoverQueryPeople extends DiscoverQueryChoice {
  const DiscoverQueryPeople();
}

final class DiscoverQueryTags extends DiscoverQueryChoice {
  const DiscoverQueryTags();
}

/// Screen-local query view-state for `discover` (read-only).
class DiscoverQuery {
  const DiscoverQuery._();
  DiscoverQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.discover, 'posts') == true)
      return const DiscoverQueryPosts();
    if (_Screens.graph.viewGet(_Screens.discover, 'people') == true)
      return const DiscoverQueryPeople();
    if (_Screens.graph.viewGet(_Screens.discover, 'tags') == true)
      return const DiscoverQueryTags();
    return null;
  }
}

/// Mutable [DiscoverQuery] — set a key (null clears / removes from URL).
final class DiscoverQueryMut extends DiscoverQuery {
  const DiscoverQueryMut._() : super._();
  set choice(DiscoverQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.discover,
      'posts',
      v is DiscoverQueryPosts ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.discover,
      'people',
      v is DiscoverQueryPeople ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.discover,
      'tags',
      v is DiscoverQueryTags ? true : null,
    );
  }
}

/// `Discover` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class DiscoverQueryCond<T> implements ViewCond {
  const DiscoverQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  DiscoverQueryCond<T> call(T v) =>
      DiscoverQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static const DiscoverQueryCond posts = DiscoverQueryCond._('posts', true);
  static const DiscoverQueryCond people = DiscoverQueryCond._('people', true);
  static const DiscoverQueryCond tags = DiscoverQueryCond._('tags', true);
  static const DiscoverQueryNot not = DiscoverQueryNot._();
}

final class DiscoverQueryNot {
  const DiscoverQueryNot._();
  DiscoverQueryCond get posts =>
      const DiscoverQueryCond._('posts', true, negate: true);
  DiscoverQueryCond get people =>
      const DiscoverQueryCond._('people', true, negate: true);
  DiscoverQueryCond get tags =>
      const DiscoverQueryCond._('tags', true, negate: true);
}

/// `Discover` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class DiscoverQueryArg {
  const DiscoverQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static const DiscoverQueryArg posts = DiscoverQueryArg._('posts', true);
  static const DiscoverQueryArg people = DiscoverQueryArg._('people', true);
  static const DiscoverQueryArg tags = DiscoverQueryArg._('tags', true);
}

/// Read-only view-state of `discover` — the reactive reads return
/// this; the navigable `DiscoverNav` adds the setters.
abstract interface class DiscoverView implements AnyView {
  DiscoverQuery get query;
}

/// Screen-local query view-state for `marketplace` (read-only).
class MarketplaceQuery {
  const MarketplaceQuery._();
  String? get sort =>
      _Screens.graph.viewGet(_Screens.marketplace, 'sort') as String?;
  ({int min, int max})? get group {
    final min = _Screens.graph.viewGet(_Screens.marketplace, 'min') as int?;
    final max = _Screens.graph.viewGet(_Screens.marketplace, 'max') as int?;
    return (min != null && max != null) ? (min: min, max: max) : null;
  }
}

/// Mutable [MarketplaceQuery] — set a key (null clears / removes from URL).
final class MarketplaceQueryMut extends MarketplaceQuery {
  const MarketplaceQueryMut._() : super._();
  set sort(String? v) =>
      _Screens.graph.viewSet(_Screens.marketplace, 'sort', v);
  set group(({int min, int max})? v) {
    _Screens.graph.viewSet(_Screens.marketplace, 'min', v?.min);
    _Screens.graph.viewSet(_Screens.marketplace, 'max', v?.max);
  }
}

/// `Marketplace` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class MarketplaceQueryCond<T> implements ViewCond {
  const MarketplaceQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  MarketplaceQueryCond<T> call(T v) =>
      MarketplaceQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static MarketplaceQueryCond<String> get sort =>
      const MarketplaceQueryCond._('sort', null, presence: true);
  static MarketplaceQueryCond<int> get min =>
      const MarketplaceQueryCond._('min', null, presence: true);
  static MarketplaceQueryCond<int> get max =>
      const MarketplaceQueryCond._('max', null, presence: true);
  static const MarketplaceQueryNot not = MarketplaceQueryNot._();
}

final class MarketplaceQueryNot {
  const MarketplaceQueryNot._();
  MarketplaceQueryCond<String> get sort =>
      const MarketplaceQueryCond._('sort', null, presence: true, negate: true);
  MarketplaceQueryCond<int> get min =>
      const MarketplaceQueryCond._('min', null, presence: true, negate: true);
  MarketplaceQueryCond<int> get max =>
      const MarketplaceQueryCond._('max', null, presence: true, negate: true);
}

/// `Marketplace` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class MarketplaceQueryArg {
  const MarketplaceQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static MarketplaceQueryArg sort(String v) => MarketplaceQueryArg._('sort', v);
  static MarketplaceQueryArg min(int v) => MarketplaceQueryArg._('min', v);
  static MarketplaceQueryArg max(int v) => MarketplaceQueryArg._('max', v);
}

/// Read-only view-state of `marketplace` — the reactive reads return
/// this; the navigable `MarketplaceNav` adds the setters.
abstract interface class MarketplaceView implements AnyView {
  MarketplaceQuery get query;
}

/// Exactly-one `oneOf` choice for `search` query view-state.
sealed class SearchQueryChoice {
  const SearchQueryChoice();
}

final class SearchQueryAll extends SearchQueryChoice {
  const SearchQueryAll();
}

final class SearchQueryPeople extends SearchQueryChoice {
  const SearchQueryPeople();
}

final class SearchQueryPosts extends SearchQueryChoice {
  const SearchQueryPosts();
}

final class SearchQueryTags extends SearchQueryChoice {
  const SearchQueryTags();
}

/// Screen-local query view-state for `search` (read-only).
class SearchQuery {
  const SearchQuery._();
  String? get q => _Screens.graph.viewGet(_Screens.search, 'q') as String?;
  SearchQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.search, 'all') == true)
      return const SearchQueryAll();
    if (_Screens.graph.viewGet(_Screens.search, 'people') == true)
      return const SearchQueryPeople();
    if (_Screens.graph.viewGet(_Screens.search, 'posts') == true)
      return const SearchQueryPosts();
    if (_Screens.graph.viewGet(_Screens.search, 'tags') == true)
      return const SearchQueryTags();
    return null;
  }

  ({DateTime from, DateTime to})? get group {
    final from = _Screens.graph.viewGet(_Screens.search, 'from') as DateTime?;
    final to = _Screens.graph.viewGet(_Screens.search, 'to') as DateTime?;
    return (from != null && to != null) ? (from: from, to: to) : null;
  }
}

/// Mutable [SearchQuery] — set a key (null clears / removes from URL).
final class SearchQueryMut extends SearchQuery {
  const SearchQueryMut._() : super._();
  set q(String? v) => _Screens.graph.viewSet(_Screens.search, 'q', v);
  set choice(SearchQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.search,
      'all',
      v is SearchQueryAll ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.search,
      'people',
      v is SearchQueryPeople ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.search,
      'posts',
      v is SearchQueryPosts ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.search,
      'tags',
      v is SearchQueryTags ? true : null,
    );
  }

  set group(({DateTime from, DateTime to})? v) {
    _Screens.graph.viewSet(_Screens.search, 'from', v?.from);
    _Screens.graph.viewSet(_Screens.search, 'to', v?.to);
  }
}

/// Screen-local fragment view-state for `search` (read-only).
class SearchFragment {
  const SearchFragment._();
  String? get view =>
      _Screens.graph.viewGet(_Screens.search, 'view') as String?;
}

/// Mutable [SearchFragment] — set a key (null clears / removes from URL).
final class SearchFragmentMut extends SearchFragment {
  const SearchFragmentMut._() : super._();
  set view(String? v) => _Screens.graph.viewSet(_Screens.search, 'view', v);
}

/// `Search` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class SearchQueryCond<T> implements ViewCond {
  const SearchQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  SearchQueryCond<T> call(T v) => SearchQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static SearchQueryCond<String> get q =>
      const SearchQueryCond._('q', null, presence: true);
  static const SearchQueryCond all = SearchQueryCond._('all', true);
  static const SearchQueryCond people = SearchQueryCond._('people', true);
  static const SearchQueryCond posts = SearchQueryCond._('posts', true);
  static const SearchQueryCond tags = SearchQueryCond._('tags', true);
  static SearchQueryCond<DateTime> get from =>
      const SearchQueryCond._('from', null, presence: true);
  static SearchQueryCond<DateTime> get to =>
      const SearchQueryCond._('to', null, presence: true);
  static const SearchQueryNot not = SearchQueryNot._();
}

final class SearchQueryNot {
  const SearchQueryNot._();
  SearchQueryCond<String> get q =>
      const SearchQueryCond._('q', null, presence: true, negate: true);
  SearchQueryCond get all => const SearchQueryCond._('all', true, negate: true);
  SearchQueryCond get people =>
      const SearchQueryCond._('people', true, negate: true);
  SearchQueryCond get posts =>
      const SearchQueryCond._('posts', true, negate: true);
  SearchQueryCond get tags =>
      const SearchQueryCond._('tags', true, negate: true);
  SearchQueryCond<DateTime> get from =>
      const SearchQueryCond._('from', null, presence: true, negate: true);
  SearchQueryCond<DateTime> get to =>
      const SearchQueryCond._('to', null, presence: true, negate: true);
}

/// `Search` fragment condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class SearchFragmentCond<T> implements ViewCond {
  const SearchFragmentCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  SearchFragmentCond<T> call(T v) =>
      SearchFragmentCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static SearchFragmentCond<String> get view =>
      const SearchFragmentCond._('view', null, presence: true);
  static const SearchFragmentNot not = SearchFragmentNot._();
}

final class SearchFragmentNot {
  const SearchFragmentNot._();
  SearchFragmentCond<String> get view =>
      const SearchFragmentCond._('view', null, presence: true, negate: true);
}

/// `Search` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class SearchQueryArg {
  const SearchQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static SearchQueryArg q(String v) => SearchQueryArg._('q', v);
  static const SearchQueryArg all = SearchQueryArg._('all', true);
  static const SearchQueryArg people = SearchQueryArg._('people', true);
  static const SearchQueryArg posts = SearchQueryArg._('posts', true);
  static const SearchQueryArg tags = SearchQueryArg._('tags', true);
  static SearchQueryArg from(DateTime v) => SearchQueryArg._('from', v);
  static SearchQueryArg to(DateTime v) => SearchQueryArg._('to', v);
}

/// `Search` fragment build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class SearchFragmentArg {
  const SearchFragmentArg._(this.key, this.value);
  final String key;
  final Object? value;
  static SearchFragmentArg view(String v) => SearchFragmentArg._('view', v);
}

/// Read-only view-state of `search` — the reactive reads return
/// this; the navigable `SearchNav` adds the setters.
abstract interface class SearchView implements AnyView {
  SearchQuery get query;
  SearchFragment get fragment;
}

/// Exactly-one `oneOf` choice for `workspace` query view-state.
sealed class WorkspaceQueryChoice {
  const WorkspaceQueryChoice();
}

final class WorkspaceQueryActive extends WorkspaceQueryChoice {
  const WorkspaceQueryActive();
}

final class WorkspaceQueryArchived extends WorkspaceQueryChoice {
  const WorkspaceQueryArchived();
}

final class WorkspaceQueryDraft extends WorkspaceQueryChoice {
  const WorkspaceQueryDraft();
}

/// Screen-local query view-state for `workspace` (read-only).
class WorkspaceQuery {
  const WorkspaceQuery._();
  WorkspaceQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.workspace, 'active') == true)
      return const WorkspaceQueryActive();
    if (_Screens.graph.viewGet(_Screens.workspace, 'archived') == true)
      return const WorkspaceQueryArchived();
    if (_Screens.graph.viewGet(_Screens.workspace, 'draft') == true)
      return const WorkspaceQueryDraft();
    return null;
  }
}

/// Mutable [WorkspaceQuery] — set a key (null clears / removes from URL).
final class WorkspaceQueryMut extends WorkspaceQuery {
  const WorkspaceQueryMut._() : super._();
  set choice(WorkspaceQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.workspace,
      'active',
      v is WorkspaceQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.workspace,
      'archived',
      v is WorkspaceQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.workspace,
      'draft',
      v is WorkspaceQueryDraft ? true : null,
    );
  }
}

/// `Workspace` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class WorkspaceQueryCond<T> implements ViewCond {
  const WorkspaceQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  WorkspaceQueryCond<T> call(T v) =>
      WorkspaceQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static const WorkspaceQueryCond active = WorkspaceQueryCond._('active', true);
  static const WorkspaceQueryCond archived = WorkspaceQueryCond._(
    'archived',
    true,
  );
  static const WorkspaceQueryCond draft = WorkspaceQueryCond._('draft', true);
  static const WorkspaceQueryNot not = WorkspaceQueryNot._();
}

final class WorkspaceQueryNot {
  const WorkspaceQueryNot._();
  WorkspaceQueryCond get active =>
      const WorkspaceQueryCond._('active', true, negate: true);
  WorkspaceQueryCond get archived =>
      const WorkspaceQueryCond._('archived', true, negate: true);
  WorkspaceQueryCond get draft =>
      const WorkspaceQueryCond._('draft', true, negate: true);
}

/// `Workspace` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class WorkspaceQueryArg {
  const WorkspaceQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static const WorkspaceQueryArg active = WorkspaceQueryArg._('active', true);
  static const WorkspaceQueryArg archived = WorkspaceQueryArg._(
    'archived',
    true,
  );
  static const WorkspaceQueryArg draft = WorkspaceQueryArg._('draft', true);
}

/// Read-only view-state of `workspace` — the reactive reads return
/// this; the navigable `WorkspaceNav` adds the setters.
abstract interface class WorkspaceView implements AnyView {
  WorkspaceQuery get query;
}

/// Exactly-one `oneOf` choice for `project` query view-state.
sealed class ProjectQueryChoice {
  const ProjectQueryChoice();
}

final class ProjectQueryActive extends ProjectQueryChoice {
  const ProjectQueryActive();
}

final class ProjectQueryArchived extends ProjectQueryChoice {
  const ProjectQueryArchived();
}

final class ProjectQueryDraft extends ProjectQueryChoice {
  const ProjectQueryDraft();
}

/// Screen-local query view-state for `project` (read-only).
class ProjectQuery {
  const ProjectQuery._();
  String? get sort =>
      _Screens.graph.viewGet(_Screens.project, 'sort') as String?;
  ProjectQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.project, 'active') == true)
      return const ProjectQueryActive();
    if (_Screens.graph.viewGet(_Screens.project, 'archived') == true)
      return const ProjectQueryArchived();
    if (_Screens.graph.viewGet(_Screens.project, 'draft') == true)
      return const ProjectQueryDraft();
    return null;
  }
}

/// Mutable [ProjectQuery] — set a key (null clears / removes from URL).
final class ProjectQueryMut extends ProjectQuery {
  const ProjectQueryMut._() : super._();
  set sort(String? v) => _Screens.graph.viewSet(_Screens.project, 'sort', v);
  set choice(ProjectQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.project,
      'active',
      v is ProjectQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.project,
      'archived',
      v is ProjectQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.project,
      'draft',
      v is ProjectQueryDraft ? true : null,
    );
  }
}

/// `Project` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class ProjectQueryCond<T> implements ViewCond {
  const ProjectQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  ProjectQueryCond<T> call(T v) =>
      ProjectQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static ProjectQueryCond<String> get sort =>
      const ProjectQueryCond._('sort', null, presence: true);
  static const ProjectQueryCond active = ProjectQueryCond._('active', true);
  static const ProjectQueryCond archived = ProjectQueryCond._('archived', true);
  static const ProjectQueryCond draft = ProjectQueryCond._('draft', true);
  static const ProjectQueryNot not = ProjectQueryNot._();
}

final class ProjectQueryNot {
  const ProjectQueryNot._();
  ProjectQueryCond<String> get sort =>
      const ProjectQueryCond._('sort', null, presence: true, negate: true);
  ProjectQueryCond get active =>
      const ProjectQueryCond._('active', true, negate: true);
  ProjectQueryCond get archived =>
      const ProjectQueryCond._('archived', true, negate: true);
  ProjectQueryCond get draft =>
      const ProjectQueryCond._('draft', true, negate: true);
}

/// `Project` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class ProjectQueryArg {
  const ProjectQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static ProjectQueryArg sort(String v) => ProjectQueryArg._('sort', v);
  static const ProjectQueryArg active = ProjectQueryArg._('active', true);
  static const ProjectQueryArg archived = ProjectQueryArg._('archived', true);
  static const ProjectQueryArg draft = ProjectQueryArg._('draft', true);
}

/// Read-only view-state of `project` — the reactive reads return
/// this; the navigable `ProjectNav` adds the setters.
abstract interface class ProjectView implements AnyView {
  ProjectQuery get query;
}

/// Exactly-one `oneOf` choice for `board` query view-state.
sealed class BoardQueryChoice {
  const BoardQueryChoice();
}

final class BoardQueryActive extends BoardQueryChoice {
  const BoardQueryActive();
}

final class BoardQueryArchived extends BoardQueryChoice {
  const BoardQueryArchived();
}

final class BoardQueryDraft extends BoardQueryChoice {
  const BoardQueryDraft();
}

/// Screen-local query view-state for `board` (read-only).
class BoardQuery {
  const BoardQuery._();
  BoardQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.board, 'active') == true)
      return const BoardQueryActive();
    if (_Screens.graph.viewGet(_Screens.board, 'archived') == true)
      return const BoardQueryArchived();
    if (_Screens.graph.viewGet(_Screens.board, 'draft') == true)
      return const BoardQueryDraft();
    return null;
  }

  ({DateTime from, DateTime to})? get group {
    final from = _Screens.graph.viewGet(_Screens.board, 'from') as DateTime?;
    final to = _Screens.graph.viewGet(_Screens.board, 'to') as DateTime?;
    return (from != null && to != null) ? (from: from, to: to) : null;
  }
}

/// Mutable [BoardQuery] — set a key (null clears / removes from URL).
final class BoardQueryMut extends BoardQuery {
  const BoardQueryMut._() : super._();
  set choice(BoardQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.board,
      'active',
      v is BoardQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.board,
      'archived',
      v is BoardQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.board,
      'draft',
      v is BoardQueryDraft ? true : null,
    );
  }

  set group(({DateTime from, DateTime to})? v) {
    _Screens.graph.viewSet(_Screens.board, 'from', v?.from);
    _Screens.graph.viewSet(_Screens.board, 'to', v?.to);
  }
}

/// `Board` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class BoardQueryCond<T> implements ViewCond {
  const BoardQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  BoardQueryCond<T> call(T v) => BoardQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static const BoardQueryCond active = BoardQueryCond._('active', true);
  static const BoardQueryCond archived = BoardQueryCond._('archived', true);
  static const BoardQueryCond draft = BoardQueryCond._('draft', true);
  static BoardQueryCond<DateTime> get from =>
      const BoardQueryCond._('from', null, presence: true);
  static BoardQueryCond<DateTime> get to =>
      const BoardQueryCond._('to', null, presence: true);
  static const BoardQueryNot not = BoardQueryNot._();
}

final class BoardQueryNot {
  const BoardQueryNot._();
  BoardQueryCond get active =>
      const BoardQueryCond._('active', true, negate: true);
  BoardQueryCond get archived =>
      const BoardQueryCond._('archived', true, negate: true);
  BoardQueryCond get draft =>
      const BoardQueryCond._('draft', true, negate: true);
  BoardQueryCond<DateTime> get from =>
      const BoardQueryCond._('from', null, presence: true, negate: true);
  BoardQueryCond<DateTime> get to =>
      const BoardQueryCond._('to', null, presence: true, negate: true);
}

/// `Board` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class BoardQueryArg {
  const BoardQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static const BoardQueryArg active = BoardQueryArg._('active', true);
  static const BoardQueryArg archived = BoardQueryArg._('archived', true);
  static const BoardQueryArg draft = BoardQueryArg._('draft', true);
  static BoardQueryArg from(DateTime v) => BoardQueryArg._('from', v);
  static BoardQueryArg to(DateTime v) => BoardQueryArg._('to', v);
}

/// Read-only view-state of `board` — the reactive reads return
/// this; the navigable `BoardNav` adds the setters.
abstract interface class BoardView implements AnyView {
  BoardQuery get query;
}

/// Exactly-one `oneOf` choice for `taskList` query view-state.
sealed class TaskListQueryChoice {
  const TaskListQueryChoice();
}

final class TaskListQueryActive extends TaskListQueryChoice {
  const TaskListQueryActive();
}

final class TaskListQueryArchived extends TaskListQueryChoice {
  const TaskListQueryArchived();
}

final class TaskListQueryDraft extends TaskListQueryChoice {
  const TaskListQueryDraft();
}

/// Screen-local query view-state for `taskList` (read-only).
class TaskListQuery {
  const TaskListQuery._();
  String? get sort =>
      _Screens.graph.viewGet(_Screens.taskList, 'sort') as String?;
  TaskListQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.taskList, 'active') == true)
      return const TaskListQueryActive();
    if (_Screens.graph.viewGet(_Screens.taskList, 'archived') == true)
      return const TaskListQueryArchived();
    if (_Screens.graph.viewGet(_Screens.taskList, 'draft') == true)
      return const TaskListQueryDraft();
    return null;
  }
}

/// Mutable [TaskListQuery] — set a key (null clears / removes from URL).
final class TaskListQueryMut extends TaskListQuery {
  const TaskListQueryMut._() : super._();
  set sort(String? v) => _Screens.graph.viewSet(_Screens.taskList, 'sort', v);
  set choice(TaskListQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.taskList,
      'active',
      v is TaskListQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.taskList,
      'archived',
      v is TaskListQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.taskList,
      'draft',
      v is TaskListQueryDraft ? true : null,
    );
  }
}

/// `TaskList` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class TaskListQueryCond<T> implements ViewCond {
  const TaskListQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  TaskListQueryCond<T> call(T v) =>
      TaskListQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static TaskListQueryCond<String> get sort =>
      const TaskListQueryCond._('sort', null, presence: true);
  static const TaskListQueryCond active = TaskListQueryCond._('active', true);
  static const TaskListQueryCond archived = TaskListQueryCond._(
    'archived',
    true,
  );
  static const TaskListQueryCond draft = TaskListQueryCond._('draft', true);
  static const TaskListQueryNot not = TaskListQueryNot._();
}

final class TaskListQueryNot {
  const TaskListQueryNot._();
  TaskListQueryCond<String> get sort =>
      const TaskListQueryCond._('sort', null, presence: true, negate: true);
  TaskListQueryCond get active =>
      const TaskListQueryCond._('active', true, negate: true);
  TaskListQueryCond get archived =>
      const TaskListQueryCond._('archived', true, negate: true);
  TaskListQueryCond get draft =>
      const TaskListQueryCond._('draft', true, negate: true);
}

/// `TaskList` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class TaskListQueryArg {
  const TaskListQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static TaskListQueryArg sort(String v) => TaskListQueryArg._('sort', v);
  static const TaskListQueryArg active = TaskListQueryArg._('active', true);
  static const TaskListQueryArg archived = TaskListQueryArg._('archived', true);
  static const TaskListQueryArg draft = TaskListQueryArg._('draft', true);
}

/// Read-only view-state of `taskList` — the reactive reads return
/// this; the navigable `TaskListNav` adds the setters.
abstract interface class TaskListView implements AnyView {
  TaskListQuery get query;
}

/// Exactly-one `oneOf` choice for `task` query view-state.
sealed class TaskQueryChoice {
  const TaskQueryChoice();
}

final class TaskQueryActive extends TaskQueryChoice {
  const TaskQueryActive();
}

final class TaskQueryArchived extends TaskQueryChoice {
  const TaskQueryArchived();
}

final class TaskQueryDraft extends TaskQueryChoice {
  const TaskQueryDraft();
}

/// Screen-local query view-state for `task` (read-only).
class TaskQuery {
  const TaskQuery._();
  String? get sort => _Screens.graph.viewGet(_Screens.task, 'sort') as String?;
  String? get dir => _Screens.graph.viewGet(_Screens.task, 'dir') as String?;
  TaskQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.task, 'active') == true)
      return const TaskQueryActive();
    if (_Screens.graph.viewGet(_Screens.task, 'archived') == true)
      return const TaskQueryArchived();
    if (_Screens.graph.viewGet(_Screens.task, 'draft') == true)
      return const TaskQueryDraft();
    return null;
  }

  ({DateTime from, DateTime to})? get group {
    final from = _Screens.graph.viewGet(_Screens.task, 'from') as DateTime?;
    final to = _Screens.graph.viewGet(_Screens.task, 'to') as DateTime?;
    return (from != null && to != null) ? (from: from, to: to) : null;
  }
}

/// Mutable [TaskQuery] — set a key (null clears / removes from URL).
final class TaskQueryMut extends TaskQuery {
  const TaskQueryMut._() : super._();
  set sort(String? v) => _Screens.graph.viewSet(_Screens.task, 'sort', v);
  set dir(String? v) => _Screens.graph.viewSet(_Screens.task, 'dir', v);
  set choice(TaskQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.task,
      'active',
      v is TaskQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.task,
      'archived',
      v is TaskQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.task,
      'draft',
      v is TaskQueryDraft ? true : null,
    );
  }

  set group(({DateTime from, DateTime to})? v) {
    _Screens.graph.viewSet(_Screens.task, 'from', v?.from);
    _Screens.graph.viewSet(_Screens.task, 'to', v?.to);
  }
}

/// `Task` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class TaskQueryCond<T> implements ViewCond {
  const TaskQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  TaskQueryCond<T> call(T v) => TaskQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static TaskQueryCond<String> get sort =>
      const TaskQueryCond._('sort', null, presence: true);
  static TaskQueryCond<String> get dir =>
      const TaskQueryCond._('dir', null, presence: true);
  static const TaskQueryCond active = TaskQueryCond._('active', true);
  static const TaskQueryCond archived = TaskQueryCond._('archived', true);
  static const TaskQueryCond draft = TaskQueryCond._('draft', true);
  static TaskQueryCond<DateTime> get from =>
      const TaskQueryCond._('from', null, presence: true);
  static TaskQueryCond<DateTime> get to =>
      const TaskQueryCond._('to', null, presence: true);
  static const TaskQueryNot not = TaskQueryNot._();
}

final class TaskQueryNot {
  const TaskQueryNot._();
  TaskQueryCond<String> get sort =>
      const TaskQueryCond._('sort', null, presence: true, negate: true);
  TaskQueryCond<String> get dir =>
      const TaskQueryCond._('dir', null, presence: true, negate: true);
  TaskQueryCond get active =>
      const TaskQueryCond._('active', true, negate: true);
  TaskQueryCond get archived =>
      const TaskQueryCond._('archived', true, negate: true);
  TaskQueryCond get draft => const TaskQueryCond._('draft', true, negate: true);
  TaskQueryCond<DateTime> get from =>
      const TaskQueryCond._('from', null, presence: true, negate: true);
  TaskQueryCond<DateTime> get to =>
      const TaskQueryCond._('to', null, presence: true, negate: true);
}

/// `Task` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class TaskQueryArg {
  const TaskQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static TaskQueryArg sort(String v) => TaskQueryArg._('sort', v);
  static TaskQueryArg dir(String v) => TaskQueryArg._('dir', v);
  static const TaskQueryArg active = TaskQueryArg._('active', true);
  static const TaskQueryArg archived = TaskQueryArg._('archived', true);
  static const TaskQueryArg draft = TaskQueryArg._('draft', true);
  static TaskQueryArg from(DateTime v) => TaskQueryArg._('from', v);
  static TaskQueryArg to(DateTime v) => TaskQueryArg._('to', v);
}

/// Read-only view-state of `task` — the reactive reads return
/// this; the navigable `TaskNav` adds the setters.
abstract interface class TaskView implements AnyView {
  TaskQuery get query;
}

/// Exactly-one `oneOf` choice for `forumCategory` query view-state.
sealed class ForumCategoryQueryChoice {
  const ForumCategoryQueryChoice();
}

final class ForumCategoryQueryActive extends ForumCategoryQueryChoice {
  const ForumCategoryQueryActive();
}

final class ForumCategoryQueryArchived extends ForumCategoryQueryChoice {
  const ForumCategoryQueryArchived();
}

final class ForumCategoryQueryDraft extends ForumCategoryQueryChoice {
  const ForumCategoryQueryDraft();
}

/// Screen-local query view-state for `forumCategory` (read-only).
class ForumCategoryQuery {
  const ForumCategoryQuery._();
  ForumCategoryQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.forumCategory, 'active') == true)
      return const ForumCategoryQueryActive();
    if (_Screens.graph.viewGet(_Screens.forumCategory, 'archived') == true)
      return const ForumCategoryQueryArchived();
    if (_Screens.graph.viewGet(_Screens.forumCategory, 'draft') == true)
      return const ForumCategoryQueryDraft();
    return null;
  }
}

/// Mutable [ForumCategoryQuery] — set a key (null clears / removes from URL).
final class ForumCategoryQueryMut extends ForumCategoryQuery {
  const ForumCategoryQueryMut._() : super._();
  set choice(ForumCategoryQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.forumCategory,
      'active',
      v is ForumCategoryQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.forumCategory,
      'archived',
      v is ForumCategoryQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.forumCategory,
      'draft',
      v is ForumCategoryQueryDraft ? true : null,
    );
  }
}

/// `ForumCategory` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class ForumCategoryQueryCond<T> implements ViewCond {
  const ForumCategoryQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  ForumCategoryQueryCond<T> call(T v) =>
      ForumCategoryQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static const ForumCategoryQueryCond active = ForumCategoryQueryCond._(
    'active',
    true,
  );
  static const ForumCategoryQueryCond archived = ForumCategoryQueryCond._(
    'archived',
    true,
  );
  static const ForumCategoryQueryCond draft = ForumCategoryQueryCond._(
    'draft',
    true,
  );
  static const ForumCategoryQueryNot not = ForumCategoryQueryNot._();
}

final class ForumCategoryQueryNot {
  const ForumCategoryQueryNot._();
  ForumCategoryQueryCond get active =>
      const ForumCategoryQueryCond._('active', true, negate: true);
  ForumCategoryQueryCond get archived =>
      const ForumCategoryQueryCond._('archived', true, negate: true);
  ForumCategoryQueryCond get draft =>
      const ForumCategoryQueryCond._('draft', true, negate: true);
}

/// `ForumCategory` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class ForumCategoryQueryArg {
  const ForumCategoryQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static const ForumCategoryQueryArg active = ForumCategoryQueryArg._(
    'active',
    true,
  );
  static const ForumCategoryQueryArg archived = ForumCategoryQueryArg._(
    'archived',
    true,
  );
  static const ForumCategoryQueryArg draft = ForumCategoryQueryArg._(
    'draft',
    true,
  );
}

/// Read-only view-state of `forumCategory` — the reactive reads return
/// this; the navigable `ForumCategoryNav` adds the setters.
abstract interface class ForumCategoryView implements AnyView {
  ForumCategoryQuery get query;
}

/// Exactly-one `oneOf` choice for `forumThread` query view-state.
sealed class ForumThreadQueryChoice {
  const ForumThreadQueryChoice();
}

final class ForumThreadQueryActive extends ForumThreadQueryChoice {
  const ForumThreadQueryActive();
}

final class ForumThreadQueryArchived extends ForumThreadQueryChoice {
  const ForumThreadQueryArchived();
}

final class ForumThreadQueryDraft extends ForumThreadQueryChoice {
  const ForumThreadQueryDraft();
}

/// Screen-local query view-state for `forumThread` (read-only).
class ForumThreadQuery {
  const ForumThreadQuery._();
  String? get sort =>
      _Screens.graph.viewGet(_Screens.forumThread, 'sort') as String?;
  ForumThreadQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.forumThread, 'active') == true)
      return const ForumThreadQueryActive();
    if (_Screens.graph.viewGet(_Screens.forumThread, 'archived') == true)
      return const ForumThreadQueryArchived();
    if (_Screens.graph.viewGet(_Screens.forumThread, 'draft') == true)
      return const ForumThreadQueryDraft();
    return null;
  }

  ({DateTime from, DateTime to})? get group {
    final from =
        _Screens.graph.viewGet(_Screens.forumThread, 'from') as DateTime?;
    final to = _Screens.graph.viewGet(_Screens.forumThread, 'to') as DateTime?;
    return (from != null && to != null) ? (from: from, to: to) : null;
  }
}

/// Mutable [ForumThreadQuery] — set a key (null clears / removes from URL).
final class ForumThreadQueryMut extends ForumThreadQuery {
  const ForumThreadQueryMut._() : super._();
  set sort(String? v) =>
      _Screens.graph.viewSet(_Screens.forumThread, 'sort', v);
  set choice(ForumThreadQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.forumThread,
      'active',
      v is ForumThreadQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.forumThread,
      'archived',
      v is ForumThreadQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.forumThread,
      'draft',
      v is ForumThreadQueryDraft ? true : null,
    );
  }

  set group(({DateTime from, DateTime to})? v) {
    _Screens.graph.viewSet(_Screens.forumThread, 'from', v?.from);
    _Screens.graph.viewSet(_Screens.forumThread, 'to', v?.to);
  }
}

/// `ForumThread` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class ForumThreadQueryCond<T> implements ViewCond {
  const ForumThreadQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  ForumThreadQueryCond<T> call(T v) =>
      ForumThreadQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static ForumThreadQueryCond<String> get sort =>
      const ForumThreadQueryCond._('sort', null, presence: true);
  static const ForumThreadQueryCond active = ForumThreadQueryCond._(
    'active',
    true,
  );
  static const ForumThreadQueryCond archived = ForumThreadQueryCond._(
    'archived',
    true,
  );
  static const ForumThreadQueryCond draft = ForumThreadQueryCond._(
    'draft',
    true,
  );
  static ForumThreadQueryCond<DateTime> get from =>
      const ForumThreadQueryCond._('from', null, presence: true);
  static ForumThreadQueryCond<DateTime> get to =>
      const ForumThreadQueryCond._('to', null, presence: true);
  static const ForumThreadQueryNot not = ForumThreadQueryNot._();
}

final class ForumThreadQueryNot {
  const ForumThreadQueryNot._();
  ForumThreadQueryCond<String> get sort =>
      const ForumThreadQueryCond._('sort', null, presence: true, negate: true);
  ForumThreadQueryCond get active =>
      const ForumThreadQueryCond._('active', true, negate: true);
  ForumThreadQueryCond get archived =>
      const ForumThreadQueryCond._('archived', true, negate: true);
  ForumThreadQueryCond get draft =>
      const ForumThreadQueryCond._('draft', true, negate: true);
  ForumThreadQueryCond<DateTime> get from =>
      const ForumThreadQueryCond._('from', null, presence: true, negate: true);
  ForumThreadQueryCond<DateTime> get to =>
      const ForumThreadQueryCond._('to', null, presence: true, negate: true);
}

/// `ForumThread` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class ForumThreadQueryArg {
  const ForumThreadQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static ForumThreadQueryArg sort(String v) => ForumThreadQueryArg._('sort', v);
  static const ForumThreadQueryArg active = ForumThreadQueryArg._(
    'active',
    true,
  );
  static const ForumThreadQueryArg archived = ForumThreadQueryArg._(
    'archived',
    true,
  );
  static const ForumThreadQueryArg draft = ForumThreadQueryArg._('draft', true);
  static ForumThreadQueryArg from(DateTime v) =>
      ForumThreadQueryArg._('from', v);
  static ForumThreadQueryArg to(DateTime v) => ForumThreadQueryArg._('to', v);
}

/// Read-only view-state of `forumThread` — the reactive reads return
/// this; the navigable `ForumThreadNav` adds the setters.
abstract interface class ForumThreadView implements AnyView {
  ForumThreadQuery get query;
}

/// Exactly-one `oneOf` choice for `course` query view-state.
sealed class CourseQueryChoice {
  const CourseQueryChoice();
}

final class CourseQueryActive extends CourseQueryChoice {
  const CourseQueryActive();
}

final class CourseQueryArchived extends CourseQueryChoice {
  const CourseQueryArchived();
}

final class CourseQueryDraft extends CourseQueryChoice {
  const CourseQueryDraft();
}

/// Screen-local query view-state for `course` (read-only).
class CourseQuery {
  const CourseQuery._();
  String? get sort =>
      _Screens.graph.viewGet(_Screens.course, 'sort') as String?;
  CourseQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.course, 'active') == true)
      return const CourseQueryActive();
    if (_Screens.graph.viewGet(_Screens.course, 'archived') == true)
      return const CourseQueryArchived();
    if (_Screens.graph.viewGet(_Screens.course, 'draft') == true)
      return const CourseQueryDraft();
    return null;
  }

  ({DateTime from, DateTime to})? get group {
    final from = _Screens.graph.viewGet(_Screens.course, 'from') as DateTime?;
    final to = _Screens.graph.viewGet(_Screens.course, 'to') as DateTime?;
    return (from != null && to != null) ? (from: from, to: to) : null;
  }
}

/// Mutable [CourseQuery] — set a key (null clears / removes from URL).
final class CourseQueryMut extends CourseQuery {
  const CourseQueryMut._() : super._();
  set sort(String? v) => _Screens.graph.viewSet(_Screens.course, 'sort', v);
  set choice(CourseQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.course,
      'active',
      v is CourseQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.course,
      'archived',
      v is CourseQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.course,
      'draft',
      v is CourseQueryDraft ? true : null,
    );
  }

  set group(({DateTime from, DateTime to})? v) {
    _Screens.graph.viewSet(_Screens.course, 'from', v?.from);
    _Screens.graph.viewSet(_Screens.course, 'to', v?.to);
  }
}

/// `Course` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class CourseQueryCond<T> implements ViewCond {
  const CourseQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  CourseQueryCond<T> call(T v) => CourseQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static CourseQueryCond<String> get sort =>
      const CourseQueryCond._('sort', null, presence: true);
  static const CourseQueryCond active = CourseQueryCond._('active', true);
  static const CourseQueryCond archived = CourseQueryCond._('archived', true);
  static const CourseQueryCond draft = CourseQueryCond._('draft', true);
  static CourseQueryCond<DateTime> get from =>
      const CourseQueryCond._('from', null, presence: true);
  static CourseQueryCond<DateTime> get to =>
      const CourseQueryCond._('to', null, presence: true);
  static const CourseQueryNot not = CourseQueryNot._();
}

final class CourseQueryNot {
  const CourseQueryNot._();
  CourseQueryCond<String> get sort =>
      const CourseQueryCond._('sort', null, presence: true, negate: true);
  CourseQueryCond get active =>
      const CourseQueryCond._('active', true, negate: true);
  CourseQueryCond get archived =>
      const CourseQueryCond._('archived', true, negate: true);
  CourseQueryCond get draft =>
      const CourseQueryCond._('draft', true, negate: true);
  CourseQueryCond<DateTime> get from =>
      const CourseQueryCond._('from', null, presence: true, negate: true);
  CourseQueryCond<DateTime> get to =>
      const CourseQueryCond._('to', null, presence: true, negate: true);
}

/// `Course` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class CourseQueryArg {
  const CourseQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static CourseQueryArg sort(String v) => CourseQueryArg._('sort', v);
  static const CourseQueryArg active = CourseQueryArg._('active', true);
  static const CourseQueryArg archived = CourseQueryArg._('archived', true);
  static const CourseQueryArg draft = CourseQueryArg._('draft', true);
  static CourseQueryArg from(DateTime v) => CourseQueryArg._('from', v);
  static CourseQueryArg to(DateTime v) => CourseQueryArg._('to', v);
}

/// Read-only view-state of `course` — the reactive reads return
/// this; the navigable `CourseNav` adds the setters.
abstract interface class CourseView implements AnyView {
  CourseQuery get query;
}

/// Exactly-one `oneOf` choice for `shopSubcategory` query view-state.
sealed class ShopSubcategoryQueryChoice {
  const ShopSubcategoryQueryChoice();
}

final class ShopSubcategoryQueryActive extends ShopSubcategoryQueryChoice {
  const ShopSubcategoryQueryActive();
}

final class ShopSubcategoryQueryArchived extends ShopSubcategoryQueryChoice {
  const ShopSubcategoryQueryArchived();
}

/// Screen-local query view-state for `shopSubcategory` (read-only).
class ShopSubcategoryQuery {
  const ShopSubcategoryQuery._();
  ShopSubcategoryQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.shopSubcategory, 'active') == true)
      return const ShopSubcategoryQueryActive();
    if (_Screens.graph.viewGet(_Screens.shopSubcategory, 'archived') == true)
      return const ShopSubcategoryQueryArchived();
    return null;
  }

  ({int minPrice, int maxPrice})? get group {
    final minPrice =
        _Screens.graph.viewGet(_Screens.shopSubcategory, 'minPrice') as int?;
    final maxPrice =
        _Screens.graph.viewGet(_Screens.shopSubcategory, 'maxPrice') as int?;
    return (minPrice != null && maxPrice != null)
        ? (minPrice: minPrice, maxPrice: maxPrice)
        : null;
  }
}

/// Mutable [ShopSubcategoryQuery] — set a key (null clears / removes from URL).
final class ShopSubcategoryQueryMut extends ShopSubcategoryQuery {
  const ShopSubcategoryQueryMut._() : super._();
  set choice(ShopSubcategoryQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.shopSubcategory,
      'active',
      v is ShopSubcategoryQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.shopSubcategory,
      'archived',
      v is ShopSubcategoryQueryArchived ? true : null,
    );
  }

  set group(({int minPrice, int maxPrice})? v) {
    _Screens.graph.viewSet(_Screens.shopSubcategory, 'minPrice', v?.minPrice);
    _Screens.graph.viewSet(_Screens.shopSubcategory, 'maxPrice', v?.maxPrice);
  }
}

/// `ShopSubcategory` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class ShopSubcategoryQueryCond<T> implements ViewCond {
  const ShopSubcategoryQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  ShopSubcategoryQueryCond<T> call(T v) =>
      ShopSubcategoryQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static const ShopSubcategoryQueryCond active = ShopSubcategoryQueryCond._(
    'active',
    true,
  );
  static const ShopSubcategoryQueryCond archived = ShopSubcategoryQueryCond._(
    'archived',
    true,
  );
  static ShopSubcategoryQueryCond<int> get minPrice =>
      const ShopSubcategoryQueryCond._('minPrice', null, presence: true);
  static ShopSubcategoryQueryCond<int> get maxPrice =>
      const ShopSubcategoryQueryCond._('maxPrice', null, presence: true);
  static const ShopSubcategoryQueryNot not = ShopSubcategoryQueryNot._();
}

final class ShopSubcategoryQueryNot {
  const ShopSubcategoryQueryNot._();
  ShopSubcategoryQueryCond get active =>
      const ShopSubcategoryQueryCond._('active', true, negate: true);
  ShopSubcategoryQueryCond get archived =>
      const ShopSubcategoryQueryCond._('archived', true, negate: true);
  ShopSubcategoryQueryCond<int> get minPrice =>
      const ShopSubcategoryQueryCond._(
        'minPrice',
        null,
        presence: true,
        negate: true,
      );
  ShopSubcategoryQueryCond<int> get maxPrice =>
      const ShopSubcategoryQueryCond._(
        'maxPrice',
        null,
        presence: true,
        negate: true,
      );
}

/// `ShopSubcategory` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class ShopSubcategoryQueryArg {
  const ShopSubcategoryQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static const ShopSubcategoryQueryArg active = ShopSubcategoryQueryArg._(
    'active',
    true,
  );
  static const ShopSubcategoryQueryArg archived = ShopSubcategoryQueryArg._(
    'archived',
    true,
  );
  static ShopSubcategoryQueryArg minPrice(int v) =>
      ShopSubcategoryQueryArg._('minPrice', v);
  static ShopSubcategoryQueryArg maxPrice(int v) =>
      ShopSubcategoryQueryArg._('maxPrice', v);
}

/// Read-only view-state of `shopSubcategory` — the reactive reads return
/// this; the navigable `ShopSubcategoryNav` adds the setters.
abstract interface class ShopSubcategoryView implements AnyView {
  ShopSubcategoryQuery get query;
}

/// Exactly-one `oneOf` choice for `product` query view-state.
sealed class ProductQueryChoice {
  const ProductQueryChoice();
}

final class ProductQueryActive extends ProductQueryChoice {
  const ProductQueryActive();
}

final class ProductQueryArchived extends ProductQueryChoice {
  const ProductQueryArchived();
}

/// Screen-local query view-state for `product` (read-only).
class ProductQuery {
  const ProductQuery._();
  ProductQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.product, 'active') == true)
      return const ProductQueryActive();
    if (_Screens.graph.viewGet(_Screens.product, 'archived') == true)
      return const ProductQueryArchived();
    return null;
  }

  ({int minPrice, int maxPrice})? get group {
    final minPrice =
        _Screens.graph.viewGet(_Screens.product, 'minPrice') as int?;
    final maxPrice =
        _Screens.graph.viewGet(_Screens.product, 'maxPrice') as int?;
    return (minPrice != null && maxPrice != null)
        ? (minPrice: minPrice, maxPrice: maxPrice)
        : null;
  }

  String? get brand =>
      _Screens.graph.viewGet(_Screens.product, 'brand') as String?;
  String? get condition =>
      _Screens.graph.viewGet(_Screens.product, 'condition') as String?;
}

/// Mutable [ProductQuery] — set a key (null clears / removes from URL).
final class ProductQueryMut extends ProductQuery {
  const ProductQueryMut._() : super._();
  set choice(ProductQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.product,
      'active',
      v is ProductQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.product,
      'archived',
      v is ProductQueryArchived ? true : null,
    );
  }

  set group(({int minPrice, int maxPrice})? v) {
    _Screens.graph.viewSet(_Screens.product, 'minPrice', v?.minPrice);
    _Screens.graph.viewSet(_Screens.product, 'maxPrice', v?.maxPrice);
  }

  set brand(String? v) => _Screens.graph.viewSet(_Screens.product, 'brand', v);
  set condition(String? v) =>
      _Screens.graph.viewSet(_Screens.product, 'condition', v);
}

/// `Product` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class ProductQueryCond<T> implements ViewCond {
  const ProductQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  ProductQueryCond<T> call(T v) =>
      ProductQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static const ProductQueryCond active = ProductQueryCond._('active', true);
  static const ProductQueryCond archived = ProductQueryCond._('archived', true);
  static ProductQueryCond<int> get minPrice =>
      const ProductQueryCond._('minPrice', null, presence: true);
  static ProductQueryCond<int> get maxPrice =>
      const ProductQueryCond._('maxPrice', null, presence: true);
  static ProductQueryCond<String> get brand =>
      const ProductQueryCond._('brand', null, presence: true);
  static ProductQueryCond<String> get condition =>
      const ProductQueryCond._('condition', null, presence: true);
  static const ProductQueryNot not = ProductQueryNot._();
}

final class ProductQueryNot {
  const ProductQueryNot._();
  ProductQueryCond get active =>
      const ProductQueryCond._('active', true, negate: true);
  ProductQueryCond get archived =>
      const ProductQueryCond._('archived', true, negate: true);
  ProductQueryCond<int> get minPrice =>
      const ProductQueryCond._('minPrice', null, presence: true, negate: true);
  ProductQueryCond<int> get maxPrice =>
      const ProductQueryCond._('maxPrice', null, presence: true, negate: true);
  ProductQueryCond<String> get brand =>
      const ProductQueryCond._('brand', null, presence: true, negate: true);
  ProductQueryCond<String> get condition =>
      const ProductQueryCond._('condition', null, presence: true, negate: true);
}

/// `Product` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class ProductQueryArg {
  const ProductQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static const ProductQueryArg active = ProductQueryArg._('active', true);
  static const ProductQueryArg archived = ProductQueryArg._('archived', true);
  static ProductQueryArg minPrice(int v) => ProductQueryArg._('minPrice', v);
  static ProductQueryArg maxPrice(int v) => ProductQueryArg._('maxPrice', v);
  static ProductQueryArg brand(String v) => ProductQueryArg._('brand', v);
  static ProductQueryArg condition(String v) =>
      ProductQueryArg._('condition', v);
}

/// Read-only view-state of `product` — the reactive reads return
/// this; the navigable `ProductNav` adds the setters.
abstract interface class ProductView implements AnyView {
  ProductQuery get query;
}

/// Screen-local query view-state for `workout` (read-only).
class WorkoutQuery {
  const WorkoutQuery._();
  String? get sort =>
      _Screens.graph.viewGet(_Screens.workout, 'sort') as String?;
  ({DateTime from, DateTime to})? get group {
    final from = _Screens.graph.viewGet(_Screens.workout, 'from') as DateTime?;
    final to = _Screens.graph.viewGet(_Screens.workout, 'to') as DateTime?;
    return (from != null && to != null) ? (from: from, to: to) : null;
  }
}

/// Mutable [WorkoutQuery] — set a key (null clears / removes from URL).
final class WorkoutQueryMut extends WorkoutQuery {
  const WorkoutQueryMut._() : super._();
  set sort(String? v) => _Screens.graph.viewSet(_Screens.workout, 'sort', v);
  set group(({DateTime from, DateTime to})? v) {
    _Screens.graph.viewSet(_Screens.workout, 'from', v?.from);
    _Screens.graph.viewSet(_Screens.workout, 'to', v?.to);
  }
}

/// `Workout` query condition terms — `.key` present / `.key(v)` equals / `.flag` true; `.not.…` negates (`.not.key` = absent).
final class WorkoutQueryCond<T> implements ViewCond {
  const WorkoutQueryCond._(
    this.key,
    this.expected, {
    this.negate = false,
    this.presence = false,
  });
  @override
  final String key;
  final Object? expected;
  final bool negate;
  final bool presence;

  /// `.key(v)` — narrow a present term to an equals term, keeping any negation.
  WorkoutQueryCond<T> call(T v) =>
      WorkoutQueryCond<T>._(key, v, negate: negate);
  @override
  bool test(Object? v) {
    final m = presence ? v != null : v == expected;
    return negate ? !m : m;
  }

  static WorkoutQueryCond<String> get sort =>
      const WorkoutQueryCond._('sort', null, presence: true);
  static WorkoutQueryCond<DateTime> get from =>
      const WorkoutQueryCond._('from', null, presence: true);
  static WorkoutQueryCond<DateTime> get to =>
      const WorkoutQueryCond._('to', null, presence: true);
  static const WorkoutQueryNot not = WorkoutQueryNot._();
}

final class WorkoutQueryNot {
  const WorkoutQueryNot._();
  WorkoutQueryCond<String> get sort =>
      const WorkoutQueryCond._('sort', null, presence: true, negate: true);
  WorkoutQueryCond<DateTime> get from =>
      const WorkoutQueryCond._('from', null, presence: true, negate: true);
  WorkoutQueryCond<DateTime> get to =>
      const WorkoutQueryCond._('to', null, presence: true, negate: true);
}

/// `Workout` query build terms — `.key(v)` sets a value, `.flag` sets a flag. No `.not` (build, not match).
final class WorkoutQueryArg {
  const WorkoutQueryArg._(this.key, this.value);
  final String key;
  final Object? value;
  static WorkoutQueryArg sort(String v) => WorkoutQueryArg._('sort', v);
  static WorkoutQueryArg from(DateTime v) => WorkoutQueryArg._('from', v);
  static WorkoutQueryArg to(DateTime v) => WorkoutQueryArg._('to', v);
}

/// Read-only view-state of `workout` — the reactive reads return
/// this; the navigable `WorkoutNav` adds the setters.
abstract interface class WorkoutView implements AnyView {
  WorkoutQuery get query;
}

AnyView? _viewOf(Enum? screen) => switch (screen) {
  _Screens.feed => const FeedNav._(),
  _Screens.post => const PostNav._(),
  _Screens.discover => const DiscoverNav._(),
  _Screens.marketplace => const MarketplaceNav._(),
  _Screens.search => const SearchNav._(),
  _Screens.workspace => const WorkspaceNav._(),
  _Screens.project => const ProjectNav._(),
  _Screens.board => const BoardNav._(),
  _Screens.taskList => const TaskListNav._(),
  _Screens.task => const TaskNav._(),
  _Screens.forumCategory => const ForumCategoryNav._(),
  _Screens.forumThread => const ForumThreadNav._(),
  _Screens.course => const CourseNav._(),
  _Screens.shopSubcategory => const ShopSubcategoryNav._(),
  _Screens.product => const ProductNav._(),
  _Screens.workout => const WorkoutNav._(),
  _ => null,
};

/// Reactive read-only stack reads scoped to this BuildContext.
extension ScreenStackContext on BuildContext {
  /// FOREGROUND: the typed read-only view if [sel] is the current front
  /// (suffix + ids + conditions), else null. Reactive on top + keys.
  V? on<N extends AnyNav, V>(On<N, V> sel) {
    if (sel.specs.isNotEmpty) Placement.isCurrent(this, sel.specs.last);
    ViewMatch.conds(this, _termOf(sel), sel.conds);
    return Screen.on(sel) != null ? _viewOf(_termOf(sel)) as V? : null;
  }

  /// ANYWHERE on the stack (front OR buried): the typed read-only view if
  /// [sel] is on the live stack, else null. Reactive on chain + keys.
  V? at<N extends AnyNav, V>(On<N, V> sel) {
    if (sel.specs.isNotEmpty) Placement.isOn(this, sel.specs.last);
    ViewMatch.conds(this, _termOf(sel), sel.conds);
    return Screen.at(sel) != null ? _viewOf(_termOf(sel)) as V? : null;
  }
}

Enum _termOf(On sel) =>
    sel.specs.isEmpty ? _Screens.graph.current : sel.specs.last;
