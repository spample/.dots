// Ghostty Exaggerated Visible Cursor Trail Shader
// Thick glowing line + cursor circle, exaggerates small movements

const vec4 TRAIL_COLOR = vec4(1.0, 0.3, 0.3, 1.0); // red streak
const vec4 GLOW_COLOR  = vec4(0.2, 0.8, 1.0, 1.0); // cyan glow

const float TRAIL_WIDTH  = 0.06; // thick trail
const float GLOW_RADIUS  = 0.12; // glowing aura
const float CURSOR_SIZE  = 0.05; // cursor circle
const float DURATION     = 0.6;  // fade time
const float FADE_STRENGTH = 0.6; // trail opacity

// distance from point p to line segment a-b
float distToSegment(vec2 p, vec2 a, vec2 b) {
    vec2 pa = p - a;
    vec2 ba = b - a;
    float h = clamp(dot(pa, ba) / dot(ba, ba), 0.0, 1.0);
    return length(pa - ba * h);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    // base terminal frame
    fragColor = texture(iChannel0, fragCoord / iResolution);

    vec2 uv = fragCoord / iResolution.xy;

    // normalize cursor positions
    vec4 cur  = vec4(iCurrentCursor.xy / iResolution.xy, iCurrentCursor.zw / iResolution.xy);
    vec4 prev = vec4(iPreviousCursor.xy / iResolution.xy, iPreviousCursor.zw / iResolution.xy);

    vec2 curCenter  = cur.xy + 0.5 * cur.zw;
    vec2 prevCenter = prev.xy + 0.5 * prev.zw;

    // fade factor
    float progress = clamp((iTime - iTimeCursorChange) / DURATION, 0.0, 1.0);
    float alpha = 1.0 - progress;

    // --- exaggerated trail ---
    vec2 trailStart = prevCenter;
    vec2 trailEnd   = curCenter + (curCenter - prevCenter) * 4.0; // exaggerate distance
    float dTrail = distToSegment(uv, trailStart, trailEnd);
    float trailMask = smoothstep(TRAIL_WIDTH, 0.0, dTrail);
    fragColor = mix(fragColor, TRAIL_COLOR, trailMask * alpha * FADE_STRENGTH);

    // --- glow aura ---
    float distGlow = distance(uv, curCenter);
    float glowMask = smoothstep(GLOW_RADIUS, 0.0, distGlow);
    fragColor = mix(fragColor, GLOW_COLOR, glowMask * alpha * FADE_STRENGTH);

    // --- cursor circle ---
    float dCursor = distance(uv, curCenter);
    float cursorMask = smoothstep(CURSOR_SIZE, 0.0, dCursor);
    fragColor = mix(fragColor, GLOW_COLOR, cursorMask);
}

