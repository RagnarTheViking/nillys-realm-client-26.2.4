package _0bE_
{
   import com.company.assembleegameclient.map.Map;
   import flash.utils.getTimer;
   import flash.events.MouseEvent;
   import ToolTips.ToolTip;
   import com.company.assembleegameclient.objects.GameObject;
   import ToolTips.QuestToolTip;
   import com.company.assembleegameclient.parameters.Parameters;
   import ToolTips._0lo;
   import com.company.assembleegameclient.map.Quest;
   import com.company.assembleegameclient.map.View;
   
   public class _1rj extends _1Y_
   {
       
      
      public var map_:Map;
      
      public function _1rj(param1:Map)
      {
         super(16352321,12919330,true);
         this.map_ = param1;
      }
      
      public function refreshToolTip() : void
      {
         _0kI_(this.getToolTip(go_,getTimer()));
      }
      
      override protected function onMouseOver(param1:MouseEvent) : void
      {
         super.onMouseOver(param1);
         this.refreshToolTip();
      }
      
      override protected function onMouseOut(param1:MouseEvent) : void
      {
         super.onMouseOut(param1);
         this.refreshToolTip();
      }
      
      private function getToolTip(param1:GameObject, param2:int) : ToolTip
      {
         if(param1 == null || param1.texture_ == null)
         {
            return null;
         }
         if(this._0nl(param2))
         {
            return new QuestToolTip(go_);
         }
         if(Parameters.data_.showQuestPortraits)
         {
            return new _0lo(param1);
         }
         return null;
      }
      
      private function _0nl(param1:int) : Boolean
      {
         var _loc2_:Quest = this.map_.quest_;
         return _0K_Q_ || _loc2_.isNew(param1);
      }
      
      override public function draw(param1:int, param2:View) : void
      {
         var _loc3_:* = false;
         var _loc4_:Boolean = false;
         var _loc5_:GameObject = this.map_.quest_.getObject(param1);
         if(_loc5_ != go_)
         {
            _1G_B_(_loc5_);
            _0kI_(this.getToolTip(_loc5_,param1));
         }
         else if(go_ != null)
         {
            _loc3_ = _1mG_ is QuestToolTip;
            _loc4_ = this._0nl(param1);
            if(_loc3_ != _loc4_)
            {
               _0kI_(this.getToolTip(_loc5_,param1));
            }
         }
         super.draw(param1,param2);
      }
   }
}
