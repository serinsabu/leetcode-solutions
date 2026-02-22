class RandomizedSet {
    List<Integer> list = new ArrayList<>();
    Map<Integer, Integer> map = new HashMap<>();
    Random random = new Random();
    // no need, new index as list.size() gives always the current index
    // int index = 0;
    public RandomizedSet() {
        
    }
    //[2]
    //map={2-0}
    public boolean insert(int val) {
        if(map.containsKey(val)) {
            return false;
        }
            list.add(val);
            map.put(val, list.size()-1);
    
        return true;
    }
    
    public boolean remove(int val) {
        if(!map.containsKey(val)) {
            return false;
        }
            int removeIndex = map.get(val);//0

            //swap with last element in the list
            int temp = list.get(list.size()-1);//2
            list.set(removeIndex, temp);//
            map.put(temp, removeIndex);//

            // remove last element from list and map
            list.remove(list.size()-1);
            map.remove(val);
        
        return true;
    }
    
    public int getRandom() {
        int randomIndex = random.nextInt(list.size());
        return list.get(randomIndex);
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * RandomizedSet obj = new RandomizedSet();
 * boolean param_1 = obj.insert(val);
 * boolean param_2 = obj.remove(val);
 * int param_3 = obj.getRandom();
 */
