json.items do
  json.array! @trees, partial: 'trees/tree', as: :tree
end
json.meta do
  json.partial! 'shared/pagination', resource: @trees
end
