package _K_t
{
   public class _J_M_
   {
       
      
      private var _06d:Vector.<_K_t._fr>;
      
      private var selected:_K_t._fr;
      
      public function _J_M_(param1:Vector.<_K_t._fr>)
      {
         super();
         this._06d = param1;
      }
      
      public function setSelected(param1:String) : void
      {
         var _loc2_:_K_t._fr = null;
         for each(_loc2_ in this._06d)
         {
            if(_loc2_.getValue() == param1)
            {
               this._6B_(_loc2_);
               return;
            }
         }
      }
      
      public function _1H_j() : _K_t._fr
      {
         return this.selected;
      }
      
      private function _6B_(param1:_K_t._fr) : void
      {
         if(this.selected != null)
         {
            this.selected.setSelected(false);
         }
         this.selected = param1;
         this.selected.setSelected(true);
      }
   }
}
