local has_db, db = pcall(require, 'dashboard')
if not has_db then
    return
end

db.setup({})
