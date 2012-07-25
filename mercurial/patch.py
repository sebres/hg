import cStringIO, email.Parser, os, errno, re
from node import hex, nullid, short
import context
        gitsendmail = 'git-send-email' in msg.get('X-Mailer', '')
                    elif line == '---' and gitsendmail:
        if line.startswith('diff --git'):
        try:
            util.unlinkpath(self._join(fname))
        except OSError, inst:
            if inst.errno != errno.ENOENT:
                raise
        addremoved = set(self.changed)
                    # addremove().
                    addremoved.discard(f)
        if addremoved:
            cwd = self.repo.getcwd()
            if cwd:
                addremoved = [util.pathto(self.repo.root, cwd, f)
                              for f in addremoved]
            scmutil.addremove(self.repo, addremoved, similarity=self.similarity)
             self.ui.warn(_("unable to find '%s' for patching\n") % self.fname)
                               "exists\n" % self.fname))
                self.lines[:] = h.new()
                self.offset += len(h.new())
            return old[top:len(old)-bot], new[top:len(new)-bot], top
    'A binary patch file. Only understands literals so far.'
    def new(self):
        size = int(line[8:].rstrip())
        elif x.startswith('diff --git'):
            cfiles = list(files)
            cwd = repo.getcwd()
            if cwd:
                cfiles = [util.pathto(repo.root, cwd, f)
                          for f in cfiles]
            scmutil.addremove(repo, cfiles, similarity=similarity)
def makememctx(repo, parents, text, user, date, branch, files, store,
               editor=None):
    def getfilectx(repo, memctx, path):
        data, (islink, isexec), copied = store.getfile(path)
        return context.memfilectx(path, data, islink=islink, isexec=isexec,
                                  copied=copied)
    extra = {}
    if branch:
        extra['branch'] = encoding.fromlocal(branch)
    ctx =  context.memctx(repo, parents, text, files, getfilectx, user,
                          date, extra)
    if editor:
        ctx._text = editor(repo, ctx, [])
    return ctx

def b85diff(to, tn):
    '''print base85-encoded binary diff'''
    def gitindex(text):
        if not text:
            return hex(nullid)
        l = len(text)
        s = util.sha1('blob %d\0' % l)
        s.update(text)
        return s.hexdigest()

    def fmtline(line):
        l = len(line)
        if l <= 26:
            l = chr(ord('A') + l - 1)
        else:
            l = chr(l - 26 + ord('a') - 1)
        return '%c%s\n' % (l, base85.b85encode(line, True))

    def chunk(text, csize=52):
        l = len(text)
        i = 0
        while i < l:
            yield text[i:i + csize]
            i += csize

    tohash = gitindex(to)
    tnhash = gitindex(tn)
    if tohash == tnhash:
        return ""

    # TODO: deltas
    ret = ['index %s..%s\nGIT binary patch\nliteral %s\n' %
           (tohash, tnhash, len(tn))]
    for l in chunk(zlib.compress(tn)):
        ret.append(fmtline(l))
    ret.append('\n')
    return ''.join(ret)

    if not repo.ui.quiet:
        hexfunc = repo.ui.debugflag and hex or short
        revs = [hexfunc(node) for node in [node1, node2] if node]
    difffn = (lambda opts, losedata:
                  trydiff(repo, revs, ctx1, ctx2, modified, added, removed,
                          copy, getfilectx, opts, losedata, prefix))

def _addmodehdr(header, omode, nmode):
    if omode != nmode:
        header.append('old mode %s\n' % omode)
        header.append('new mode %s\n' % nmode)

        return os.path.join(prefix, f)
            if f in added:
                        _addmodehdr(header, omode, mode)
            elif f in removed:
                    _addmodehdr(header, gitmode[oflag], gitmode[nflag])
            if opts.git:
                header.insert(0, mdiff.diffline(revs, join(a), join(b), opts))
                text = b85diff(to, tn)
                                    join(a), join(b), revs, opts=opts)
            if line.startswith('diff --git'):
                filename = gitre.search(line).group(1)