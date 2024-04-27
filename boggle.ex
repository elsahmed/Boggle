defmodule Boggle do

  defp boggle(_, [], m) do m end
  defp boggle(board, [h | t], m) do 
    val = Boggle.findWordHead(board, h)
    if val do boggle(board, t, Map.put(m, h, val)) else boggle(board, t, m) end
  end
  def boggle(board, words) do boggle(board, words, %{}) end

  # #FINDS THE HEAD OF THE ELEMENT
  defp findWordHead(board, _, _, i, j) when (i == tuple_size(board)) and (j == tuple_size(board)) do nil end
  defp findWordHead(board, word, e, i, j) when (elem (elem board, i), j) == e do 
    # {i,j} 
    found = dfs(board, word, i, j)
    if found == nil do findWordHead(board, word, e, i, j+1) else found end

  end
  defp findWordHead(board, word, e, i, j) when j == tuple_size(board) do findWordHead(board, word, e, i+1, 0) end
  defp findWordHead(board, word, e, i, j) do findWordHead(board, word, e, i, j+1) end
  def findWordHead(board, word) do findWordHead(board, word, String.at(word, 0), 0, 0) end


  # FINDS THE PATH OF THE WORD
  defp dfs(_, _, [], _, _, list) do list end # end of the word return path
  defp dfs(board, _, _, i, j, _) when i < 0 or j < 0 or i >= tuple_size(board) or j >= tuple_size(board) do nil end #out of bounds
  defp dfs(board, _, [h | _], i, j, _) when (elem (elem board, i), j) != h do nil end # wrong letter
  defp dfs(_, boardF, _, i, j, _) when (elem (elem boardF, i), j) == true do nil end # elem visited already

  defp dfs(board, boardF, [_ | t], i, j, list) do 
    bf = updateBoard(boardF, i, j, true) #updates board so we know elem is visited
    found = ( dfs(board, bf, t, i+1, j, list) || #DOWN
              dfs(board, bf, t, i-1, j, list) || #UP
              dfs(board, bf, t, i, j+1, list) || #RIGHT
              dfs(board, bf, t, i, j-1, list) || #LEFT
              dfs(board, bf, t, i+1, j+1, list) || #SE
              dfs(board, bf, t, i+1, j-1, list) || #SW
              dfs(board, bf, t, i-1, j+1, list) || #NE
              dfs(board, bf, t, i-1, j-1, list) )  #NW
    updateBoard(boardF, i, j, false) # resets the board at that element
    if found do [{i, j} | found] end #adds to list if return is 'true'
  end

  def dfs(board, word, i, j) do
    boardF = allFalse(tuple_size(board)) 
    dfs(board, boardF, String.split(word, "", trim: true), i, j, [])
  end

  # CREATES A BOARD WILL ALL FALSE VALUES
  def allFalse(size) do 
    temp = Tuple.duplicate(false, size)
    Tuple.duplicate(temp, size)
  end

  # UPDATES THE FALSE BOARD
  def updateBoard(board, row, col, val) do
    temp = Tuple.delete_at((elem board, row), col) #delete the elem
    b = Tuple.delete_at(board, row) #delete the row
    Tuple.insert_at(b, row, Tuple.insert_at(temp, col, val)) #insert the updated element
    # boardF
  end

end
