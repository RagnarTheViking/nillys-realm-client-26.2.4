package _0S_w
{
   import ToolTips.ToolTip;
   import com.company.ui._0H_R_;
   import flash.filters.DropShadowFilter;
   
   public class _18M_ extends ToolTip
   {
      
      private static const _0H_p:int = 180;
       
      
      private var _7H_:_0H_R_;
      
      private var _1s5:_0H_R_;
      
      public function _18M_(param1:XML)
      {
         var _loc2_:XML = null;
         super(3552822,1,10197915,1,true);
         this._7H_ = new _0H_R_(16,16777215,false,_0H_p - 4,0);
         this._7H_.setBold(true);
         this._7H_.wordWrap = true;
         this._7H_.text = String(param1.@id);
         this._7H_._13s();
         this._7H_.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         this._7H_.x = 0;
         this._7H_.y = 0;
         addChild(this._7H_);
         var _loc3_:* = "";
         if(param1.hasOwnProperty("Group"))
         {
            _loc3_ = _loc3_ + ("Group: " + param1.Group + "\n");
         }
         if(param1.hasOwnProperty("Static"))
         {
            _loc3_ = _loc3_ + "Static\n";
         }
         if(param1.hasOwnProperty("Enemy"))
         {
            _loc3_ = _loc3_ + "Enemy\n";
            if(param1.hasOwnProperty("MaxHitPoints"))
            {
               _loc3_ = _loc3_ + ("MaxHitPoints: " + param1.MaxHitPoints + "\n");
            }
            if(param1.hasOwnProperty("Defense"))
            {
               _loc3_ = _loc3_ + ("Defense: " + param1.Defense + "\n");
            }
         }
         if(param1.hasOwnProperty("God"))
         {
            _loc3_ = _loc3_ + "God\n";
         }
         if(param1.hasOwnProperty("Quest"))
         {
            _loc3_ = _loc3_ + "Quest\n";
         }
         if(param1.hasOwnProperty("Hero"))
         {
            _loc3_ = _loc3_ + "Hero\n";
         }
         if(param1.hasOwnProperty("Encounter"))
         {
            _loc3_ = _loc3_ + "Encounter\n";
         }
         if(param1.hasOwnProperty("Level"))
         {
            _loc3_ = _loc3_ + ("Level: " + param1.Level + "\n");
         }
         if(param1.hasOwnProperty("Terrain"))
         {
            _loc3_ = _loc3_ + ("Terrain: " + param1.Terrain + "\n");
         }
         for each(_loc2_ in param1.Projectile)
         {
            _loc3_ = _loc3_ + ("Projectile " + _loc2_.@id + ": " + _loc2_.ObjectId + "\n" + "\tDamage: " + _loc2_.Damage + "\n" + "\tSpeed: " + _loc2_.Speed + "\n");
            if(_loc2_.hasOwnProperty("PassesCover"))
            {
               _loc3_ = _loc3_ + "\tPassesCover\n";
            }
            if(_loc2_.hasOwnProperty("MultiHit"))
            {
               _loc3_ = _loc3_ + "\tMultiHit\n";
            }
            if(_loc2_.hasOwnProperty("ConditionEffect"))
            {
               _loc3_ = _loc3_ + ("\t" + _loc2_.ConditionEffect + " for " + _loc2_.ConditionEffect.@duration + " secs\n");
            }
            if(_loc2_.hasOwnProperty("Parametric"))
            {
               _loc3_ = _loc3_ + "\tParametric\n";
            }
         }
         this._1s5 = new _0H_R_(14,11776947,false,_0H_p,0);
         this._1s5.wordWrap = true;
         this._1s5.text = String(_loc3_);
         this._1s5._13s();
         this._1s5.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         this._1s5.x = 0;
         this._1s5.y = this._7H_.height + 2;
         addChild(this._1s5);
      }
   }
}
