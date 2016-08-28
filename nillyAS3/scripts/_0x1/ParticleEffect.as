package _0x1
{
   import com.company.assembleegameclient.objects.GameObject;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   
   public class ParticleEffect extends GameObject
   {
       
      
      public var easyRender:Boolean;
      
      public function ParticleEffect()
      {
         super(null);
         objectId_ = _03v();
         hasShadow = false;
         this.easyRender = false;
      }
      
      public static function _gb(param1:_0wq, param2:GameObject) : ParticleEffect
      {
         switch(param1.id)
         {
            case "Healing":
               return new HealingEffect(param2);
            case "Fountain":
               return new FountainEffectBlue(param2);
            case "BlackFountain":
               return new FountainEffectRed(param2);
            case "Gas":
               return new GasEffect(param2,param1);
            case "Vent":
               return new VentEffect(param2);
            case "Bubbles":
               return new BubbleEffect(param2,param1);
            case "XMLEffect":
               return new XMLEffect(param2,param1);
            case "CustomParticles":
               return _1L_u._E_O_(param1,param2);
            default:
               return null;
         }
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         if(this.easyRender)
         {
            return this.runEasyRendering(param1,param2);
         }
         return this.runNormalRendering(param1,param2);
      }
      
      public function runNormalRendering(param1:int, param2:int) : Boolean
      {
         return false;
      }
      
      public function runEasyRendering(param1:int, param2:int) : Boolean
      {
         return false;
      }
      
      override public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
      }
   }
}
