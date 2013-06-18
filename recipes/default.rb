
include_recipe "elixir"

git "#{node[:elixir_mapreduce][:install_dir]}/collabs" do
  repository "https://github.com/aforward/collabs"
  action :sync
  notifies :run, "execute[compile collabs]", :immediately
end

execute "compile collabs" do
  command "mix deps.get; mix deps; mix compile"
  cwd "#{node[:elixir_mapreduce][:install_dir]}/collabs"
  # action :nothing
end
