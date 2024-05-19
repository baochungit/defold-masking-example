varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp sampler2D mask_texture;
uniform lowp vec4 tint;
uniform lowp vec4 mask_position;

void main()
{
    vec4 original = texture2D(texture_sampler, var_texcoord0.xy);
    vec4 masky = texture2D(mask_texture, var_texcoord0.xy - mask_position.xy);
    float alpha_mul = 1.0 - tint.w * (1.0 - masky.a);

    original *= (alpha_mul * masky.r * tint.w);

    // Pre-multiply alpha since all runtime textures already are
    lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    gl_FragColor = original * tint_pm;
}
